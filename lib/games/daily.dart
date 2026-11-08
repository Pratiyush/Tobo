import 'dart:math';

import '../models/level.dart';
import '../models/word.dart';

/// Today's Hive board for one level: the same three words for every learner
/// on that day, so results can be compared and shared.
class DailyHive {
  const DailyHive(this.day, this.level);

  final DateTime day;
  final Level level;

  String get date =>
      '${day.year}-${day.month.toString().padLeft(2, '0')}-'
      '${day.day.toString().padLeft(2, '0')}';

  /// Same for everyone on [date] at [level].
  int get seed =>
      day.year * 10000 + day.month * 100 + day.day + level.index * 100000000;

  Random get random => Random(seed);

  /// Words the board may use: the level's words in deck order, so the pick
  /// depends only on the date and the level, never on anyone's progress.
  List<Word> pool(List<Word> deck) => [
    for (final w in deck)
      if (w.level == level) w,
  ];

  String get prefsKey => 'daily_hive_${date}_${level.label}';

  static const _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  /// "Wortschatz Daily Hive · 9 Nov · A1 · ★★★ · no hints"
  String shareText({required int stars, required int hints}) {
    final starText = '${'★' * stars}${'☆' * (3 - stars)}';
    final hintText = switch (hints) {
      0 => 'no hints',
      1 => '1 hint',
      _ => '$hints hints',
    };
    return 'Wortschatz Daily Hive · ${day.day} ${_months[day.month - 1]} · '
        '${level.label} · $starText · $hintText';
  }
}

/// The level today's board uses: the first chosen level with unlearned
/// words, else the highest chosen level.
Level dailyLevel(List<Level> chosen, bool Function(Level) hasUnlearned) {
  for (final l in chosen) {
    if (hasUnlearned(l)) return l;
  }
  return chosen.last;
}
