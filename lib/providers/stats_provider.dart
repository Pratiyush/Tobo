import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'preferences_provider.dart';

const _pointsKey = 'stats_points';
const _streakKey = 'stats_streak';
const _lastDayKey = 'stats_last_day';

/// Points per action.
abstract final class Reward {
  static const learn = 2;
  static const practice = 5;
  static const game = 1;
  static const hiveWord = 3;
}

class Stats {
  const Stats({this.points = 0, this.streak = 0, this.lastDay});

  final int points;

  /// Consecutive days with points, counting [lastDay].
  final int streak;

  /// Last day points were earned, as `yyyy-mm-dd`.
  final String? lastDay;

  /// Level 1 at 0 points, 2 at 25, 3 at 100, 4 at 225, ...
  int get level => 1 + sqrt(points / 25).floor();

  /// Fraction of the way to the next level.
  double get levelProgress {
    final floor = 25 * (level - 1) * (level - 1);
    final next = 25 * level * level;
    return (points - floor) / (next - floor);
  }
}

/// The calendar day [n] days before [t]. Not `t.subtract(Duration(days: n))`:
/// that is 24 real hours, and after the spring-forward night (a 23-hour day)
/// 00:30 minus 24 h lands two calendar days back (BUG-32).
DateTime daysAgo(DateTime t, int n) => DateTime(t.year, t.month, t.day - n);

String _dayKey(DateTime t) =>
    '${t.year}-${t.month.toString().padLeft(2, '0')}-'
    '${t.day.toString().padLeft(2, '0')}';

class StatsNotifier extends Notifier<Stats> {
  @override
  Stats build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return Stats(
      points: prefs.getInt(_pointsKey) ?? 0,
      streak: prefs.getInt(_streakKey) ?? 0,
      lastDay: prefs.getString(_lastDayKey),
    );
  }

  void addPoints(int points) {
    final now = ref.read(clockProvider)();
    final today = _dayKey(now);
    final yesterday = _dayKey(daysAgo(now, 1));
    final streak = switch (state.lastDay) {
      final d when d == today => state.streak,
      final d when d == yesterday => state.streak + 1,
      _ => 1,
    };
    state = Stats(
      points: state.points + points,
      streak: streak,
      lastDay: today,
    );
    ref.read(sharedPreferencesProvider)
      ..setInt(_pointsKey, state.points)
      ..setInt(_streakKey, streak)
      ..setString(_lastDayKey, today);
  }

  /// Rewarded "Restore streak": the missed day counts as played, so the
  /// streak continues when points are earned today.
  void restoreStreak() {
    final now = ref.read(clockProvider)();
    final yesterday = _dayKey(daysAgo(now, 1));
    state = Stats(
      points: state.points,
      streak: state.streak,
      lastDay: yesterday,
    );
    ref.read(sharedPreferencesProvider).setString(_lastDayKey, yesterday);
  }

  void reset() {
    state = const Stats();
    ref.read(sharedPreferencesProvider)
      ..remove(_pointsKey)
      ..remove(_streakKey)
      ..remove(_lastDayKey);
  }
}

final statsProvider = NotifierProvider<StatsNotifier, Stats>(StatsNotifier.new);

/// The streak as of today: a missed day shows 0 until points are earned.
final currentStreakProvider = Provider<int>((ref) {
  final stats = ref.watch(statsProvider);
  final now = ref.watch(clockProvider)();
  final live = {_dayKey(now), _dayKey(daysAgo(now, 1))};
  return live.contains(stats.lastDay) ? stats.streak : 0;
});

/// A streak lost by exactly one missed day, which a rewarded ad can restore;
/// 0 otherwise.
final restorableStreakProvider = Provider<int>((ref) {
  final stats = ref.watch(statsProvider);
  final now = ref.watch(clockProvider)();
  final missed = _dayKey(daysAgo(now, 2));
  return stats.lastDay == missed ? stats.streak : 0;
});
