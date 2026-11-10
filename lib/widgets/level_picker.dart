import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/level.dart';
import '../providers/words_provider.dart';
import '../theme/app_theme.dart';
import 'common.dart';
import 'level_badge.dart';
import '../l10n/l10n_ext.dart';

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
            title: Text(context.l10n.levelAllInSequence),
            subtitle: Text(context.l10n.levelSequenceSub),
            onTap: () => onChanged(const LevelChoice.sequence()),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                context.l10n.levelOrChoose,
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
              // One line that shrinks: "Upper intermediate" broke over
              // three lines at 360 dp with large text (BUG-41).
              title: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: AlignmentDirectional.centerStart,
                child: Text(levelName(context.l10n, level), maxLines: 1),
              ),
              subtitle: Text(context.l10n.levelWordCount(count(level))),
            ),
        ],
      ),
    );
  }
}
