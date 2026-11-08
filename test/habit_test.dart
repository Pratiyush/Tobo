import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/providers/daily_goal_provider.dart';
import 'package:german_words/providers/feedback_provider.dart';
import 'package:german_words/providers/progress_provider.dart';
import 'package:german_words/providers/stats_provider.dart';
import 'package:german_words/screens/word_list_screen.dart';

import 'helpers.dart';

void main() {
  test('the daily goal counts today only and resets tomorrow', () async {
    final clock = TestClock();
    final c = await createContainer(clock: clock);
    for (var i = 0; i < 3; i++) {
      c.read(dailyGoalProvider.notifier).tick();
    }
    expect(c.read(dailyGoalProvider), 3);

    clock.now = clock.now.add(const Duration(days: 1));
    c.invalidate(dailyGoalProvider);
    expect(c.read(dailyGoalProvider), 0);
    c.read(dailyGoalProvider.notifier).tick();
    expect(c.read(dailyGoalProvider), 1);
  });

  testWidgets(
    'new learners get "Start here", which opens Learn; then the goal',
    (tester) async {
      final c = await createContainer();
      await tester.pumpWidget(buildApp(c));
      await tester.pumpAndSettle();
      expect(find.byKey(const ValueKey('start-here')), findsOneWidget);
      expect(find.byKey(const ValueKey('daily-goal')), findsNothing);

      await tester.tap(find.text('LEARN 10 WORDS'));
      await tester.pumpAndSettle();
      expect(find.text('FLIP'), findsOneWidget);
      await tester.tap(find.text('FLIP'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('KNOW IT'));
      await tester.pumpAndSettle();
      expect(c.read(dailyGoalProvider), 1, reason: 'a learned word counts');
      expect(c.read(statsProvider).points, Reward.learn);

      await tester.pageBack();
      await tester.pumpAndSettle();
      expect(find.byKey(const ValueKey('start-here')), findsNothing);
      expect(find.byKey(const ValueKey('daily-goal')), findsOneWidget);
      expect(
        find.text('1 of 10 words learned or answered right'),
        findsOneWidget,
      );
    },
  );

  testWidgets('a list\'s Practice holds only its due words (BUG-20)', (
    tester,
  ) async {
    final clock = TestClock();
    final c = await createContainer(clock: clock);
    final first = deck.first;
    c.read(progressProvider.notifier)
      ..learn(first.id)
      ..learn(deck[1].id);
    await tester.pumpWidget(buildScreen(c, const WordListScreen(number: 1)));
    await tester.pumpAndSettle();
    expect(find.text('0 items'), findsOneWidget, reason: 'nothing due yet');

    // Tomorrow both are due.
    clock.now = clock.now.add(const Duration(days: 1));
    c.invalidate(dueWordsProvider);
    await tester.pumpAndSettle();
    expect(find.text('2 items'), findsOneWidget);
  });

  testWidgets('Reset progress also clears best scores and today\'s goal', (
    tester,
  ) async {
    final c = await createContainer();
    c.read(bestScoresProvider.notifier).submit('fallee', 12);
    c.read(dailyGoalProvider.notifier).tick();
    await tester.pumpWidget(buildApp(c));
    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Reset progress'));
    await tester.tap(find.text('Reset progress'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Reset'));
    await tester.pumpAndSettle();
    expect(c.read(bestScoresProvider)['fallee'], 0);
    expect(c.read(dailyGoalProvider), 0);
  });
}
