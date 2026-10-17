import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/progress_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/blue_scaffold.dart';
import '../widgets/common.dart';
import 'der_die_das_screen.dart';
import 'fallee_screen.dart';
import 'hive_screen.dart';
import 'spelling_screen.dart';

/// The Practice tab: the due-words spelling drill, then the three games.
class PracticeScreen extends ConsumerWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final due = ref.watch(dueWordsProvider);
    final learned = ref.watch(learnedWordsProvider);
    void open(Widget screen) =>
        Navigator.of(context)
            .push(MaterialPageRoute<void>(builder: (_) => screen));

    final heading = theme.textTheme.titleMedium?.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w900,
      letterSpacing: 1.5,
    );
    return BlueScaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          Center(child: Text('PRACTICE', style: heading)),
          const SizedBox(height: 16),
          WhiteCard(
            color: AppColors.orange,
            onTap: due.isEmpty ? null : () => open(SpellingScreen(words: due)),
            child: Row(
              children: [
                const Icon(Icons.keyboard_rounded, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PRACTICE',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        due.isNotEmpty
                            ? 'Spell the words that are due'
                            : learned.isEmpty
                            ? 'Learn some words first'
                            : 'All caught up. Come back tomorrow!',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${due.length} items',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Icon(Icons.chevron_right_rounded, color: Colors.white),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text('GAMES', style: heading),
          const SizedBox(height: 12),
          _GameCard(
            title: 'Hive',
            subtitle: 'Swipe across the honeycomb to spell each word',
            icon: Icons.hexagon_rounded,
            color: AppColors.orange,
            onTap: () => open(const HiveScreen()),
          ),
          const SizedBox(height: 10),
          _GameCard(
            title: 'Der Die Das',
            subtitle: 'Pick the right article',
            icon: Icons.circle,
            color: AppColors.die,
            onTap: () => open(const DerDieDasScreen()),
            leading: const _FlagDots(),
          ),
          const SizedBox(height: 10),
          _GameCard(
            title: 'Fallee',
            subtitle: 'Choose the meaning before the word lands',
            icon: Icons.view_in_ar_rounded,
            color: AppColors.blueTop,
            onTap: () => open(const FalleeScreen()),
          ),
        ],
      ),
    );
  }
}

class _GameCard extends StatelessWidget {
  const _GameCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
    this.leading,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WhiteCard(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox.square(
            dimension: 48,
            child: leading ?? Icon(icon, color: color, size: 40),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  subtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.inkSoft,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.play_circle_fill_rounded,
            color: AppColors.orange,
            size: 32,
          ),
        ],
      ),
    );
  }
}

class _FlagDots extends StatelessWidget {
  const _FlagDots();

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for (final c in const [AppColors.der, AppColors.die, AppColors.das])
        Container(
          width: 14,
          height: 14,
          margin: const EdgeInsets.symmetric(horizontal: 1),
          decoration: BoxDecoration(color: c, shape: BoxShape.circle),
        ),
    ],
  );
}
