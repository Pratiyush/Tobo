import 'learn_screen.dart';
import '../providers/daily_goal_provider.dart';
import '../providers/settings_provider.dart';
import '../widgets/level_badge.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/content_update.dart';
import '../ads/ad_widgets.dart';
import '../data/word_repository.dart';
import '../providers/progress_provider.dart';
import '../providers/stats_provider.dart';
import '../providers/words_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/blue_scaffold.dart';
import '../widgets/common.dart';
import 'word_list_screen.dart';
import '../l10n/l10n_ext.dart';

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
        Stack(
          alignment: Alignment.center,
          children: [
            Text('WORTSCHATZ', style: white?.copyWith(letterSpacing: 2)),
            Align(
              alignment: Alignment.centerLeft,
              child: Semantics(
                label: context.l10n.homeStreak(streak),
                child: Row(
                  children: [
                    const Text('🔥', style: TextStyle(fontSize: 22)),
                    const SizedBox(width: 4),
                    Text('$streak', style: white),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _LevelBadge(level: stats.level, progress: stats.levelProgress),
        const SizedBox(height: 16),
        WhiteCard(
          child: Row(
            children: [
              _Stat(label: context.l10n.homePoints, value: stats.points),
              _Stat(label: context.l10n.homeToPractise, value: due),
              _Stat(label: context.l10n.homeVocabulary, value: learned),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const _LevelProgress(),
        const SizedBox(height: 12),
        const _TodayCard(),
        const StreakRestoreCard(),
        const ContentUpdateCard(),
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
      label: context.l10n.homeLevel(level),
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
              padding: const EdgeInsets.all(8),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$level',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: AppColors.ink,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'LEVEL',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: AppColors.ink,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
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
          // Shrinks instead of cutting off: "To practise" did at 360 dp
          // with large text (BUG-39), and most languages are longer.
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              maxLines: 1,
              style: theme.textTheme.labelMedium?.copyWith(
                color: AppColors.inkSoft,
              ),
            ),
          ),
          const SizedBox(height: 2),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '$value',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
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
                Row(
                  children: [
                    Text(
                      list.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(width: 8),
                    LevelBadge(level: list.level),
                  ],
                ),
                Text(
                  context.l10n.homeListSummary(
                    total,
                    list.words.first.german,
                    list.words.last.german,
                  ),
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

/// Learned words per chosen level, e.g. "A1 12/531" with a thin bar.
class _LevelProgress extends ConsumerWidget {
  const _LevelProgress();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final choice = ref.watch(settingsProvider.select((s) => s.levels));
    final progress = ref.watch(levelProgressProvider);
    final theme = Theme.of(context);
    return Row(
      children: [
        for (final level in choice.active) ...[
          if (level != choice.active.first) const SizedBox(width: 8),
          Expanded(
            child: Semantics(
              label: context.l10n.homeLevelProgress(
                level.label,
                progress[level]!.learned,
                progress[level]!.total,
              ),
              excludeSemantics: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      LevelBadge(level: level),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          '${progress[level]!.learned}/${progress[level]!.total}',
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: LinearProgressIndicator(
                      value: progress[level]!.total == 0
                          ? 0
                          : progress[level]!.learned / progress[level]!.total,
                      minHeight: 5,
                      backgroundColor: Colors.white24,
                      color: AppColors.gold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

/// New learners: one tap to their first words. Afterwards: today's goal.
class _TodayCard extends ConsumerWidget {
  const _TodayCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final progress = ref.watch(progressProvider);
    final lists = ref.watch(wordListsProvider);
    if (progress.isEmpty && lists.isNotEmpty) {
      final first = lists.first.words;
      return WhiteCard(
        key: const ValueKey('start-here'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              context.l10n.homeStartHere,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              context.l10n.homeStartHereBody,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.inkSoft,
              ),
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => LearnScreen(words: first),
                ),
              ),
              icon: const Icon(Icons.play_arrow_rounded),
              label: Text(context.l10n.homeLearn10),
            ),
          ],
        ),
      );
    }
    final done = ref.watch(dailyGoalProvider);
    final reached = done >= dailyGoal;
    return WhiteCard(
      key: const ValueKey('daily-goal'),
      child: Row(
        children: [
          SizedBox.square(
            dimension: 48,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: (done / dailyGoal).clamp(0.0, 1.0),
                  strokeWidth: 6,
                  backgroundColor: AppColors.track,
                  color: reached ? AppColors.green : AppColors.orange,
                  strokeCap: StrokeCap.round,
                ),
                Center(
                  child: reached
                      ? const Icon(
                          Icons.check_rounded,
                          color: AppColors.greenInk,
                        )
                      : Text(
                          '$done',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reached
                      ? context.l10n.homeGoalReached
                      : context.l10n.homeGoal,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  reached
                      ? context.l10n.homeGoalReachedBody
                      : context.l10n.homeGoalProgress(done, dailyGoal),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.inkSoft,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
