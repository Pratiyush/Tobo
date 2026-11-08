import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/games/daily.dart';
import 'package:german_words/games/hive.dart';
import 'package:german_words/models/level.dart';
import 'package:german_words/models/word.dart';
import 'package:german_words/providers/daily_hive_provider.dart';
import 'package:german_words/screens/hive_screen.dart';

import 'helpers.dart';

List<Word> _targetsOf(WidgetTester tester) =>
    (tester.state(find.byType(HiveScreen)) as dynamic).debugTargets
        as List<Word>;

void main() {
  test('same day and level: same seed; level picks the frontier', () {
    final a = DailyHive(DateTime(2026, 11, 9), Level.a1);
    expect(a.seed, DailyHive(DateTime(2026, 11, 9), Level.a1).seed);
    expect(a.seed, isNot(DailyHive(DateTime(2026, 11, 10), Level.a1).seed));
    expect(a.seed, isNot(DailyHive(DateTime(2026, 11, 9), Level.a2).seed));
    expect(a.pool(deck).every((w) => w.level == Level.a1), isTrue);
    expect(
      dailyLevel([Level.a1, Level.a2], (l) => l == Level.a2),
      Level.a2,
      reason: 'A1 all learned',
    );
    expect(dailyLevel([Level.b1], (_) => false), Level.b1);
    expect(
      a.shareText(stars: 2, hints: 1),
      'Wortschatz Daily Hive · 9 Nov · A1 · ★★☆ · 1 hint',
    );
  });

  testWidgets('every learner gets the same board today', (tester) async {
    final day = DailyHive(DateTime(2026, 11, 9), Level.a1);
    final one = await createContainer();
    await tester.pumpWidget(buildScreen(one, HiveScreen(daily: day)));
    await tester.pump();
    final first = [for (final w in _targetsOf(tester)) w.id];

    // Another learner with different progress: same board.
    final two = await createContainer(
      prefs: {'word_progress': '{"${deck[3].id}":{"l":3,"d":0}}'},
    );
    await tester.pumpWidget(const SizedBox());
    await tester.pumpWidget(buildScreen(two, HiveScreen(daily: day)));
    await tester.pump();
    expect([for (final w in _targetsOf(tester)) w.id], first);
    expect(find.text('Daily Hive · A1'), findsOneWidget);
  });

  testWidgets('finishing records the result and offers a share', (
    tester,
  ) async {
    final shared = <String>[];
    final c = await createContainer(
      overrides: [
        shareTextProvider.overrideWithValue((t) async => shared.add(t)),
      ],
    );
    final day = c.read(dailyHiveProvider);
    await tester.pumpWidget(buildScreen(c, HiveScreen(daily: day)));
    await tester.pump();
    for (var w = 0; w < _targetsOf(tester).length; w++) {
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
      await tester.pump(const Duration(milliseconds: 500));
    }
    await tester.pumpAndSettle();
    expect(c.read(dailyHiveResultProvider), (stars: 3, hints: 0));
    expect(find.text('NEXT ROUND'), findsNothing);
    await tester.tap(find.text('SHARE RESULT'));
    await tester.pump();
    expect(shared.single, day.shareText(stars: 3, hints: 0));
  });

  testWidgets('a played board shares from the Practice tab card', (
    tester,
  ) async {
    final shared = <String>[];
    final c = await createContainer(
      overrides: [
        shareTextProvider.overrideWithValue((t) async => shared.add(t)),
      ],
    );
    c.read(dailyHiveResultProvider.notifier).record(2, 1);
    await tester.pumpWidget(buildApp(c));
    await tester.tap(find.text('Practice'));
    await tester.pumpAndSettle();
    expect(
      find.textContaining('Done today: ★★☆. Tap to share'),
      findsOneWidget,
    );
    await tester.tap(find.byKey(const ValueKey('daily-hive')));
    await tester.pump();
    expect(
      shared.single,
      c.read(dailyHiveProvider).shareText(stars: 2, hints: 1),
    );
  });
}
