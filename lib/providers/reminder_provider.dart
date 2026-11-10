import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/reminders.dart';
import 'preferences_provider.dart';

const reminderOnKey = 'reminder_on';
const reminderMinutesKey = 'reminder_minutes';

/// 19:00: after work or school, before the evening is gone.
const defaultReminderMinutes = 19 * 60;

class ReminderSetting {
  const ReminderSetting({required this.on, required this.minutes});

  final bool on;

  /// Minutes after midnight, device time.
  final int minutes;
}

/// The opt-in daily reminder: off until the learner switches it on, and on
/// only if the OS allows notifications.
class ReminderNotifier extends Notifier<ReminderSetting> {
  @override
  ReminderSetting build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return ReminderSetting(
      on: prefs.getBool(reminderOnKey) ?? false,
      minutes: prefs.getInt(reminderMinutesKey) ?? defaultReminderMinutes,
    );
  }

  Reminders get _reminders => ref.read(remindersProvider);

  void _save({required bool on, required int minutes}) {
    state = ReminderSetting(on: on, minutes: minutes);
    ref.read(sharedPreferencesProvider)
      ..setBool(reminderOnKey, on)
      ..setInt(reminderMinutesKey, minutes);
  }

  /// Asks for permission, then schedules. False (and still off) when the
  /// OS refuses or the plugin fails.
  Future<bool> turnOn() async {
    try {
      if (!await _reminders.requestPermission()) return false;
      await _reminders.schedule(state.minutes);
    } on Object catch (e) {
      developer.log('reminder not scheduled: $e', name: 'reminder');
      return false;
    }
    _save(on: true, minutes: state.minutes);
    return true;
  }

  Future<void> turnOff() async {
    _save(on: false, minutes: state.minutes);
    try {
      await _reminders.cancel();
    } on Object catch (e) {
      developer.log('reminder not cancelled: $e', name: 'reminder');
    }
  }

  Future<void> setTime(int minutes) async {
    _save(on: state.on, minutes: minutes);
    if (state.on) await sync();
  }

  /// At launch: puts an "on" reminder back at its wall-clock time (after a
  /// reboot, an update or a clock change). Never asks for permission.
  Future<void> sync() async {
    if (!state.on) return;
    try {
      await _reminders.schedule(state.minutes);
    } on Object catch (e) {
      developer.log('reminder not rescheduled: $e', name: 'reminder');
    }
  }
}

final reminderProvider = NotifierProvider<ReminderNotifier, ReminderSetting>(
  ReminderNotifier.new,
);
