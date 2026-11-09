// Edge: smallest phone (360 dp) with the largest font (2.0) on every screen.
// A RenderFlex overflow is reported as an exception, which fails the test.
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/models/level.dart';
import 'package:german_words/screens/der_die_das_screen.dart';
import 'package:german_words/screens/fallee_screen.dart';
import 'package:german_words/screens/hive_screen.dart';
import 'package:german_words/screens/learn_screen.dart';
import 'package:german_words/screens/onboarding_screen.dart';
import 'package:german_words/screens/settings_screen.dart';
import 'package:german_words/screens/spelling_screen.dart';
import 'package:german_words/screens/word_list_screen.dart';
import 'package:german_words/widgets/common.dart';

import 'helpers.dart';

void main() {
  // The longest words in the deck stress every card.
  final longNouns = [...deck.where((w) => w.isNoun)]
    ..sort((a, b) => b.display.length.compareTo(a.display.length));

  Future<void> small(WidgetTester tester, {double font = 2.0}) async {
    tester.view
      ..physicalSize = const Size(360 * 3, 640 * 3)
      ..devicePixelRatio = 3;
    tester.platformDispatcher.textScaleFactorTestValue = font;
    addTearDown(tester.view.reset);
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
  }

  final screens = <String, Widget Function()>{
    'onboarding': () => const OnboardingScreen(),
    'word list': () => const WordListScreen(number: 1),
    'learn (longest nouns)': () =>
        LearnScreen(words: longNouns.take(3).toList()),
    'practice spelling (longest noun)': () =>
        SpellingScreen(words: longNouns.take(1).toList()),
    'hive': () => HiveScreen(random: Random(1)),
    'der die das': () => DerDieDasScreen(random: Random(1)),
    'fallee': () => FalleeScreen(random: Random(1)),
    'settings': () => const SettingsScreen(),
    'settings › levels': () => const LevelSettingsScreen(),
    'round end': () => SessionSummary(
      title: '20 / 20',
      message: 'Perfekt! Every article right.',
      onAgain: () {},
      stars: 3,
      points: 53,
      bestCombo: 20,
      newBest: true,
    ),
  };

  for (final MapEntry(key: name, value: build) in screens.entries) {
    testWidgets('360 dp, font 2.0: $name has no overflow', (tester) async {
      await small(tester);
      final c = await createContainer();
      await tester.pumpWidget(buildScreen(c, build()));
      await tester.pump(const Duration(milliseconds: 200));
      expect(tester.takeException(), isNull);
      // Flip the Learn card too: the back holds the most text.
      if (name.startsWith('learn')) {
        await tester.tap(find.text('FLIP'));
        await tester.pump(const Duration(milliseconds: 400));
        expect(tester.takeException(), isNull);
      }
      await tester.pumpWidget(const SizedBox());
    });
  }

  testWidgets('360 dp, font 2.0: home with every level', (tester) async {
    await small(tester);
    final c = await createContainer();
    await tester.pumpWidget(buildApp(c));
    await tester.pump(const Duration(milliseconds: 200));
    expect(tester.takeException(), isNull);
    for (final tab in ['Practice', 'Settings']) {
      await tester.tap(find.text(tab));
      await tester.pump(const Duration(milliseconds: 200));
      expect(tester.takeException(), isNull, reason: tab);
    }
  });

  test('every level name fits the picker', () {
    expect(
      Level.values.map((l) => l.description).every((d) => d.length < 24),
      isTrue,
    );
  });
}
