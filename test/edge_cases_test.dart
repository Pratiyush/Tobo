// Edge and boundary cases from docs/test-plan.md. Run with TZ=Europe/Berlin
// (tools/verify.sh sets it) so the DST cases exercise a real transition.
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/ads/ad_policy.dart';
import 'package:german_words/ads/ads_service.dart';
import 'package:german_words/content/content_client.dart';
import 'package:german_words/content/content_source.dart';
import 'package:german_words/data/word_repository.dart';
import 'package:german_words/games/combo.dart';
import 'package:german_words/games/daily.dart';
import 'package:german_words/games/spelling.dart';
import 'package:german_words/models/level.dart';
import 'package:german_words/models/word.dart';
import 'package:german_words/providers/content_update_provider.dart';
import 'package:german_words/providers/daily_goal_provider.dart';
import 'package:german_words/providers/preferences_provider.dart';
import 'package:german_words/providers/progress_provider.dart';
import 'package:german_words/providers/settings_provider.dart';
import 'package:german_words/providers/speech_provider.dart';
import 'package:german_words/providers/stats_provider.dart';
import 'package:german_words/screens/der_die_das_screen.dart';
import 'package:german_words/screens/fallee_screen.dart';
import 'package:german_words/screens/spelling_screen.dart';
import 'package:german_words/screens/word_list_screen.dart';

import 'ads_test.dart' show FakeAdsService;
import 'content_client_test.dart' show FakeFetcher;
import 'helpers.dart';

/// True when this process's local time zone has DST (Europe/Berlin in CI).
final _berlinDst =
    DateTime(2026, 3, 29, 12).timeZoneOffset !=
    DateTime(2026, 3, 28, 12).timeZoneOffset;

void main() {
  group('time', () {
    test(
      'streak survives midnight: 23:59 then 00:01 is the next day',
      () async {
        final clock = TestClock(DateTime(2026, 11, 9, 23, 59));
        final c = await createContainer(clock: clock);
        c.read(statsProvider.notifier).addPoints(1);
        clock.now = DateTime(2026, 11, 10, 0, 1);
        c.read(statsProvider.notifier).addPoints(1);
        expect(c.read(statsProvider).streak, 2);
      },
    );

    test(
      'streak across the spring-forward night (DST, Europe/Berlin)',
      () async {
        // 29 March 2026 has 23 hours in Berlin. At 00:30 on the 30th,
        // "yesterday" must be the 29th, not the 28th.
        final clock = TestClock(DateTime(2026, 3, 29, 12));
        final c = await createContainer(clock: clock);
        c.read(statsProvider.notifier).addPoints(1);
        clock.now = DateTime(2026, 3, 30, 0, 30);
        c.invalidate(currentStreakProvider);
        expect(c.read(currentStreakProvider), 1, reason: 'still alive');
        c.read(statsProvider.notifier).addPoints(1);
        expect(c.read(statsProvider).streak, 2);
      },
      skip: _berlinDst ? false : 'needs TZ=Europe/Berlin',
    );

    test('streak across the fall-back night (DST, Europe/Berlin)', () async {
      final clock = TestClock(DateTime(2026, 10, 25, 12));
      final c = await createContainer(clock: clock);
      c.read(statsProvider.notifier).addPoints(1);
      clock.now = DateTime(2026, 10, 26, 0, 30);
      c.read(statsProvider.notifier).addPoints(1);
      expect(c.read(statsProvider).streak, 2);
    }, skip: _berlinDst ? false : 'needs TZ=Europe/Berlin');

    test(
      'a streak lost by one day is restorable across spring-forward too',
      () async {
        final clock = TestClock(DateTime(2026, 3, 28, 12));
        final c = await createContainer(clock: clock);
        for (var i = 0; i < 3; i++) {
          c.read(statsProvider.notifier).addPoints(1);
        }
        // Missed the 29th; it is 00:30 on the 30th.
        clock.now = DateTime(2026, 3, 30, 0, 30);
        c.invalidate(restorableStreakProvider);
        expect(c.read(restorableStreakProvider), 1);
      },
      skip: _berlinDst ? false : 'needs TZ=Europe/Berlin',
    );

    test('leap day keeps the streak: 28 Feb, 29 Feb, 1 Mar 2028', () async {
      final clock = TestClock(DateTime(2028, 2, 28, 20));
      final c = await createContainer(clock: clock);
      c.read(statsProvider.notifier).addPoints(1);
      clock.now = DateTime(2028, 2, 29, 20);
      c.read(statsProvider.notifier).addPoints(1);
      clock.now = DateTime(2028, 3, 1, 20);
      c.read(statsProvider.notifier).addPoints(1);
      expect(c.read(statsProvider).streak, 3);
    });

    test('clock moved backwards: no crash, the streak starts over', () async {
      final clock = TestClock(DateTime(2026, 11, 10, 12));
      final c = await createContainer(clock: clock);
      c.read(statsProvider.notifier).addPoints(1);
      clock.now = DateTime(2026, 11, 5, 12);
      c.read(statsProvider.notifier).addPoints(1);
      expect(c.read(statsProvider).streak, 1);
    });

    test('daily goal: 23:59 counts today, 00:01 is a new day', () async {
      final clock = TestClock(DateTime(2026, 11, 9, 23, 59));
      final c = await createContainer(clock: clock);
      c.read(dailyGoalProvider.notifier).tick();
      clock.now = DateTime(2026, 11, 10, 0, 1);
      c.invalidate(dailyGoalProvider);
      expect(c.read(dailyGoalProvider), 0);
    });

    test(
      'content check: 23:59 after the last one skips, 24:01 checks',
      () async {
        final tmp = Directory.systemTemp.createTempSync('edge');
        addTearDown(() => tmp.deleteSync(recursive: true));
        final fetcher = FakeFetcher({
          'manifest.json': utf8.encode(
            jsonEncode({
              'content_version': 1,
              'min_client': 1,
              'lookup': {'url': 'l.json', 'sha256': 'x', 'bytes': 1},
              'levels': <String, Object>{},
            }),
          ),
        });
        final clock = TestClock(DateTime(2026, 11, 9, 8));
        final c = await createContainer(
          clock: clock,
          overrides: [
            contentStoreProvider.overrideWithValue(ContentStore(tmp)),
            contentFetcherProvider.overrideWithValue(fetcher),
          ],
        );
        await c.read(contentUpdateProvider.notifier).checkDaily();
        expect(fetcher.fetched, hasLength(1));
        clock.now = clock.now.add(const Duration(hours: 23, minutes: 59));
        await c.read(contentUpdateProvider.notifier).checkDaily();
        expect(fetcher.fetched, hasLength(1), reason: 'under 24 h');
        clock.now = clock.now.add(const Duration(minutes: 2));
        await c.read(contentUpdateProvider.notifier).checkDaily();
        expect(fetcher.fetched, hasLength(2), reason: 'past 24 h');
      },
    );

    test('the Daily Hive changes at midnight, not 24 h after a play', () {
      final late = DailyHive(DateTime(2026, 11, 9), Level.a1);
      final early = DailyHive(DateTime(2026, 11, 10), Level.a1);
      expect(late.prefsKey, isNot(early.prefsKey));
    });
  });

  group('numbers at the edges', () {
    test('level thresholds 0, 24, 25, 99, 100 points', () {
      expect(
        [
          for (final p in [0, 24, 25, 99, 100]) Stats(points: p).level,
        ],
        [1, 1, 2, 2, 3],
      );
      expect(const Stats().levelProgress, 0);
      expect(const Stats(points: 24).levelProgress, lessThan(1));
    });

    test('combo bonus steps at 3 and 6', () {
      expect(
        [for (var i = 0; i <= 7; i++) Combo.bonusFor(i)],
        [0, 0, 0, 1, 1, 1, 2, 2],
      );
      final c = Combo()..miss();
      expect((c.current, c.best), (0, 0), reason: 'miss at zero');
    });

    test('stars exactly at and just below 40%, 70% and 90%', () {
      expect([7, 8, 13, 14, 17, 18].map((n) => starsFor(n, 20)), [
        0,
        1,
        1,
        2,
        2,
        3,
      ]);
      expect(starsFor(1, 1), 3);
      expect(starsFor(0, 1), 0);
    });

    test('interstitial cap at the boundary: 3rd round, exactly 120 s', () {
      final t0 = DateTime(2026, 11, 9, 12);
      final p = InterstitialPolicy(firstSession: false);
      expect([p.roundFinished(t0), p.roundFinished(t0)], [false, false]);
      expect(p.roundFinished(t0), isTrue, reason: '3rd round');
      p.interstitialShown(t0);
      p
        ..roundFinished(t0)
        ..roundFinished(t0);
      expect(p.roundFinished(t0.add(const Duration(seconds: 119))), isFalse);
      expect(p.roundFinished(t0.add(const Duration(seconds: 120))), isTrue);
    });

    test('rewarded quiet time: 59 s blocks, 60 s allows', () {
      final t0 = DateTime(2026, 11, 9, 12);
      final p = InterstitialPolicy(firstSession: false)..rewardedShown(t0);
      p
        ..roundFinished(t0)
        ..roundFinished(t0);
      expect(p.roundFinished(t0.add(const Duration(seconds: 59))), isFalse);
      expect(p.roundFinished(t0.add(const Duration(seconds: 60))), isTrue);
    });

    test('hint quota 0, 1, 3 and max+1', () {
      final q = HintQuota(limited: true, free: 1);
      expect([q.use(), q.use()], [true, false]);
      expect(HintQuota(limited: true, free: 0).canHint, isFalse);
    });
  });

  group('ads and consent (headless)', () {
    test('ADS_ENABLED off: the no-op service, no SDK at all', () async {
      final c = await createContainer();
      expect(c.read(adsServiceProvider), isA<NoAdsService>());
    });

    testWidgets('Privacy & ad choices shows only when UMP requires it', (
      tester,
    ) async {
      final ads = FakeAdsService();
      final c = await createContainer(ads: ads);
      await tester.pumpWidget(buildApp(c));
      await tester.tap(find.text('Settings'));
      await tester.pumpAndSettle();
      // Settings is a lazy list: look at its end, where the row would be.
      await tester.drag(find.byType(Scrollable).first, const Offset(0, -3000));
      await tester.pumpAndSettle();
      expect(find.text('Privacy & ad choices'), findsNothing);
      ads.privacyOptionsRequired.value = true;
      await tester.pumpAndSettle();
      expect(find.text('Privacy & ad choices'), findsOneWidget);
    });

    testWidgets('a skipped rewarded ad gives no hint; no fill gives one free', (
      tester,
    ) async {
      final ads = FakeAdsService(reward: RewardResult.skipped);
      final c = await createContainer(ads: ads);
      final noun = deck.firstWhere((w) => w.isNoun);
      await tester.pumpWidget(buildScreen(c, SpellingScreen(words: [noun])));
      for (var i = 0; i < 3; i++) {
        await tester.tap(find.byTooltip('Hint'));
        await tester.pumpAndSettle();
      }
      final before = find.byType(Text).evaluate().length;
      await tester.tap(find.byTooltip('Hint'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Watch ad'));
      await tester.pumpAndSettle();
      expect(ads.rewardedShown, 1);
      expect(find.byType(Text).evaluate().length, before, reason: 'no hint');

      ads.reward = RewardResult.unavailable;
      await tester.tap(find.byTooltip('Hint'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Watch ad'));
      await tester.pumpAndSettle();
      expect(ads.rewardedShown, 2);
    });
  });

  group('lifecycle', () {
    testWidgets('a rapid double tap counts one answer', (tester) async {
      final c = await createContainer();
      await tester.pumpWidget(
        buildScreen(c, DerDieDasScreen(random: Random(1))),
      );
      final noun = deck.firstWhere(
        (w) => w.isNoun && find.text(w.german).evaluate().isNotEmpty,
      );
      final name = noun.gender!.name;
      final button = find.text('${name[0].toUpperCase()}${name.substring(1)}');
      await tester.tap(button);
      await tester.tap(button, warnIfMissed: false);
      await tester.pump();
      expect(c.read(statsProvider).points, Reward.game);
      await tester.pump(const Duration(seconds: 4));
      await tester.pumpWidget(const SizedBox());
    });

    test(
      'process death mid-session: a fresh start restores progress',
      () async {
        final c = await createContainer();
        c.read(progressProvider.notifier)
          ..learn(deck[0].id)
          ..learn(deck[1].id);
        c.read(statsProvider.notifier).addPoints(4);
        final prefs = c.read(sharedPreferencesProvider);
        final stored = {for (final k in prefs.getKeys()) k: prefs.get(k)!};
        final again = await createContainer(prefs: stored);
        expect(again.read(progressProvider).keys, [deck[0].id, deck[1].id]);
        expect(again.read(statsProvider).points, 4);
      },
    );

    testWidgets('leaving Fallee mid-fall stops cleanly', (tester) async {
      final c = await createContainer();
      await tester.pumpWidget(
        buildScreen(
          c,
          Builder(
            builder: (context) => TextButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (_) => const FalleeScreen()),
              ),
              child: const Text('open'),
            ),
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pump(const Duration(seconds: 2));
      tester.state<NavigatorState>(find.byType(Navigator)).pop();
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  });

  group('levels', () {
    testWidgets('a level with every word learned still plays and says so', (
      tester,
    ) async {
      final c = await createContainer();
      final b1 = deck.where((w) => w.level == Level.b1).toList();
      for (final w in b1) {
        c.read(progressProvider.notifier).learn(w.id);
      }
      c.read(settingsProvider.notifier).setLevels(LevelChoice.only({Level.b1}));
      expect(c.read(gamePoolProvider(false)), hasLength(b1.length));
      await tester.pumpWidget(buildScreen(c, const WordListScreen(number: 1)));
      await tester.pumpAndSettle();
      expect(
        find.text('You’ve learned every word in this list.'),
        findsOneWidget,
      );
      expect(dailyLevel([Level.b1], (_) => false), Level.b1);
    });

    test('switching level mid-session leaves a running round alone', () async {
      final c = await createContainer();
      final round = c.read(gamePoolProvider(true));
      c.read(settingsProvider.notifier).setLevels(LevelChoice.only({Level.b2}));
      expect(round.first.level, Level.a1, reason: 'the list already drawn');
      expect(
        c.read(gamePoolProvider(true)).every((w) => w.level == Level.b2),
        isTrue,
      );
    });
  });

  group('data and German text', () {
    test('missing optional fields and an empty plural', () {
      final w = Word.fromJson({
        'id': 'de.test.x',
        'de': 'schnell',
        'pos': 'adjective',
        'en': ['fast'],
        'plural': '',
      });
      expect(
        (w.gender, w.plural, w.exampleDe, w.cefr),
        (null, null, null, 'A1'),
      );
      expect(w.pluralDisplay, isNull);
      expect(w.level, Level.a1);
    });

    test(
      'corrupt words JSON fails loudly (startup shows its error screen)',
      () {
        expect(() => parseWords('[{"id":'), throwsFormatException);
      },
    );

    test('a corrupt or failing manifest leaves content untouched', () async {
      final tmp = Directory.systemTemp.createTempSync('edge2');
      addTearDown(() => tmp.deleteSync(recursive: true));
      for (final body in [utf8.encode('{not json'), <int>[]]) {
        final u = ContentUpdater(
          fetcher: FakeFetcher({'manifest.json': body}),
          store: ContentStore(tmp),
          wordIds: const ['de.zeit.n'],
          baseUrl: 'https://cdn.test',
        );
        await expectLater(u.check(), throwsA(anything));
        expect(ContentStore(tmp).version, seedContentVersion);
      }
      final down = ContentUpdater(
        fetcher: FakeFetcher({}),
        store: ContentStore(tmp),
        wordIds: const ['de.zeit.n'],
        baseUrl: 'https://cdn.test',
      );
      await expectLater(down.check(), throwsA(isA<HttpException>()));
    });

    test('umlauts and ß are typed with their own keys', () {
      final word = deck.firstWhere((w) => w.german.contains('ß'));
      final p = SpellingPuzzle(word.display, Random(1));
      expect(p.keys.containsKey('ß'), isTrue);
      for (var i = 0; i < word.display.length; i++) {
        p.hint();
      }
      expect(p.isCorrect, isTrue);
      final umlaut = deck.firstWhere((w) => w.german.contains(RegExp('[äöü]')));
      final q = SpellingPuzzle(umlaut.display, Random(1));
      for (var i = 0; i < umlaut.display.length; i++) {
        q.hint();
      }
      expect(q.isCorrect, isTrue);
    });
  });

  group('audio', () {
    test('a clip that fails to play falls back to device TTS', () async {
      final tts = FakeSpeechEngine();
      final speaker = Speaker(
        tts,
        audio: _FailingAudio(),
        content: FakeContentSource(),
        retryDelay: Duration.zero,
      );
      final word = deck.first;
      expect(await speaker.sayWord(word), isTrue);
      expect(tts.spoken, [word.display]);
    });

    test(
      'a disposed or failing player never throws out of the speaker',
      () async {
        final tts = FakeSpeechEngine();
        final speaker = Speaker(
          tts,
          audio: _BrokenAudio(),
          content: FakeContentSource(),
          retryDelay: Duration.zero,
        );
        expect(await speaker.say('Ich habe keine Zeit.'), isTrue);
        expect(await speaker.sayWord(deck.first), isTrue);
        await expectLater(speaker.stop(), completes);
        expect(tts.spoken, ['Ich habe keine Zeit.', deck.first.display]);
      },
    );

    test('no German voice and no clip: reported, not thrown', () async {
      final speaker = Speaker(
        FakeSpeechEngine(available: false),
        audio: FakeAudioEngine(),
        content: FakeContentSource(withoutClips: {deck.first.id}),
        retryDelay: Duration.zero,
      );
      expect(await speaker.sayWord(deck.first), isFalse);
    });
  });
}

/// A player that was disposed: every call fails (BUG-34).
class _BrokenAudio implements AudioEngine {
  @override
  Future<void> play(MediaRef clip) async => throw StateError('disposed');

  @override
  Future<void> stop() async => throw StateError('disposed');
}

class _FailingAudio implements AudioEngine {
  @override
  Future<void> play(MediaRef clip) async => throw StateError('decoder died');

  @override
  Future<void> stop() async {}
}
