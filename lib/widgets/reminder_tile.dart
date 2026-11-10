import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/reminder_provider.dart';
import '../services/reminders.dart';
import '../l10n/l10n_ext.dart';

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
          title: Text(context.l10n.reminderSwitch),
          subtitle: Text(
            reminder.on
                ? context.l10n.reminderOnAt(time)
                : context.l10n.reminderOff,
          ),
          value: reminder.on,
          onChanged: (on) async {
            if (!on) return notifier.turnOff();
            final messenger = ScaffoldMessenger.of(context);
            final blocked = context.l10n.reminderBlocked;
            final texts = reminderTexts(context.l10n);
            if (!await notifier.turnOn(texts)) {
              messenger.showSnackBar(SnackBar(content: Text(blocked)));
            }
          },
        ),
        if (reminder.on)
          ListTile(
            key: const ValueKey('reminder-time'),
            leading: const Icon(Icons.schedule),
            title: Text(context.l10n.reminderTime),
            trailing: Text(
              time,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () async {
              final texts = reminderTexts(context.l10n);
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
                await notifier.setTime(picked.hour * 60 + picked.minute, texts);
              }
            },
          ),
      ],
    );
  }
}
