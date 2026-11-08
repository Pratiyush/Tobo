import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/level.dart';
import '../providers/words_provider.dart';
import '../theme/app_theme.dart';
import 'common.dart';
import 'level_badge.dart';

/// "All levels in sequence" or any set of levels. Used by onboarding and
/// Settings; reports every change through [onChanged].
class LevelPicker extends ConsumerWidget {
  const LevelPicker({super.key, required this.value, required this.onChanged});

  final LevelChoice value;
  final ValueChanged<LevelChoice> onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final words = ref.watch(wordsProvider);
    int count(Level l) => words.where((w) => w.level == l).length;
    final theme = Theme.of(context);
    return WhiteCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          ListTile(
            key: const ValueKey('level-sequence'),
            leading: Icon(
              value.sequence
                  ? Icons.radio_button_checked_rounded
                  : Icons.radio_button_unchecked_rounded,
              color: AppColors.blueBottom,
            ),
            title: const Text('All levels in sequence'),
            subtitle: const Text('A1 → A2 → B1 → B2 · recommended'),
            onTap: () => onChanged(const LevelChoice.sequence()),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Or choose one or more levels',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: AppColors.inkSoft,
                ),
              ),
            ),
          ),
          for (final level in Level.values)
            CheckboxListTile(
              key: ValueKey('level-${level.label}'),
              value: !value.sequence && value.levels.contains(level),
              onChanged: (on) {
                final current = value.sequence ? <Level>{} : {...value.levels};
                on == true ? current.add(level) : current.remove(level);
                onChanged(
                  current.isEmpty
                      ? const LevelChoice.sequence()
                      : LevelChoice.only(current),
                );
              },
              secondary: LevelBadge(level: level, large: true),
              title: Text(level.description),
              subtitle: Text('${count(level)} words'),
            ),
        ],
      ),
    );
  }
}
