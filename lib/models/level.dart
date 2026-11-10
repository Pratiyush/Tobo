/// CEFR levels Wortschatz teaches, easiest first.
enum Level {
  a1('A1'),
  a2('A2'),
  b1('B1'),
  b2('B2');

  const Level(this.label);

  /// The CEFR code. Its name ("Beginner"…) is UI: levelName in
  /// lib/l10n/l10n_ext.dart.
  final String label;

  /// The level of a word's `cefr` field; unknown values count as A1.
  static Level of(String cefr) {
    final upper = cefr.toUpperCase();
    for (final l in values) {
      if (l.label == upper) return l;
    }
    return a1;
  }
}

/// What the learner chose: every level in sequence (A1 → A2 → B1 → B2, the
/// default), or one or more levels.
class LevelChoice {
  const LevelChoice.sequence() : sequence = true, levels = const {};

  LevelChoice.only(Set<Level> levels)
    : assert(levels.isNotEmpty, 'choose at least one level'),
      sequence = false,
      levels = Set.unmodifiable(levels);

  final bool sequence;

  /// The chosen levels when not [sequence].
  final Set<Level> levels;

  bool includes(Level level) => sequence || levels.contains(level);

  /// Included levels, easiest first.
  List<Level> get active => [
    for (final l in Level.values)
      if (includes(l)) l,
  ];

  /// Stored as `["sequence"]` or the labels, e.g. `["A2", "B1"]`.
  List<String> toPrefs() =>
      sequence ? const ['sequence'] : [for (final l in active) l.label];

  static LevelChoice fromPrefs(List<String>? stored) {
    if (stored == null || stored.isEmpty || stored.contains('sequence')) {
      return const LevelChoice.sequence();
    }
    final levels = {
      for (final s in stored)
        for (final l in Level.values)
          if (l.label == s) l,
    };
    return levels.isEmpty
        ? const LevelChoice.sequence()
        : LevelChoice.only(levels);
  }

  @override
  bool operator ==(Object other) =>
      other is LevelChoice &&
      other.sequence == sequence &&
      other.levels.length == levels.length &&
      other.levels.containsAll(levels);

  @override
  int get hashCode => Object.hash(sequence, Object.hashAllUnordered(levels));
}
