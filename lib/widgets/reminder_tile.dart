import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/reminder_provider.dart';
import '../services/reminders.dart';

/// Settings rows for the opt-in daily reminder.
class ReminderTile extends ConsumerWidget {
  const ReminderTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminder = ref.watch(reminderProvider);
    final notifier = ref.read(reminderProvider.notifier);
    final time = formatReminderTime(reminder.minutes);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SwitchListTile(
          title: const Text('Daily reminder'),
          subtitle: Text(
            reminder.on
                ? 'One nudge a day at $time'
                : 'One nudge a day, at a time you choose',
          ),
          value: reminder.on,
          onChanged: (on) async {
            if (!on) return notifier.turnOff();
            final messenger = ScaffoldMessenger.of(context);
            if (!await notifier.turnOn()) {
              messenger.showSnackBar(
                const SnackBar(
                  content: Text(
                    'Allow notifications for Wortschatz in your phone '
                    'settings to get a reminder.',
                  ),
                ),
              );
            }
          },
        ),
        if (reminder.on)
          ListTile(
            key: const ValueKey('reminder-time'),
            leading: const Icon(Icons.schedule),
            title: const Text('Reminder time'),
            trailing: Text(
              time,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () async {
              final picked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay(
                  hour: reminder.minutes ~/ 60,
                  minute: reminder.minutes % 60,
                ),
                builder: (context, child) => MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(alwaysUse24HourFormat: true),
                  child: child!,
                ),
              );
              if (picked != null) {
                await notifier.setTime(picked.hour * 60 + picked.minute);
              }
            },
          ),
      ],
    );
  }
}
