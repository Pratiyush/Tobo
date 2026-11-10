// Daily habit (better-loop): an opt-in reminder, once a day at a time the
// learner picks. Off by default; asks for notification permission only when
// switched on; rescheduled at every launch so a reboot or a daylight-saving
// change can't leave it at the wrong hour.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/providers/preferences_provider.dart';
import 'package:german_words/providers/reminder_provider.dart';
import 'package:german_words/services/reminders.dart';

import 'helpers.dart';

Future<void> _openSettings(WidgetTester tester) async {
  await tester.tap(find.text('Settings'));
  await tester.pumpAndSettle();
  await tester.ensureVisible(find.text('Daily reminder'));
  await tester.pumpAndSettle();
}

void main() {
  group('next reminder time (device wall clock)', () {
    test('later today, or tomorrow once the time has passed', () {
      expect(
        nextReminder(19 * 60, DateTime(2026, 11, 10, 10)),
        DateTime(2026, 11, 10, 19),
      );
      expect(
        nextReminder(19 * 60, DateTime(2026, 11, 10, 19)),
        DateTime(2026, 11, 11, 19),
        reason: 'exactly now is already past',
      );
      expect(
        nextReminder(7 * 60 + 30, DateTime(2026, 11, 10, 20)),
        DateTime(2026, 11, 11, 7, 30),
      );
    });

    test('a calendar day, not 24 hours, across a clock change', () {
      // Berlin springs forward on 28 March 2027 (the fast gate runs in
      // Europe/Berlin): 24 h after 19:00 on the 27th is 20:00 on the 28th.
      final next = nextReminder(19 * 60, DateTime(2027, 3, 27, 19, 30));
      expect((next.day, next.hour, next.minute), (28, 19, 0));
    });

    test('month and year ends roll over', () {
      expect(
        nextReminder(8 * 60, DateTime(2026, 12, 31, 9)),
        DateTime(2027, 1, 1, 8),
      );
    });

    test('times are shown on a 24-hour clock', () {
      expect(formatReminderTime(19 * 60), '19:00');
      expect(formatReminderTime(7 * 60 + 5), '07:05');
      expect(formatReminderTime(0), '00:00');
    });
  });

  group('reminder setting', () {
    test('off by default: nothing asked, nothing scheduled', () async {
      final fake = FakeReminders();
      final c = await createContainer(reminders: fake);
      expect(c.read(reminderProvider).on, isFalse);
      expect(c.read(reminderProvider).minutes, defaultReminderMinutes);
      await c.read(reminderProvider.notifier).sync();
      expect(fake.asked, 0);
      expect(fake.scheduled, isEmpty);
    });

    test('switching on asks once, schedules and persists', () async {
      final fake = FakeReminders();
      final c = await createContainer(reminders: fake);
      expect(await c.read(reminderProvider.notifier).turnOn(), isTrue);
      expect(fake.asked, 1);
      expect(fake.scheduled, [defaultReminderMinutes]);
      expect(c.read(reminderProvider).on, isTrue);
      expect(c.read(sharedPreferencesProvider).getBool(reminderOnKey), isTrue);
    });

    test('permission refused: stays off, nothing scheduled', () async {
      final fake = FakeReminders(grant: false);
      final c = await createContainer(reminders: fake);
      expect(await c.read(reminderProvider.notifier).turnOn(), isFalse);
      expect(c.read(reminderProvider).on, isFalse);
      expect(fake.scheduled, isEmpty);
      expect(
        c.read(sharedPreferencesProvider).getBool(reminderOnKey),
        isNot(true),
      );
    });

    test('a new time reschedules when on, and is kept when off', () async {
      final fake = FakeReminders();
      final c = await createContainer(reminders: fake);
      final n = c.read(reminderProvider.notifier);
      await n.setTime(8 * 60);
      expect(fake.scheduled, isEmpty, reason: 'off: only remembered');
      await n.turnOn();
      expect(fake.scheduled, [8 * 60]);
      await n.setTime(21 * 60 + 15);
      expect(fake.scheduled.last, 21 * 60 + 15);
      expect(
        c.read(sharedPreferencesProvider).getInt(reminderMinutesKey),
        21 * 60 + 15,
      );
    });

    test('switching off cancels it', () async {
      final fake = FakeReminders();
      final c = await createContainer(reminders: fake);
      await c.read(reminderProvider.notifier).turnOn();
      await c.read(reminderProvider.notifier).turnOff();
      expect(fake.cancels, 1);
      expect(c.read(reminderProvider).on, isFalse);
      expect(c.read(sharedPreferencesProvider).getBool(reminderOnKey), isFalse);
    });

    test('a failing plugin leaves it off instead of crashing', () async {
      final c = await createContainer(reminders: _BrokenReminders());
      expect(await c.read(reminderProvider.notifier).turnOn(), isFalse);
      expect(c.read(reminderProvider).on, isFalse);
      await c.read(reminderProvider.notifier).sync();
    });
  });

  testWidgets('launch reschedules an "on" reminder at its time', (
    tester,
  ) async {
    final fake = FakeReminders();
    final c = await createContainer(
      reminders: fake,
      prefs: {reminderOnKey: true, reminderMinutesKey: 8 * 60},
    );
    await tester.pumpWidget(buildApp(c));
    await tester.pumpAndSettle();
    expect(fake.scheduled, [8 * 60]);
    expect(fake.asked, 0, reason: 'never re-asks at launch');
  });

  testWidgets('Settings: switch it on, then the time shows', (tester) async {
    final fake = FakeReminders();
    final c = await createContainer(reminders: fake);
    await tester.pumpWidget(buildApp(c));
    await _openSettings(tester);
    expect(find.text('Reminder time'), findsNothing);

    await tester.tap(find.text('Daily reminder'));
    await tester.pumpAndSettle();
    expect(c.read(reminderProvider).on, isTrue);
    await tester.ensureVisible(find.text('Reminder time'));
    expect(find.text('19:00'), findsOneWidget);
  });

  testWidgets('Settings: a refused permission says where to allow it', (
    tester,
  ) async {
    final c = await createContainer(reminders: FakeReminders(grant: false));
    await tester.pumpWidget(buildApp(c));
    await _openSettings(tester);
    await tester.tap(find.text('Daily reminder'));
    await tester.pumpAndSettle();
    expect(c.read(reminderProvider).on, isFalse);
    expect(find.textContaining('Allow notifications'), findsOneWidget);
  });

  testWidgets('Settings fits at 360 dp with the reminder on', (tester) async {
    tester.view.physicalSize = const Size(360, 740);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final c = await createContainer(prefs: {reminderOnKey: true});
    await tester.pumpWidget(buildApp(c));
    await _openSettings(tester);
    await tester.ensureVisible(find.text('Reminder time'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}

class _BrokenReminders implements Reminders {
  @override
  Future<bool> requestPermission() async => true;

  @override
  Future<void> schedule(int minutesOfDay) => Future.error(StateError('no'));

  @override
  Future<void> cancel() async {}
}
