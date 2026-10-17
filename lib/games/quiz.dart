import 'dart:math';

import '../models/word.dart';

/// A wrong English answer for [target]: same part of speech when possible,
/// never a word that shares a meaning with it.
Word pickDistractor(Word target, List<Word> pool, Random rng) {
  bool unrelated(Word w) =>
      w.id != target.id && !w.english.any(target.english.contains);
  final samePos = pool
      .where((w) => w.pos == target.pos && unrelated(w))
      .toList();
  final options = samePos.isNotEmpty ? samePos : pool.where(unrelated).toList();
  return options[rng.nextInt(options.length)];
}

/// Up to [count] shuffled words from [pool] for one game session.
List<Word> pickRound(List<Word> pool, Random rng, {int count = 15}) =>
    ([...pool]..shuffle(rng)).take(count).toList();
