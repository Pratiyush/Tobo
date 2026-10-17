import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/data/word_repository.dart';

import 'helpers.dart';

void main() {
  test('the deck is the reviewed lernle deck, without bare articles', () {
    expect(deck.length, greaterThanOrEqualTo(600));
    expect(deck.map((w) => w.id).toSet().length, deck.length);
    expect(deck.where((w) => w.pos == 'article'), isEmpty);
  });

  test('every word has German, a part of speech and an English meaning', () {
    for (final w in deck) {
      expect(w.id, startsWith('de.'), reason: w.id);
      expect(w.german.trim(), isNotEmpty, reason: w.id);
      expect(w.english, isNotEmpty, reason: w.id);
      expect(w.english.every((e) => e.trim().isNotEmpty), isTrue, reason: w.id);
    }
  });

  test('nouns have a gender and are capitalised; others have no gender', () {
    for (final w in deck) {
      if (w.pos == 'noun') {
        expect(w.gender, isNotNull, reason: w.id);
        expect(w.german[0], w.german[0].toUpperCase(), reason: w.id);
      } else {
        expect(w.gender, isNull, reason: w.id);
      }
    }
  });

  test('words are single tokens the spelling keyboard can type', () {
    final letters = RegExp(r'^[A-Za-zÄÖÜäöüß]+$');
    for (final w in deck) {
      expect(letters.hasMatch(w.german), isTrue, reason: w.id);
    }
  });

  test('lists hold 50 words each, in deck order', () {
    final lists = chunkIntoLists(deck);
    expect(lists.first.title, 'Words 1');
    expect(lists.first.words.length, wordListSize);
    expect(lists.expand((l) => l.words).toList(), deck);
  });
}
