import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/app.dart';
import 'package:german_words/games/hive.dart';
import 'package:german_words/models/word.dart';
import 'package:german_words/providers/progress_provider.dart';
import 'package:german_words/providers/stats_provider.dart';
import 'package:german_words/screens/der_die_das_screen.dart';
import 'package:german_words/screens/fallee_screen.dart';
import 'package:german_words/screens/hive_screen.dart';
import 'package:german_words/screens/spelling_screen.dart';

import 'helpers.dart';

void main() {
  testWidgets('a failed startup explains itself', (tester) async {
    await tester.pumpWidget(const StartupErrorApp(error: 'boom'));
    expect(find.textContaining('couldn’t start'), findsOneWidget);
    expect(find.textContaining('boom'), findsOneWidget);
  });

  testWidgets('home shows stats and the word lists', (tester) async {
    final c = await createContainer();
    await tester.pumpWidget(buildApp(c));

    expect(find.text('LEVEL'), findsOneWidget);
    expect(find.text('Points'), findsOneWidget);
    expect(find.text('Words 1'), findsOneWidget);
  });

  testWidgets('learning a word from a list', (tester) async {
    final engine = FakeSpeechEngine();
    final c = await createContainer(engine: engine);
    await tester.pumpWidget(buildApp(c));

    await tester.tap(find.text('Words 1'));
    await tester.pumpAndSettle();
    expect(find.text('There are 50 words left in this list.'), findsOneWidget);

    await tester.tap(find.text('LEARN'));
    await tester.pumpAndSettle();
    final first = deck.first;
    expect(engine.spoken, [first.display]);

    await tester.tap(find.text('FLIP'));
    await tester.pumpAndSettle();
    expect(find.text(first.english.join(', ')), findsOneWidget);

    await tester.tap(find.text('KNOW IT'));
    await tester.pumpAndSettle();
    expect(c.read(progressProvider).keys, [first.id]);
    expect(c.read(statsProvider).points, Reward.learn);

    // "Later" sends the card to the back of the deck.
    await tester.tap(find.text('FLIP'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('LATER'));
    await tester.pumpAndSettle();
    expect(c.read(progressProvider).length, 1);
  });

  testWidgets('Practice tab lists the games and the due count', (tester) async {
    final c = await createContainer();
    await tester.pumpWidget(buildApp(c));
    await tester.tap(find.text('Practice'));
    await tester.pumpAndSettle();

    expect(find.text('Learn some words first'), findsOneWidget);
    expect(find.text('Hive'), findsOneWidget);
    expect(find.text('Der Die Das'), findsOneWidget);
    expect(find.text('Fallee'), findsOneWidget);
  });

  testWidgets('spelling a noun with its article using hints', (tester) async {
    final c = await createContainer();
    final word = deck.firstWhere((w) => w.isNoun);
    c.read(progressProvider.notifier).learn(word.id);
    await tester.pumpWidget(
      buildScreen(c, SpellingScreen(words: [word], random: Random(1))),
    );

    expect(find.text(word.english.join(', ')), findsOneWidget);
    for (var i = 0; i < word.display.length; i++) {
      await tester.tap(find.byTooltip('Hint'));
      await tester.pump();
    }
    await tester.tap(find.byTooltip('Check'));
    await tester.pumpAndSettle();

    expect(find.text('Richtig!'), findsOneWidget);
    expect(c.read(progressProvider)[word.id]!.level, 2);
    expect(c.read(statsProvider).points, Reward.game);
  });

  testWidgets('Der Die Das scores the right article', (tester) async {
    final c = await createContainer();
    await tester.pumpWidget(buildScreen(c, DerDieDasScreen(random: Random(2))));

    final word = _currentNoun(tester);
    await tester.tap(
      find.text(
        '${word.gender!.name[0].toUpperCase()}${word.gender!.name.substring(1)}',
      ),
    );
    await tester.pump();
    expect(find.text('Richtig!'), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('2/$derDieDasRounds'), findsOneWidget);
    expect(c.read(statsProvider).points, Reward.game);
  });

  testWidgets('Fallee counts a timeout as a miss', (tester) async {
    final c = await createContainer();
    await tester.pumpWidget(buildScreen(c, FalleeScreen(random: Random(3))));
    expect(find.text('1/$falleeRounds'), findsOneWidget);

    await tester.pump(falleeStartDuration);
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(seconds: 2));
    expect(find.text('2/$falleeRounds'), findsOneWidget);
    expect(c.read(statsProvider).points, 0);

    // Leave the screen so the falling animation stops.
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('Hive: tapping a word path solves it and consumes letters', (
    tester,
  ) async {
    final c = await createContainer();
    await tester.pumpWidget(buildScreen(c, HiveScreen(random: Random(4))));
    await tester.pump();

    final before = _tileCount(tester);
    // Hints reveal the path; tap the highlighted tiles in order.
    final state = tester.state(find.byType(HiveScreen));
    final target = (state as dynamic).debugTargetPath as List<Hex>;
    for (final hex in target) {
      await tester.tap(
        find.byKey(ValueKey('hex-${hex.q}-${hex.r}')),
        warnIfMissed: false,
      );
      await tester.pump();
    }
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Word 2 of $hiveWordsPerRound'), findsOneWidget);
    expect(_tileCount(tester), before - target.length);
    expect(c.read(statsProvider).points, Reward.hiveWord);
  });
}

Word _currentNoun(WidgetTester tester) {
  final texts = tester
      .widgetList<Text>(find.byType(Text))
      .map((t) => t.data)
      .toSet();
  return deck.firstWhere((w) => w.isNoun && texts.contains(w.german));
}

int _tileCount(WidgetTester tester) => find
    .byWidgetPredicate(
      (w) =>
          w.key is ValueKey<String> &&
          (w.key! as ValueKey<String>).value.startsWith('hex-'),
    )
    .evaluate()
    .length;
