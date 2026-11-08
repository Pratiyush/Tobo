import 'package:flutter/material.dart';

import '../models/level.dart';
import '../theme/app_theme.dart';

/// "A1" pill. Colours pass WCAG AA: ink on green and orange, white on blue
/// and flag red.
class LevelBadge extends StatelessWidget {
  const LevelBadge({super.key, required this.level, this.large = false});

  final Level level;
  final bool large;

  static (Color, Color) colours(Level level) => switch (level) {
    Level.a1 => (AppColors.green, AppColors.ink),
    Level.a2 => (AppColors.blueBottom, Colors.white),
    Level.b1 => (AppColors.orange, AppColors.ink),
    Level.b2 => (AppColors.die, Colors.white),
  };

  @override
  Widget build(BuildContext context) {
    final (bg, fg) = colours(level);
    return Semantics(
      label: 'Level ${level.label}',
      excludeSemantics: true,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: large ? 10 : 7,
          vertical: large ? 3 : 1,
        ),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          level.label,
          style:
              (large
                      ? Theme.of(context).textTheme.labelLarge
                      : Theme.of(context).textTheme.labelSmall)
                  ?.copyWith(color: fg, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
