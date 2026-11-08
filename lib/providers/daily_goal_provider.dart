import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'preferences_provider.dart';

const _dayKey = 'goal_day';
const _doneKey = 'goal_done';

/// Words learned plus right answers in practice and games per day.
const dailyGoal = 10;

String _today(DateTime t) =>
    '${t.year}-${t.month.toString().padLeft(2, '0')}-'
    '${t.day.toString().padLeft(2, '0')}';

/// Today's progress towards [dailyGoal]: a gentle reason to come back, no
/// notifications. Bonus and rewarded points don't count, only real answers.
class DailyGoalNotifier extends Notifier<int> {
  @override
  int build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final today = _today(ref.watch(clockProvider)());
    return prefs.getString(_dayKey) == today ? prefs.getInt(_doneKey) ?? 0 : 0;
  }

  /// One word learned or one right answer.
  void tick() {
    final prefs = ref.read(sharedPreferencesProvider);
    final today = _today(ref.read(clockProvider)());
    final done =
        (prefs.getString(_dayKey) == today ? prefs.getInt(_doneKey) ?? 0 : 0) +
        1;
    state = done;
    prefs
      ..setString(_dayKey, today)
      ..setInt(_doneKey, done);
  }
}

final dailyGoalProvider = NotifierProvider<DailyGoalNotifier, int>(
  DailyGoalNotifier.new,
);
