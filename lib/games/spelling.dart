import 'dart:math';

/// The spelling drill's custom keyboard: only the answer's letters plus a
/// few decoys, each key showing how many times it is still available.
class SpellingPuzzle {
  SpellingPuzzle(this.answer, Random rng, {int decoys = 3})
    : _remaining = _buildKeys(answer.toLowerCase(), rng, decoys);

  /// The word to type, e.g. `die Welt`. A space is typed with [space].
  final String answer;

  static const space = ' ';
  static const _alphabet = 'abcdefghijklmnopqrstuvwxyzäöüß';

  final Map<String, int> _remaining;
  final List<String> _typed = [];

  static Map<String, int> _buildKeys(String answer, Random rng, int decoys) {
    final counts = <String, int>{};
    for (final ch in answer.split('')) {
      counts[ch] = (counts[ch] ?? 0) + 1;
    }
    final extras =
        _alphabet.split('').where((c) => !counts.containsKey(c)).toList()
          ..shuffle(rng);
    for (final c in extras.take(decoys)) {
      counts[c] = 1;
    }
    final letters = counts.keys.where((c) => c != space).toList()..shuffle(rng);
    return {
      for (final c in letters) c: counts[c]!,
      if (counts.containsKey(space)) space: counts[space]!,
    };
  }

  /// Keys in display order with their remaining counts.
  Map<String, int> get keys => Map.unmodifiable(_remaining);

  String get typed => _typed.join();

  bool get isFull => _typed.length == answer.length;

  bool get isCorrect => typed == answer.toLowerCase();

  void type(String key) {
    final left = _remaining[key] ?? 0;
    if (left == 0 || isFull) return;
    _remaining[key] = left - 1;
    _typed.add(key);
  }

  void backspace() {
    if (_typed.isEmpty) return;
    final key = _typed.removeLast();
    _remaining[key] = _remaining[key]! + 1;
  }

  /// Removes any wrong letters, then types the next correct one.
  void hint() {
    final target = answer.toLowerCase();
    while (_typed.isNotEmpty && !target.startsWith(typed)) {
      backspace();
    }
    if (!isFull) type(target[_typed.length]);
  }
}
