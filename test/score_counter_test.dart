import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/widgets/score_counter.dart';

Widget _host(int score, {bool calm = false}) => MaterialApp(
  home: MediaQuery(
    data: MediaQueryData(disableAnimations: calm),
    child: Scaffold(
      body: Center(child: ScoreCounter(score: score)),
    ),
  ),
);

void main() {
  testWidgets('a rising score bumps and floats "+N", then settles', (
    tester,
  ) async {
    await tester.pumpWidget(_host(5));
    expect(find.byKey(const ValueKey('score-pop')), findsNothing);
    await tester.pumpWidget(_host(8));
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text('+3'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('score-pop')), findsNothing);
  });

  testWidgets('reduced motion: the number just changes', (tester) async {
    await tester.pumpWidget(_host(5, calm: true));
    await tester.pumpWidget(_host(8, calm: true));
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.byKey(const ValueKey('score-pop')), findsNothing);
    expect(find.text('8'), findsOneWidget);
  });
}
