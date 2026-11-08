import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/games/hive.dart';
import 'package:german_words/models/level.dart';
import 'package:german_words/models/word.dart';
import 'package:german_words/providers/onboarding_provider.dart';
import 'package:german_words/providers/preferences_provider.dart';
import 'package:german_words/providers/progress_provider.dart';
import 'package:german_words/providers/settings_provider.dart';
import 'package:german_words/providers/words_provider.dart';
import 'package:german_words/screens/der_die_das_screen.dart';
import 'package:german_words/screens/fallee_screen.dart';
import 'package:german_words/screens/hive_screen.dart';
import 'package:german_words/screens/learn_screen.dart';
import 'package:german_words/widgets/level_badge.dart';

import 'helpers.dart';

int _count(Level l) => deck.where((w) => w.level == l).length;

void main() {
  group('LevelChoice', () {
    test('defaults to all levels in sequence and round-trips prefs', () {
      expect(LevelChoice.fromPrefs(null), const LevelChoice.sequence());
      expect(const LevelChoice.sequence().active, Level.values);
      final pick = LevelChoice.only({Level.b1, Level.a2});
      expect(pick.active, [Level.a2, Level.b1], reason: 'easiest first');
      expect(pick.toPrefs(), ['A2', 'B1']);
      expect(LevelChoice.fromPrefs(pick.toPrefs()), pick);
      expect(pick.label, 'A2 + B1');
      expect(LevelChoice.fromPrefs(['sequence']).sequence, isTrue);
      expect(LevelChoice.fromPrefs(['Z9']).sequence, isTrue, reason: 'junk');
    });
  });

  group('word pools by level', () {
    test(
      'sequence orders A1, A2, B1, B2, frequency kept within a level',
      () async {
        final c = await createContainer();
        final active = c.read(activeWordsProvider);
        expect(active, hasLength(deck.length));
        final levels = [for (final w in active) w.level.index];
        expect(levels, [...levels]..sort(), reason: 'grouped by level');
        final a1 = deck.where((w) => w.level == Level.a1).toList();
        expect(active.take(a1.length).toList(), a1);
      },
    );

    test('a chosen level filters the lists and every game pool', () async {
      final c = await createContainer();
      c.read(settingsProvider.notifier).setLevels(LevelChoice.only({Level.a2}));
      expect(c.read(activeWordsProvider), hasLength(_count(Level.a2)));
      final lists = c.read(wordListsProvider);
      expect([for (final l in lists) l.number], [1, 2]);
      expect(lists.every((l) => l.level == Level.a2), isTrue);
      for (final nounsOnly in [true, false]) {
        final pool = c.read(gamePoolProvider(nounsOnly));
        expect(pool, isNotEmpty);
        expect(pool.every((w) => w.level == Level.a2), isTrue);
      }
    });

    test('lists never mix levels and are numbered across levels', () async {
      final c = await createContainer();
      final lists = c.read(wordListsProvider);
      expect(
        [for (final l in lists) l.number],
        [for (var i = 1; i <= lists.length; i++) i],
      );
      for (final l in lists) {
        expect(l.words.every((w) => w.level == l.level), isTrue);
      }
      expect(lists.where((l) => l.level == Level.a1), hasLength(11));
      expect(lists.last.level, Level.b2);
    });

    test(
      'progress is kept per level when switching; due follows the choice',
      () async {
        final clock = TestClock();
        final c = await createContainer(clock: clock);
        final a1 = deck.firstWhere((w) => w.level == Level.a1);
        final b2 = deck.firstWhere((w) => w.level == Level.b2);
        c.read(progressProvider.notifier)
          ..learn(a1.id)
          ..learn(b2.id);
        clock.now = clock.now.add(const Duration(days: 1));
        c.invalidate(dueWordsProvider);
        expect(c.read(dueWordsProvider), hasLength(2));

        c
            .read(settingsProvider.notifier)
            .setLevels(LevelChoice.only({Level.b2}));
        expect(c.read(dueWordsProvider).map((w) => w.id), [b2.id]);
        expect(c.read(learnedWordsProvider), hasLength(2), reason: 'kept');
        final progress = c.read(levelProgressProvider);
        expect(progress[Level.a1], (learned: 1, total: _count(Level.a1)));
        expect(progress[Level.b2], (learned: 1, total: _count(Level.b2)));

        c
            .read(settingsProvider.notifier)
            .setLevels(const LevelChoice.sequence());
        expect(c.read(dueWordsProvider), hasLength(2), reason: 'nothing lost');
      },
    );

    test('the choice persists across launches', () async {
      final c = await createContainer();
      c.read(settingsProvider.notifier).setLevels(LevelChoice.only({Level.b1}));
      final again = await createContainer(
        prefs: {'settings_levels': c.read(settingsProvider).levels.toPrefs()},
      );
      expect(again.read(settingsProvider).levels, LevelChoice.only({Level.b1}));
    });
  });

  group('onboarding', () {
    testWidgets('first run asks for the level; a pick shapes the home lists', (
      tester,
    ) async {
      final c = await createContainer(prefs: {'onboarded': false});
      await tester.pumpWidget(buildApp(c));
      await tester.pumpAndSettle();
      expect(find.text('Willkommen!'), findsOneWidget);

      await tester.tap(find.byKey(const ValueKey('level-B1')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('START'));
      await tester.pumpAndSettle();
      expect(c.read(onboardedProvider), isTrue);
      expect(c.read(settingsProvider).levels, LevelChoice.only({Level.b1}));
      expect(find.text('Words 1'), findsOneWidget);
      final badges = tester.widgetList<LevelBadge>(find.byType(LevelBadge));
      expect(badges.every((b) => b.level == Level.b1), isTrue);
    });

    testWidgets('"Not sure? Start at A1" picks all levels in sequence', (
      tester,
    ) async {
      final c = await createContainer(prefs: {'onboarded': false});
      await tester.pumpWidget(buildApp(c));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Not sure? Start at A1'));
      await tester.pumpAndSettle();
      expect(c.read(settingsProvider).levels.sequence, isTrue);
      expect(c.read(wordListsProvider).first.level, Level.a1);
    });

    testWidgets('learners with progress skip it', (tester) async {
      final c = await createContainer(prefs: {'stats_points': 12});
      // An update from a version without onboarding: no flag stored yet.
      await c.read(sharedPreferencesProvider).remove(onboardedKey);
      c.invalidate(onboardedProvider);
      await tester.pumpWidget(buildApp(c));
      await tester.pumpAndSettle();
      expect(find.text('Willkommen!'), findsNothing);
      expect(find.text('WORTSCHATZ'), findsOneWidget);
    });

    testWidgets('Settings › Levels changes the lists at once', (tester) async {
      final c = await createContainer();
      await tester.pumpWidget(buildApp(c));
      await tester.tap(find.text('Settings'));
      await tester.pumpAndSettle();
      expect(find.text('All levels in sequence'), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('settings-levels')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const ValueKey('level-A2')));
      await tester.pumpAndSettle();
      expect(
        c.read(wordListsProvider).every((l) => l.level == Level.a2),
        isTrue,
      );
      await tester.pageBack();
      await tester.pumpAndSettle();
      expect(find.text('A2'), findsOneWidget, reason: 'Settings subtitle');
    });
  });

  group('games draw from the chosen level', () {
    Future<Set<String>> shownGerman(WidgetTester tester) async => {
      for (final w in deck)
        if (find.text(w.german).evaluate().isNotEmpty ||
            find.text(w.display).evaluate().isNotEmpty)
          w.id,
    };

    testWidgets('Der Die Das', (tester) async {
      final c = await createContainer();
      c.read(settingsProvider.notifier).setLevels(LevelChoice.only({Level.b1}));
      await tester.pumpWidget(
        buildScreen(c, DerDieDasScreen(random: Random(2))),
      );
      final shown = await shownGerman(tester);
      expect(shown, isNotEmpty);
      final byId = {for (final w in deck) w.id: w};
      expect(shown.every((id) => byId[id]!.level == Level.b1), isTrue);
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('Fallee', (tester) async {
      final c = await createContainer();
      c.read(settingsProvider.notifier).setLevels(LevelChoice.only({Level.a2}));
      await tester.pumpWidget(buildScreen(c, FalleeScreen(random: Random(2))));
      final falling = deck.firstWhere(
        (w) => find.text(w.display).evaluate().isNotEmpty,
      );
      expect(falling.level, Level.a2);
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('Hive', (tester) async {
      final c = await createContainer();
      c.read(settingsProvider.notifier).setLevels(LevelChoice.only({Level.b2}));
      await tester.pumpWidget(buildScreen(c, HiveScreen(random: Random(2))));
      await tester.pump();
      final state = tester.state(find.byType(HiveScreen)) as dynamic;
      final path = state.debugTargetPath as List<Hex>;
      expect(path, isNotEmpty);
      final targets = state.debugTargets as List<Word>;
      expect(targets.every((w) => w.level == Level.b2), isTrue);
    });

    testWidgets('the Learn card shows the word\'s level', (tester) async {
      final c = await createContainer();
      final b1 = deck.where((w) => w.level == Level.b1).take(2).toList();
      await tester.pumpWidget(buildScreen(c, LearnScreen(words: b1)));
      await tester.pumpAndSettle();
      expect(
        tester.widget<LevelBadge>(find.byType(LevelBadge).first).level,
        Level.b1,
      );
    });
  });
}
