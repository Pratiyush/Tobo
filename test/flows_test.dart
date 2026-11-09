// Headless whole-app flows (docs/e2e-standard.md fast tier): every journey
// starts from the real app (buildApp) and navigates like a learner, with
// fakes for clock, storage, audio, sounds, ads and content.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/games/hive.dart';
import 'package:german_words/models/level.dart';
import 'package:german_words/providers/daily_goal_provider.dart';
import 'package:german_words/providers/daily_hive_provider.dart';
import 'package:german_words/providers/feedback_provider.dart';
import 'package:german_words/providers/progress_provider.dart';
import 'package:german_words/providers/settings_provider.dart';
import 'package:german_words/providers/stats_provider.dart';
import 'package:german_words/screens/hive_screen.dart';
import 'package:german_words/widgets/common.dart';

import 'helpers.dart';

Future<void> _tap(WidgetTester tester, Finder f) async {
  await tester.ensureVisible(f.first);
  await tester.pumpAndSettle();
  await tester.tap(f.first);
  await tester.pumpAndSettle();
}

Future<void> _openGame(WidgetTester tester, String title) async {
  await _tap(tester, find.text('Practice'));
  await _tap(tester, find.text(title));
}

/// Taps the current Hive word's path, word after word, until the board is
/// cleared.
Future<void> _solveHiveBoard(WidgetTester tester) async {
  while (find.text('Board cleared!').evaluate().isEmpty) {
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
}

void main() {
  testWidgets('first run: level A2 → Start here → learn 3 → daily goal', (
    tester,
  ) async {
    final c = await createContainer(prefs: {'onboarded': false});
    await tester.pumpWidget(buildApp(c));
    await tester.pumpAndSettle();
    await _tap(tester, find.byKey(const ValueKey('level-A2')));
    await _tap(tester, find.text('START'));
    expect(c.read(settingsProvider).levels, LevelChoice.only({Level.a2}));

    await _tap(tester, find.text('LEARN 10 WORDS'));
    for (var i = 0; i < 3; i++) {
      await _tap(tester, find.text('FLIP'));
      await _tap(tester, find.text('KNOW IT'));
    }
    expect(
      c.read(progressProvider).keys.every((id) {
        return deck.firstWhere((w) => w.id == id).level == Level.a2;
      }),
      isTrue,
    );
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(c.read(dailyGoalProvider), 3);
    expect(
      find.text('3 of 10 words learned or answered right'),
      findsOneWidget,
    );
  });

  testWidgets(
    'Practice: tomorrow\'s due words, spelled with hints, then stars',
    (tester) async {
      final clock = TestClock();
      final c = await createContainer(clock: clock);
      c.read(progressProvider.notifier)
        ..learn(deck[0].id)
        ..learn(deck[1].id);
      clock.now = clock.now.add(const Duration(days: 1));
      c.invalidate(dueWordsProvider);
      await tester.pumpWidget(buildApp(c));
      await _tap(tester, find.text('Practice'));
      expect(find.textContaining('2 items'), findsOneWidget);
      await _tap(tester, find.text('Spell the words that are due'));

      for (var w = 0; w < 2; w++) {
        final word = deck[w];
        for (var i = 0; i < word.display.length; i++) {
          await tester.tap(find.byTooltip('Hint'));
          await tester.pump();
        }
        await _tap(tester, find.byTooltip('Check'));
        expect(find.text('Richtig!'), findsOneWidget);
        await tester.pump(const Duration(milliseconds: 400));
        await _tap(tester, find.text('NEXT'));
      }
      expect(find.text('Gut gemacht!'), findsOneWidget);
      expect(tester.widget<StarRow>(find.byType(StarRow)).stars, 3);
      expect(c.read(statsProvider).points, 2 * Reward.game);
    },
  );

  testWidgets('Hive: clear a board, stars, then the next round', (
    tester,
  ) async {
    final sounds = FakeFeedbackEngine();
    final c = await createContainer(feedback: sounds);
    await tester.pumpWidget(buildApp(c));
    await _openGame(tester, 'Hive');
    await _solveHiveBoard(tester);
    expect(tester.widget<StarRow>(find.byType(StarRow)).stars, 3);
    expect(sounds.played.last, GameSound.roundEnd);
    await _tap(tester, find.text('NEXT ROUND'));
    expect(find.text('Round 2'), findsOneWidget);
  });

  testWidgets('Der Die Das: a perfect round, then play again', (tester) async {
    final c = await createContainer();
    await tester.pumpWidget(buildApp(c));
    await _openGame(tester, 'Der Die Das');
    for (var i = 0; i < 20; i++) {
      final noun = deck.firstWhere(
        (w) => w.isNoun && find.text(w.german).evaluate().isNotEmpty,
      );
      final name = noun.gender!.name;
      await tester.tap(
        find.text('${name[0].toUpperCase()}${name.substring(1)}'),
      );
      await tester.pump(const Duration(seconds: 4));
    }
    await tester.pumpAndSettle();
    expect(find.text('20 / 20'), findsOneWidget);
    expect(find.text('NEW BEST!'), findsOneWidget);
    await _tap(tester, find.text('PLAY AGAIN'));
    expect(find.text('1/20'), findsOneWidget);
  });

  testWidgets('Fallee: catch every word, then the summary', (tester) async {
    final c = await createContainer();
    await tester.pumpWidget(buildApp(c));
    await _tap(tester, find.text('Practice'));
    // Not pumpAndSettle: the fall animates continuously and would play the
    // round by itself.
    await tester.ensureVisible(find.text('Fallee'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Fallee'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
    for (var i = 0; i < 15; i++) {
      // Read the falling card itself: an answer button can show a text
      // that is also a German word ("so", "Hotel").
      final shown = tester
          .widget<Text>(
            find.descendant(
              of: find.byKey(const ValueKey('falling-word')),
              matching: find.byType(Text),
            ),
          )
          .textSpan!
          .toPlainText();
      final word = deck.firstWhere((w) => w.display == shown);
      await tester.tap(find.text(word.meaning).last);
      await tester.pump(const Duration(seconds: 1));
    }
    await tester.pumpAndSettle();
    expect(find.text('15 / 15'), findsOneWidget);
    expect(tester.widget<StarRow>(find.byType(StarRow)).stars, 3);
    await _tap(tester, find.text('Done'));
    expect(
      find.text('Daily Hive · A1'),
      findsOneWidget,
      reason: 'back on Practice',
    );
  });

  testWidgets('Daily Hive: play today\'s board once, share from the card', (
    tester,
  ) async {
    final shared = <String>[];
    final c = await createContainer(
      overrides: [
        shareTextProvider.overrideWithValue((t) async => shared.add(t)),
      ],
    );
    await tester.pumpWidget(buildApp(c));
    await _tap(tester, find.text('Practice'));
    await _tap(tester, find.byKey(const ValueKey('daily-hive')));
    await _solveHiveBoard(tester);
    await _tap(tester, find.text('SHARE RESULT'));
    expect(shared, hasLength(1));
    await _tap(tester, find.text('Done'));
    expect(find.textContaining('Done today: ★★★'), findsOneWidget);
    await _tap(tester, find.byKey(const ValueKey('daily-hive')));
    expect(shared, hasLength(2), reason: 'the card shares once played');
  });
}
