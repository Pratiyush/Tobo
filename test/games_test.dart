import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/games/hive.dart';
import 'package:german_words/games/quiz.dart';
import 'package:german_words/games/spelling.dart';

import 'helpers.dart';

void main() {
  group('Hive', () {
    test('every target can be traced along its path', () {
      for (var seed = 0; seed < 300; seed++) {
        final rng = Random(seed);
        final words = pickHiveWords(
          deck,
          (w) => w.german.toLowerCase(),
          rng,
        ).map((w) => w.german.toLowerCase()).toList();
        final board = HiveBoard.layout(words, rng);
        expect(board, isNotNull, reason: 'seed $seed: $words');
        final letters = words.join().length;
        expect(board!.tiles.length, letters);
        for (final word in words) {
          final path = board.paths[word]!;
          expect(isTraceable(path, board.tiles), isTrue);
          expect(path.map((h) => board.tiles[h]).join(), word);
        }
        // Paths share no tiles, so solving one never breaks another.
        final all = board.paths.values.expand((p) => p).toList();
        expect(all.toSet().length, all.length);
      }
    });

    test('picks distinct words of 3 to 6 letters', () {
      final picked = pickHiveWords(deck, (w) => w.german, Random(1), count: 3);
      expect(picked.length, 3);
      expect(picked.map((w) => w.german.toLowerCase()).toSet().length, 3);
      for (final w in picked) {
        expect(w.german.length, inInclusiveRange(3, 6));
      }
    });

    test('hexes know their neighbours', () {
      const centre = Hex(0, 0);
      expect(centre.neighbours.length, 6);
      expect(centre.neighbours.every(centre.isAdjacentTo), isTrue);
      expect(centre.isAdjacentTo(const Hex(2, 0)), isFalse);
      expect(
        isTraceable(
          const [Hex(0, 0), Hex(2, 0)],
          {const Hex(0, 0): 'a', const Hex(2, 0): 'b'},
        ),
        isFalse,
      );
    });
  });

  group('SpellingPuzzle', () {
    test('keyboard has the answer letters with counts, plus decoys', () {
      final p = SpellingPuzzle('die Welt', Random(3));
      expect(p.keys['e'], 2);
      expect(p.keys[SpellingPuzzle.space], 1);
      expect(p.keys.keys.last, SpellingPuzzle.space);
      final total = p.keys.values.fold(0, (a, b) => a + b);
      expect(total, 'die welt'.length + 3);
    });

    test('typing uses up keys; backspace returns them', () {
      final p = SpellingPuzzle('tun', Random(1));
      p.type('t');
      expect(p.keys['t'], 0);
      p.type('t');
      expect(p.typed, 't');
      p.backspace();
      expect(p.keys['t'], 1);
      expect(p.typed, '');
    });

    test('hint fixes mistakes and types the next letter', () {
      final p = SpellingPuzzle('tag', Random(1));
      p.type('a');
      p.hint();
      expect(p.typed, 't');
      p.hint();
      p.hint();
      expect(p.isFull, isTrue);
      expect(p.isCorrect, isTrue);
    });

    test('answers compare case-insensitively', () {
      final p = SpellingPuzzle('der Tag', Random(1));
      for (final c in 'der tag'.split('')) {
        p.type(c);
      }
      expect(p.isCorrect, isTrue);
    });
  });

  test('distractors share the part of speech but not the meaning', () {
    final rng = Random(7);
    for (final target in deck.take(100)) {
      final d = pickDistractor(target, deck, rng);
      expect(d.id, isNot(target.id));
      expect(d.pos, target.pos);
      expect(d.english.any(target.english.contains), isFalse);
    }
  });
}
