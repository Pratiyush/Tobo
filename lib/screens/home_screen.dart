import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/word_repository.dart';
import '../providers/progress_provider.dart';
import '../providers/stats_provider.dart';
import '../providers/words_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/blue_scaffold.dart';
import '../widgets/common.dart';
import 'word_list_screen.dart';

/// Streak, level, stats, then every word list with its progress ring.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lists = ref.watch(wordListsProvider);
    final progress = ref.watch(progressProvider);
    return BlueScaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          const _Header(),
          const SizedBox(height: 16),
          for (final list in lists) ...[
            _WordListCard(
              list: list,
              learned: list.words
                  .where((w) => progress.containsKey(w.id))
                  .length,
            ),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

class _Header extends ConsumerWidget {
  const _Header();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final stats = ref.watch(statsProvider);
    final streak = ref.watch(currentStreakProvider);
    final due = ref.watch(dueWordsProvider).length;
    final learned = ref.watch(learnedWordsProvider).length;
    final white = theme.textTheme.titleMedium?.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w800,
    );
    return Column(
      children: [
        Row(
          children: [
            Semantics(
              label: 'Streak $streak days',
              child: Row(
                children: [
                  const Text('🔥', style: TextStyle(fontSize: 22)),
                  const SizedBox(width: 4),
                  Text('$streak', style: white),
                ],
              ),
            ),
            const Spacer(),
            Text('WORTSCHATZ', style: white?.copyWith(letterSpacing: 2)),
            const Spacer(),
            const SizedBox(width: 40),
          ],
        ),
        const SizedBox(height: 12),
        _LevelBadge(level: stats.level, progress: stats.levelProgress),
        const SizedBox(height: 16),
        WhiteCard(
          child: Row(
            children: [
              _Stat(label: 'Points', value: stats.points),
              _Stat(label: 'To practise', value: due),
              _Stat(label: 'Vocabulary', value: learned),
            ],
          ),
        ),
      ],
    );
  }
}

class _LevelBadge extends StatelessWidget {
  const _LevelBadge({required this.level, required this.progress});

  final int level;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      label: 'Level $level',
      excludeSemantics: true,
      child: SizedBox.square(
        dimension: 112,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox.expand(
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 8,
                backgroundColor: Colors.white24,
                color: AppColors.gold,
                strokeCap: StrokeCap.round,
              ),
            ),
            Container(
              width: 86,
              height: 86,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [AppColors.orange, AppColors.orangeDeep],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$level',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'LEVEL',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        children: [
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelMedium?.copyWith(
              color: AppColors.inkSoft,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '$value',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _WordListCard extends StatelessWidget {
  const _WordListCard({required this.list, required this.learned});

  final WordList list;
  final int learned;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final total = list.words.length;
    return WhiteCard(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => WordListScreen(number: list.number),
        ),
      ),
      child: Row(
        children: [
          ProgressRing(value: total == 0 ? 0 : learned / total),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  list.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  '$total items · ${list.words.first.german} … '
                  '${list.words.last.german}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.inkSoft,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: AppColors.inkSoft),
        ],
      ),
    );
  }
}
