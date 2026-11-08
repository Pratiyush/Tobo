// End-to-end tests on a real device or simulator: real assets, real clip
// playback, real SharedPreferences.
//
//   flutter test integration_test -d <device>
//   # with store screenshots in build/screenshots/:
//   flutter drive --driver=test_driver/integration_test.dart \
//     --target=integration_test/app_e2e_test.dart -d <device> \
//     --dart-define=SCREENSHOTS=true
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/app.dart';
import 'package:german_words/content/content_source.dart';
import 'package:german_words/games/hive.dart';
import 'package:german_words/models/word.dart';
import 'package:german_words/widgets/level_badge.dart';
import 'package:german_words/models/level.dart';
import 'package:german_words/providers/daily_goal_provider.dart';
import 'package:german_words/providers/daily_hive_provider.dart';
import 'package:german_words/providers/feedback_provider.dart';
import 'package:german_words/providers/preferences_provider.dart';
import 'package:german_words/providers/progress_provider.dart';
import 'package:german_words/providers/settings_provider.dart';
import 'package:german_words/providers/speech_provider.dart';
import 'package:german_words/providers/stats_provider.dart';
import 'package:german_words/providers/words_provider.dart';
import 'package:german_words/screens/hive_screen.dart';
import 'package:german_words/widgets/common.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _screenshots = bool.fromEnvironment('SCREENSHOTS');

/// The real player, plus a record of what it was asked to play.
class RecordingAudioEngine implements AudioEngine {
  final inner = AudioPlayersEngine();
  final played = <MediaRef>[];

  @override
  Future<void> play(MediaRef clip) {
    played.add(clip);
    return inner.play(clip);
  }

  @override
  Future<void> stop() => inner.stop();
}

class MovableClock {
  DateTime now = DateTime.now();
  DateTime call() => now;
}

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late SharedPreferences prefs;
  late BundledContentSource content;
  late List<Word> words;
  late RecordingAudioEngine audio;
  late MovableClock clock;
  var surfaceConverted = false;

  setUpAll(() async {
    content = BundledContentSource();
    words = await content.loadWords();
    prefs = await SharedPreferences.getInstance();
    audio = RecordingAudioEngine();
  });

  setUp(() async {
    await prefs.clear();
    await prefs.setBool('onboarded', true);
    audio.played.clear();
    // Android needs the surface converted once per test, not once per run.
    surfaceConverted = false;
    clock = MovableClock();
  });

  Future<ProviderContainer> launch(WidgetTester tester) async {
    final c = ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        contentSourceProvider.overrideWithValue(content),
        wordsProvider.overrideWithValue(words),
        audioEngineProvider.overrideWithValue(audio),
        clockProvider.overrideWithValue(clock.call),
      ],
    );
    addTearDown(c.dispose);
    await tester.pumpWidget(
      UncontrolledProviderScope(container: c, child: const GermanWordsApp()),
    );
    await tester.pumpAndSettle();
    return c;
  }

  /// [settle] false for screens that animate continuously (Fallee).
  Future<void> shot(
    WidgetTester tester,
    String name, {
    bool settle = true,
  }) async {
    if (!_screenshots) return;
    if (Platform.isAndroid && !surfaceConverted) {
      await binding.convertFlutterSurfaceToImage();
      surfaceConverted = true;
    }
    settle ? await tester.pumpAndSettle() : await tester.pump();
    await binding.takeScreenshot(name);
  }

  /// Pumps until [done] holds; platform calls finish on their own time.
  Future<void> pumpUntil(WidgetTester tester, bool Function() done) async {
    final end = DateTime.now().add(const Duration(seconds: 10));
    while (!done() && DateTime.now().isBefore(end)) {
      await tester.pump(const Duration(milliseconds: 100));
    }
  }

  Future<void> tapText(WidgetTester tester, String text) async {
    await tester.ensureVisible(find.text(text).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text(text).first);
    await tester.pumpAndSettle();
  }

  /// Learns the first [n] words of list 1 with "Know it".
  Future<void> learn(WidgetTester tester, int n) async {
    await tapText(tester, 'Words 1');
    await tapText(tester, 'LEARN');
    for (var i = 0; i < n; i++) {
      await tapText(tester, 'FLIP');
      if (i == 0) await shot(tester, '02-learn');
      await tapText(tester, 'KNOW IT');
    }
    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.pageBack();
    await tester.pumpAndSettle();
  }

  testWidgets('home lists the words; Learn grows vocabulary and points', (
    tester,
  ) async {
    final c = await launch(tester);
    expect(find.text('WORTSCHATZ'), findsOneWidget);
    expect(find.byKey(const ValueKey('start-here')), findsOneWidget);
    await shot(tester, '01-home');

    await learn(tester, 3);
    expect(c.read(progressProvider), hasLength(3));
    expect(c.read(dailyGoalProvider), 3);
    expect(find.byKey(const ValueKey('daily-goal')), findsOneWidget);
    expect(c.read(statsProvider).points, 3 * Reward.learn);
    expect(prefs.getString('word_progress'), contains(words.first.id));
  });

  testWidgets('a word plays its recorded clip to the end', (tester) async {
    await launch(tester);
    await tapText(tester, 'Words 1');
    final done = audio.inner.onComplete.first;

    await tester.tap(find.byTooltip('Listen').first);
    await pumpUntil(tester, () => audio.played.isNotEmpty);
    expect(audio.played, [AssetMedia('$audioDir/${words.first.id}.mp3')]);
    // Completion comes from the platform player: the clip really decoded
    // and played on the device.
    await done.timeout(const Duration(seconds: 10));
    expect(find.textContaining('No German voice'), findsNothing);
    // Let the button's ink ripple finish before the tree is torn down.
    await tester.pumpAndSettle();
  });

  testWidgets('Practice: due words are spelled, with hints, for points', (
    tester,
  ) async {
    final c = await launch(tester);
    await learn(tester, 2);
    clock.now = clock.now.add(const Duration(days: 1));
    c
      ..invalidate(dueWordsProvider)
      ..invalidate(currentStreakProvider);
    await tester.pumpAndSettle();

    await tapText(tester, 'Practice');
    expect(find.textContaining('2 items'), findsOneWidget);
    await tapText(tester, 'Spell the words that are due');
    await shot(tester, '03-practice');
    final before = c.read(statsProvider).points;
    final word = words.first;
    for (var i = 0; i < word.display.length; i++) {
      await tester.tap(find.byTooltip('Hint'));
      await tester.pump();
    }
    await tester.tap(find.byTooltip('Check'));
    await tester.pumpAndSettle();
    expect(find.text('Richtig!'), findsOneWidget);
    expect(c.read(statsProvider).points, before + Reward.game);
  });

  testWidgets('Hive: tracing a word solves it and scores', (tester) async {
    final c = await launch(tester);
    await tapText(tester, 'Practice');
    await tapText(tester, 'Hive');
    await shot(tester, '04-hive');

    final state = tester.state(find.byType(HiveScreen));
    final path = (state as dynamic).debugTargetPath as List<Hex>;
    for (final hex in path) {
      await tester.tap(
        find.byKey(ValueKey('hex-${hex.q}-${hex.r}')),
        warnIfMissed: false,
      );
      await tester.pump();
    }
    await tester.pumpAndSettle();
    expect(find.text('Word 2 of $hiveWordsPerRound'), findsOneWidget);
    expect(c.read(statsProvider).points, Reward.hiveWord);
  });

  testWidgets('Der Die Das: combo, sounds and a juicy round end', (
    tester,
  ) async {
    final c = await launch(tester);
    await tapText(tester, 'Practice');
    await tapText(tester, 'Der Die Das');

    for (var i = 0; i < 20; i++) {
      final noun = words.firstWhere(
        (w) => w.isNoun && find.text(w.german).evaluate().isNotEmpty,
      );
      final name = noun.gender!.name;
      await tester.tap(
        find.text('${name[0].toUpperCase()}${name.substring(1)}'),
      );
      await tester.pump();
      if (i == 0) {
        expect(find.text('Richtig!'), findsOneWidget);
        expect(c.read(statsProvider).points, Reward.game);
      }
      if (i == 3) {
        expect(find.text('🔥 ×4'), findsOneWidget);
        await shot(tester, '05-der-die-das', settle: false);
      }
      // Wait for the next noun (feedback lasts up to 3 s with a rule hint),
      // or for the summary after the last one.
      final next = i + 2 <= 20 ? '${i + 2}/20' : null;
      await pumpUntil(
        tester,
        () => next == null
            ? find.byType(StarRow).evaluate().isNotEmpty
            : find.text(next).evaluate().isNotEmpty,
      );
      if ((next == null && find.byType(StarRow).evaluate().isEmpty) ||
          (next != null && find.text(next).evaluate().isEmpty)) {
        final texts = find
            .byType(Text)
            .evaluate()
            .map((e) => (e.widget as Text).data)
            .whereType<String>()
            .take(12);
        fail('stuck after answer ${i + 1}; on screen: ${texts.join(' | ')}');
      }
    }
    await tester.pump(const Duration(seconds: 2));
    expect(tester.widget<StarRow>(find.byType(StarRow)).stars, 3);
    expect(find.text('NEW BEST!'), findsOneWidget);
    expect(find.text('+53 points'), findsOneWidget);
    expect(c.read(bestScoresProvider)['derdiedas'], 20);
    await shot(tester, '08-round-end');
  });

  testWidgets('Fallee: real fall speed, and the right meaning scores', (
    tester,
  ) async {
    final c = await launch(tester);
    await tapText(tester, 'Practice');
    await tester.tap(find.text('Fallee'));
    // Not pumpAndSettle: the fall animates continuously.
    await tester.pump(const Duration(seconds: 2));
    // Emulators often run with animations off; the word must still take
    // seconds to fall, not 0.3 s.
    expect(find.text('1/15'), findsOneWidget);
    await shot(tester, '06-fallee', settle: false);

    final word = words.firstWhere(
      (w) => find.text(w.display).evaluate().isNotEmpty,
    );
    await tester.tap(find.text(word.meaning).last);
    await tester.pump();
    expect(c.read(statsProvider).points, Reward.game);
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('2/15'), findsOneWidget);
    // Leave so the fall stops.
    await tester.pageBack();
    await tester.pumpAndSettle();
  });

  testWidgets('Settings: switches persist; reset forgets progress', (
    tester,
  ) async {
    final c = await launch(tester);
    await learn(tester, 1);
    await tapText(tester, 'Settings');
    await shot(tester, '07-settings');

    await tapText(tester, 'Speak words automatically');
    expect(c.read(settingsProvider).autoSpeak, isFalse);
    expect(prefs.getBool('settings_auto_speak'), isFalse);

    await tapText(tester, 'Reset progress');
    await tapText(tester, 'Reset');
    expect(c.read(progressProvider), isEmpty);
    expect(c.read(statsProvider).points, 0);
    expect(find.text('Open-source licences'), findsOneWidget);
  });

  testWidgets('first run: pick B1, then lists and games use only B1', (
    tester,
  ) async {
    await prefs.remove('onboarded');
    final c = await launch(tester);
    expect(find.text('Willkommen!'), findsOneWidget);
    await shot(tester, '00-onboarding');

    await tester.tap(find.byKey(const ValueKey('level-B1')));
    await tester.pumpAndSettle();
    await tapText(tester, 'START');
    expect(find.text('WORTSCHATZ'), findsOneWidget);
    expect(c.read(wordListsProvider).every((l) => l.level == Level.b1), isTrue);
    final badges = tester.widgetList<LevelBadge>(find.byType(LevelBadge));
    expect(badges, isNotEmpty);
    expect(badges.every((b) => b.level == Level.b1), isTrue);

    await tapText(tester, 'Practice');
    await tapText(tester, 'Der Die Das');
    final noun = words.firstWhere(
      (w) => w.isNoun && find.text(w.german).evaluate().isNotEmpty,
    );
    expect(noun.level, Level.b1);
    await tester.pageBack();
    await tester.pumpAndSettle();

    await tapText(tester, 'Settings');
    await tester.tap(find.byKey(const ValueKey('settings-levels')));
    await tester.pumpAndSettle();
    await shot(tester, '09-levels');
    await tester.tap(find.byKey(const ValueKey('level-sequence')));
    await tester.pumpAndSettle();
    expect(c.read(settingsProvider).levels.sequence, isTrue);
    expect(c.read(wordListsProvider).first.level, Level.a1);
  });

  testWidgets('Daily Hive: the shared board plays once and offers a share', (
    tester,
  ) async {
    final c = await launch(tester);
    await tapText(tester, 'Practice');
    await tester.tap(find.byKey(const ValueKey('daily-hive')));
    await tester.pumpAndSettle();
    expect(find.textContaining('Daily Hive ·'), findsOneWidget);
    await shot(tester, '10-daily-hive');

    final state = tester.state(find.byType(HiveScreen)) as dynamic;
    final words = (state.debugTargets as List).length;
    for (var w = 0; w < words; w++) {
      final path =
          (tester.state(find.byType(HiveScreen)) as dynamic).debugTargetPath
              as List<Hex>;
      for (final hex in path) {
        await tester.tap(
          find.byKey(ValueKey('hex-${hex.q}-${hex.r}')),
          warnIfMissed: false,
        );
        await tester.pump();
      }
      await tester.pump(const Duration(milliseconds: 600));
    }
    await tester.pumpAndSettle();
    expect(find.text('SHARE RESULT'), findsOneWidget);
    expect(c.read(dailyHiveResultProvider), 3);
    await tapText(tester, 'Done');
    expect(find.textContaining('Done today: ★★★'), findsOneWidget);
  });
}
