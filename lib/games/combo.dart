/// Consecutive right answers in a round. From the 3rd in a row each answer
/// earns +1 bonus point, from the 6th +2: speed and accuracy pay.
class Combo {
  int current = 0;
  int best = 0;

  static const showFrom = 3;

  /// Records a right answer; returns the bonus points it earns.
  int hit() {
    current++;
    if (current > best) best = current;
    return bonusFor(current);
  }

  void miss() => current = 0;

  static int bonusFor(int streak) => streak >= 6
      ? 2
      : streak >= 3
      ? 1
      : 0;
}

/// 0–3 stars for a round: 90% right earns 3, 70% 2, 40% 1.
int starsFor(int correct, int total) {
  if (total == 0) return 0;
  final r = correct / total;
  return r >= 0.9
      ? 3
      : r >= 0.7
      ? 2
      : r >= 0.4
      ? 1
      : 0;
}
