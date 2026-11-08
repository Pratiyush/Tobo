import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/games/gender_rules.dart';
import 'package:german_words/models/word.dart';
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

    test('a noun is typed with its capital', () {
      final p = SpellingPuzzle('der Tag', Random(1));
      expect(p.keys.containsKey('T'), isTrue);
      expect(p.keys.containsKey('t'), isFalse, reason: 'no lower-case twin');
      for (final c in 'der Tag'.split('')) {
        p.type(c);
      }
      expect(p.isCorrect, isTrue);
    });

    test('capital and small forms of a letter are separate keys', () {
      final p = SpellingPuzzle('die Schwester', Random(1));
      expect(p.keys['S'], 1);
      expect(p.keys['s'], 1);
      p.type('s');
      expect(p.typed, 's');
      p.hint();
      expect(p.typed, 'd', reason: 'hint removes the wrong letter first');
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

  group('gender hints', () {
    final nouns = deck.where((w) => w.isNoun).toList();
    Word noun(String german) => nouns.firstWhere((w) => w.german == german);

    test('compounds take the article of their last part', () {
      expect(genderHint(noun('Kaltmiete'), nouns), contains('die Miete'));
      expect(genderHint(noun('Krankenhaus'), nouns), contains('das Haus'));
    });

    test('suffix rules explain -ung and friends', () {
      expect(genderHint(noun('Wohnung'), nouns), contains('-ung take die'));
    });

    test('a pattern that disagrees with the article gives no hint', () {
      expect(genderHint(noun('Antwort'), nouns), isNull, reason: 'das Wort');
      expect(genderHint(noun('Baum'), nouns), isNull, reason: '-um is das');
      expect(genderHint(noun('Kuchen'), nouns), isNull, reason: '-chen');
    });

    test('every hint on the deck agrees with the real article', () {
      var hinted = 0;
      for (final w in nouns) {
        final hint = genderHint(w, nouns);
        if (hint == null) continue;
        hinted++;
        final g = w.gender!.name;
        expect(
          hint,
          anyOf(contains('take $g.'), contains(': $g ')),
          reason: w.german,
        );
      }
      expect(hinted, greaterThan(20));
    });
  });
}
