import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/ads/ad_policy.dart';
import 'package:german_words/ads/ad_widgets.dart';
import 'package:german_words/ads/ads_config.dart';
import 'package:german_words/ads/ads_service.dart';
import 'package:german_words/providers/feedback_provider.dart';
import 'package:german_words/providers/stats_provider.dart';
import 'package:german_words/screens/der_die_das_screen.dart';
import 'package:german_words/screens/spelling_screen.dart';
import 'package:german_words/widgets/common.dart';

import 'helpers.dart';

/// Ads switched on, with a scripted rewarded result and no SDK.
class FakeAdsService implements AdsService {
  FakeAdsService({this.reward = RewardResult.earned});

  RewardResult reward;
  int rewardedShown = 0;
  int roundsFinished = 0;

  @override
  bool get enabled => true;

  @override
  final ValueListenable<bool> ready = ValueNotifier(false);

  @override
  final ValueNotifier<bool> privacyOptionsRequired = ValueNotifier(false);

  @override
  Future<void> start() async {}

  @override
  Future<void> showPrivacyOptions() async {}

  @override
  String? get bannerUnit => null;

  @override
  Future<RewardResult> showRewarded() async {
    rewardedShown++;
    return reward;
  }

  @override
  Future<void> roundFinished() async => roundsFinished++;
}

void main() {
  final t0 = DateTime(2026, 11, 8, 12);

  test('interstitials: never in the first session', () {
    final p = InterstitialPolicy(firstSession: true);
    for (var i = 0; i < 10; i++) {
      expect(p.roundFinished(t0.add(Duration(minutes: 5 * i))), isFalse);
    }
  });

  test('interstitials: every 3rd round, at least 2 minutes apart', () {
    final p = InterstitialPolicy(firstSession: false);
    expect(p.roundFinished(t0), isFalse);
    expect(p.roundFinished(t0), isFalse);
    expect(p.roundFinished(t0), isTrue);
    p.interstitialShown(t0);

    final soon = t0.add(const Duration(seconds: 30));
    for (var i = 0; i < 3; i++) {
      p.roundFinished(soon);
    }
    expect(p.roundFinished(soon), isFalse, reason: 'under 2 minutes');
    expect(p.roundFinished(t0.add(const Duration(minutes: 3))), isTrue);
  });

  test('interstitials: quiet for a minute after a rewarded ad', () {
    final p = InterstitialPolicy(firstSession: false)
      ..rewardedShown(t0)
      ..roundFinished(t0)
      ..roundFinished(t0);
    expect(p.roundFinished(t0.add(const Duration(seconds: 30))), isFalse);
    expect(p.roundFinished(t0.add(const Duration(minutes: 2))), isTrue);
  });

  test('hint quota: unlimited with ads off, 3 then refills with ads on', () {
    final off = HintQuota(limited: false);
    for (var i = 0; i < 50; i++) {
      expect(off.use(), isTrue);
    }
    final on = HintQuota(limited: true);
    expect([on.use(), on.use(), on.use(), on.use()], [true, true, true, false]);
    on.refill();
    expect(on.left, HintQuota.perReward);
  });

  test('Android: release uses the real ids, debug keeps test ids', () {
    expect(
      adUnitFor(AdKind.banner, android: true, release: true),
      'ca-app-pub-5964569110696877/2103685971',
    );
    expect(
      adUnitFor(AdKind.interstitial, android: true, release: true),
      'ca-app-pub-5964569110696877/7575504506',
    );
    expect(
      adUnitFor(AdKind.rewarded, android: true, release: true),
      'ca-app-pub-5964569110696877/9569057117',
    );
    for (final kind in AdKind.values) {
      final debug = adUnitFor(kind, android: true, release: false);
      expect(debug, startsWith('ca-app-pub-3940256099942544/'));
      expect(
        adUnitFor(kind, android: true, release: true, forceTest: true),
        debug,
        reason: 'ADS_TEST_UNITS QA builds use test units in release',
      );
    }
    expect(AdMobIds.androidApp, 'ca-app-pub-5964569110696877~7110414739');
  });

  test('iOS has no AdMob app yet: no units at all, ads are a no-op', () {
    expect(platformHasAdMobApp(android: false), isFalse);
    expect(platformHasAdMobApp(android: true), isTrue);
    for (final kind in AdKind.values) {
      expect(adUnitFor(kind, android: false, release: true), isNull);
      expect(adUnitFor(kind, android: false, release: false), isNull);
    }
  });

  test('a streak lost by one day can be restored, not an older one', () async {
    final clock = TestClock(DateTime(2026, 11, 8, 9));
    final c = await createContainer(
      clock: clock,
      prefs: {
        'stats_points': 40,
        'stats_streak': 6,
        'stats_last_day': '2026-11-06',
      },
    );
    expect(c.read(currentStreakProvider), 0);
    expect(c.read(restorableStreakProvider), 6);

    c.read(statsProvider.notifier).restoreStreak();
    expect(c.read(currentStreakProvider), 6);
    c.read(statsProvider.notifier).addPoints(1);
    expect(c.read(currentStreakProvider), 7);

    clock.now = DateTime(2026, 11, 12, 9);
    c.invalidate(restorableStreakProvider);
    expect(c.read(restorableStreakProvider), 0, reason: 'missed 3 days');
  });

  testWidgets('with ads on, the 4th hint offers a rewarded ad', (tester) async {
    final ads = FakeAdsService();
    final c = await createContainer(ads: ads);
    final words = deck.where((w) => w.isNoun).take(2).toList();
    await tester.pumpWidget(buildScreen(c, SpellingScreen(words: words)));

    for (var i = 0; i < 3; i++) {
      await tester.tap(find.byTooltip('Hint'));
      await tester.pumpAndSettle();
    }
    expect(find.text('Out of hints'), findsNothing);

    await tester.tap(find.byTooltip('Hint'));
    await tester.pumpAndSettle();
    expect(find.text('Out of hints'), findsOneWidget);
    await tester.tap(find.text('Watch ad'));
    await tester.pumpAndSettle();
    expect(ads.rewardedShown, 1);
    expect(find.text('Out of hints'), findsNothing);
  });

  testWidgets('with ads off, hints stay unlimited and no ad UI shows', (
    tester,
  ) async {
    final c = await createContainer();
    final words = deck.where((w) => w.isNoun).take(1).toList();
    await tester.pumpWidget(buildScreen(c, SpellingScreen(words: words)));
    for (var i = 0; i < 6; i++) {
      await tester.tap(find.byTooltip('Hint'));
      await tester.pumpAndSettle();
    }
    expect(find.text('Out of hints'), findsNothing);
  });

  testWidgets('Der Die Das summary: double points and a counted round', (
    tester,
  ) async {
    final ads = FakeAdsService();
    final c = await createContainer(ads: ads);
    final nouns = deck.where((w) => w.isNoun).take(1).toList();
    await tester.pumpWidget(buildScreen(c, const DerDieDasScreen()));
    // Answer every noun right until the summary shows.
    for (var i = 0; i < derDieDasRounds; i++) {
      final shown = deck.where(
        (w) => w.isNoun && find.text(w.german).evaluate().isNotEmpty,
      );
      final noun = shown.isEmpty ? nouns.first : shown.first;
      final label =
          '${noun.gender!.name[0].toUpperCase()}${noun.gender!.name.substring(1)}';
      await tester.tap(find.text(label));
      // Feedback lasts up to 3 s when a gender hint is shown.
      await tester.pump(const Duration(seconds: 4));
    }
    await tester.pumpAndSettle();
    final points = c.read(statsProvider).points;
    expect(find.textContaining('Double points'), findsOneWidget);

    await tester.tap(find.textContaining('Double points'));
    await tester.pumpAndSettle();
    expect(c.read(statsProvider).points, points * 2);

    await tester.tap(find.text('PLAY AGAIN'));
    await tester.pumpAndSettle();
    expect(ads.roundsFinished, 1);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('Der Die Das: a combo badge, sounds, stars and a new best', (
    tester,
  ) async {
    final sounds = FakeFeedbackEngine();
    final c = await createContainer(feedback: sounds);
    await tester.pumpWidget(buildScreen(c, const DerDieDasScreen()));
    for (var i = 0; i < derDieDasRounds; i++) {
      final noun = deck.firstWhere(
        (w) => w.isNoun && find.text(w.german).evaluate().isNotEmpty,
      );
      final name = noun.gender!.name;
      await tester.tap(
        find.text('${name[0].toUpperCase()}${name.substring(1)}'),
      );
      await tester.pump();
      if (i == 2) expect(find.text('🔥 ×3'), findsOneWidget);
      await tester.pump(const Duration(seconds: 4));
    }
    await tester.pumpAndSettle();
    expect(tester.widget<StarRow>(find.byType(StarRow)).stars, 3);
    expect(find.text('NEW BEST!'), findsOneWidget);
    expect(find.text('Best combo: 20 in a row'), findsOneWidget);
    // 20 answers: 20 x 1, +1 for answers 3-5, +2 for answers 6-20 = 53.
    expect(find.text('+53 points'), findsOneWidget);
    expect(sounds.played.last, GameSound.roundEnd);
    expect(sounds.played.where((s) => s == GameSound.combo), hasLength(18));
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('house-ad slot stays hidden until a sibling is live', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: HouseAdCard())),
    );
    expect(find.text('More German from Pratiyush'), findsNothing);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: HouseAdCard(
            day: 0,
            apps: [
              SiblingApp(
                name: 'Lernle',
                pitch: 'Read real German stories',
                androidPackage: 'com.pratiyush.lernle',
                appStoreId: '1',
              ),
            ],
          ),
        ),
      ),
    );
    expect(find.text('More German from Pratiyush'), findsOneWidget);
  });
}
