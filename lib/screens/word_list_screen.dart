import '../widgets/level_badge.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ads/ads_service.dart';
import '../providers/progress_provider.dart';
import '../providers/speech_provider.dart';
import '../providers/words_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/blue_scaffold.dart';
import '../widgets/common.dart';
import 'learn_screen.dart';
import 'spelling_screen.dart';
import '../l10n/l10n_ext.dart';

/// One list: Learn the new words, Practice the learned ones, browse them all.
class WordListScreen extends ConsumerWidget {
  const WordListScreen({super.key, required this.number});

  final int number;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final list = ref.watch(wordListsProvider)[number - 1];
    final progress = ref.watch(progressProvider);
    final fresh = list.words.where((w) => !progress.containsKey(w.id)).toList();
    // Same meaning as the Practice tab: only words that are due, so
    // practising a list never pushes not-yet-due words up the schedule.
    final dueIds = {for (final w in ref.watch(dueWordsProvider)) w.id};
    final due = [
      for (final w in list.words)
        if (dueIds.contains(w.id)) w,
    ];

    return BlueScaffold(
      title: list.title,
      onPop: () => ref.read(speakerProvider).stop(),
      bottom: const AdBanner(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          Row(
            children: [
              LevelBadge(level: list.level, large: true),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  fresh.isEmpty
                      ? context.l10n.wordListAllLearned
                      : context.l10n.wordListWordsLeft(fresh.length),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _ActionCard(
            label: context.l10n.commonLearn,
            count: fresh.length,
            primary: true,
            onTap: fresh.isEmpty
                ? null
                : () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => LearnScreen(words: fresh),
                    ),
                  ),
          ),
          const SizedBox(height: 10),
          _ActionCard(
            label: context.l10n.navPractice,
            count: due.length,
            onTap: due.isEmpty
                ? null
                : () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => SpellingScreen(words: due),
                    ),
                  ),
          ),
          const SizedBox(height: 20),
          Text(
            context.l10n.wordListVocabulary(list.words.length),
            style: theme.textTheme.titleSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          WhiteCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                for (final (i, word) in list.words.indexed) ...[
                  if (i > 0) const Divider(height: 1, indent: 16),
                  ListTile(
                    title: ArticleWord(
                      word: word,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    subtitle: Text(
                      word.english.join(', '),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SpeakButton(word: word),
                        const SizedBox(width: 4),
                        MasteryBars(level: progress[word.id]?.level ?? 0),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required this.label,
    required this.count,
    required this.onTap,
    this.primary = false,
  });

  final String label;
  final int count;
  final VoidCallback? onTap;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fg = AppColors.ink;
    return Opacity(
      opacity: onTap == null ? 0.6 : 1,
      child: WhiteCard(
        color: primary ? AppColors.orange : AppColors.card,
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: Text(
                label.toUpperCase(),
                style: theme.textTheme.titleMedium?.copyWith(
                  color: fg,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ),
            Text(
              context.l10n.commonItems(count),
              style: theme.textTheme.bodyMedium?.copyWith(color: fg),
            ),
            Icon(Icons.chevron_right_rounded, color: fg),
          ],
        ),
      ),
    );
  }
}
