// First 5 minutes (better-loop): a first-time Hive player is told how to
// play until they solve their first word; returning players never see it.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/games/hive.dart';
import 'package:german_words/providers/preferences_provider.dart';
import 'package:german_words/screens/hive_screen.dart';

import 'helpers.dart';

const _coach = 'Tap or drag through touching letters to spell the German word';

Future<void> _openHive(WidgetTester tester) async {
  await tester.tap(find.text('Practice'));
  await tester.pumpAndSettle();
  await tester.ensureVisible(find.text('Hive'));
  await tester.pumpAndSettle();
  await tester.tap(find.text('Hive'));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('a first-time player sees how to play until the first word', (
    tester,
  ) async {
    final c = await createContainer();
    await tester.pumpWidget(buildApp(c));
    await _openHive(tester);
    expect(find.text(_coach), findsOneWidget);

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
    await tester.pumpAndSettle();
    expect(find.text(_coach), findsNothing);
    expect(c.read(sharedPreferencesProvider).getBool('hive_coached'), isTrue);
  });

  testWidgets('a player who has played Hive before never sees it', (
    tester,
  ) async {
    final c = await createContainer(prefs: {'best_hive': 40});
    await tester.pumpWidget(buildApp(c));
    await _openHive(tester);
    expect(find.text(_coach), findsNothing);
  });

  testWidgets('once coached, never again', (tester) async {
    final c = await createContainer(prefs: {'hive_coached': true});
    await tester.pumpWidget(buildApp(c));
    await _openHive(tester);
    expect(find.text(_coach), findsNothing);
  });
}
