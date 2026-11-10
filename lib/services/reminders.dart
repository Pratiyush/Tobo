// The opt-in daily reminder (better-loop: daily habit). One local
// notification a day at a time the learner picks; nothing leaves the device.
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

/// Schedules the reminder. Tests use `FakeReminders` (test/helpers.dart).
abstract interface class Reminders {
  /// Asks the OS for permission to notify; true when allowed.
  Future<bool> requestPermission();

  /// Replaces any reminder with one every day at [minutesOfDay] after
  /// midnight, device time, saying [texts] (in the UI language).
  Future<void> schedule(int minutesOfDay, ReminderTexts texts);

  Future<void> cancel();
}

final remindersProvider = Provider<Reminders>((ref) => LocalReminders());

/// What the notification says, in the UI language (reminderTexts in
/// lib/l10n/l10n_ext.dart builds it). The title stays German on purpose.
class ReminderTexts {
  const ReminderTexts({
    required this.body,
    required this.channel,
    required this.channelDescription,
  });

  static const title = 'Zeit für Wörter';
  final String body;
  final String channel;
  final String channelDescription;
}

/// The next [minutesOfDay] on the device's wall clock after [now]: later
/// today, or tomorrow once it has passed. Tomorrow is a calendar day, not 24
/// hours, so a clock change can't shift it by an hour.
DateTime nextReminder(int minutesOfDay, DateTime now) {
  final h = minutesOfDay ~/ 60, m = minutesOfDay % 60;
  final today = DateTime(now.year, now.month, now.day, h, m);
  return today.isAfter(now)
      ? today
      : DateTime(now.year, now.month, now.day + 1, h, m);
}

/// 24-hour clock, as German learners read it: 19:00, 07:05.
String formatReminderTime(int minutesOfDay) {
  String two(int n) => n.toString().padLeft(2, '0');
  return '${two(minutesOfDay ~/ 60)}:${two(minutesOfDay % 60)}';
}

/// flutter_local_notifications. Created lazily: the plugin starts platform
/// objects on first use, which must not slow the cold start.
class LocalReminders implements Reminders {
  static const _id = 1;

  FlutterLocalNotificationsPlugin? _plugin;

  Future<FlutterLocalNotificationsPlugin> _ready() async {
    if (_plugin case final p?) return p;
    final p = FlutterLocalNotificationsPlugin();
    await p.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        // Ask only when the learner switches the reminder on.
        iOS: DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
        ),
      ),
    );
    tzdata.initializeTimeZones();
    return _plugin = p;
  }

  @override
  Future<bool> requestPermission() async {
    final p = await _ready();
    if (p
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >()
        case final android?) {
      return await android.requestNotificationsPermission() ?? false;
    }
    final ios = p
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >();
    return await ios?.requestPermissions(alert: true, sound: true) ?? false;
  }

  /// The wall-clock time comes from Dart's DateTime, which knows the
  /// device's zone; the timezone package doesn't (tz.local is UTC), so the
  /// instant is handed over in UTC. The daily repeat then holds that UTC
  /// time, which would drift an hour at a clock change, so the app
  /// reschedules at every launch (ReminderNotifier.sync).
  @override
  Future<void> schedule(int minutesOfDay, ReminderTexts texts) async {
    final p = await _ready();
    await p.cancel(id: _id);
    final when = nextReminder(minutesOfDay, DateTime.now()).toUtc();
    await p.zonedSchedule(
      id: _id,
      title: ReminderTexts.title,
      // Says what is waiting, never what will be lost: no streak count, no
      // countdown, no warning.
      body: texts.body,
      scheduledDate: tz.TZDateTime.from(when, tz.UTC),
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_reminder',
          texts.channel,
          channelDescription: texts.channelDescription,
        ),
        iOS: const DarwinNotificationDetails(),
      ),
      // A daily nudge needs no exact alarm (a special permission on
      // Android 13+).
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  @override
  Future<void> cancel() async => (await _ready()).cancel(id: _id);

  /// Reminders the OS holds, for the device-tier test.
  @visibleForTesting
  Future<List<int>> pendingIds() async => [
    for (final r in await (await _ready()).pendingNotificationRequests()) r.id,
  ];
}
