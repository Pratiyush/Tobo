import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/progress_provider.dart';
import '../providers/speech_provider.dart';
import '../providers/words_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/blue_scaffold.dart';
import '../widgets/common.dart';
import 'learn_screen.dart';
import 'spelling_screen.dart';

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
    final learned = list.words
        .where((w) => progress.containsKey(w.id))
        .toList();

    return BlueScaffold(
      title: list.title,
      onPop: () => ref.read(speakerProvider).stop(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          Row(
            children: [
              const Icon(Icons.info_outline_rounded, color: Colors.white70),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  fresh.isEmpty
                      ? 'You’ve learned every word in this list.'
                      : 'There are ${fresh.length} words left in this list.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _ActionCard(
            label: 'Learn',
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
            label: 'Practice',
            count: learned.length,
            onTap: learned.isEmpty
                ? null
                : () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => SpellingScreen(words: learned),
                    ),
                  ),
          ),
          const SizedBox(height: 20),
          Text(
            'VOCABULARY (${list.words.length})',
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
                        SpeakButton(text: word.display),
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
    final fg = primary ? Colors.white : AppColors.ink;
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
              '$count items',
              style: theme.textTheme.bodyMedium?.copyWith(color: fg),
            ),
            Icon(Icons.chevron_right_rounded, color: fg),
          ],
        ),
      ),
    );
  }
}
