import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/word.dart';
import '../providers/progress_provider.dart';
import '../providers/settings_provider.dart';
import '../providers/speech_provider.dart';
import '../providers/stats_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/blue_scaffold.dart';
import '../widgets/common.dart';

/// New words per Learn session.
const learnSessionSize = 10;

/// Flashcards: German on the front, meaning and example on the back.
/// "Know it" learns the word; "Later" sends it to the back of the deck.
class LearnScreen extends ConsumerStatefulWidget {
  const LearnScreen({super.key, required this.words});

  final List<Word> words;

  @override
  ConsumerState<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends ConsumerState<LearnScreen> {
  late final List<Word> _deck = widget.words.take(learnSessionSize).toList();
  bool _flipped = false;
  int _known = 0;

  @override
  void initState() {
    super.initState();
    _autoSpeak();
  }

  void _autoSpeak() {
    if (_deck.isEmpty || !ref.read(settingsProvider).autoSpeak) return;
    ref.read(speakerProvider).say(_deck.first.display);
  }

  void _flip() => setState(() => _flipped = !_flipped);

  void _later() {
    setState(() {
      _deck.add(_deck.removeAt(0));
      _flipped = false;
    });
    _autoSpeak();
  }

  void _know() {
    final word = _deck.removeAt(0);
    ref.read(progressProvider.notifier).learn(word.id);
    ref.read(statsProvider.notifier).addPoints(Reward.learn);
    setState(() {
      _known++;
      _flipped = false;
    });
    _autoSpeak();
  }

  @override
  Widget build(BuildContext context) {
    final total = min(widget.words.length, learnSessionSize);
    return BlueScaffold(
      title: 'Learn',
      onPop: () => ref.read(speakerProvider).stop(),
      body: _deck.isEmpty
          ? SessionSummary(
              title: 'Wunderbar!',
              message:
                  'You learned $_known new '
                  '${_known == 1 ? 'word' : 'words'}. They’ll come back '
                  'for practice tomorrow.',
              onAgain: null,
            )
          : Column(
              children: [
                GameHeader(
                  index: _known,
                  total: total,
                  score: _known * Reward.learn,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      transitionBuilder: (child, anim) =>
                          ScaleTransition(scale: anim, child: child),
                      child: _flipped
                          ? _Back(
                              key: ValueKey('back-${_deck.first.id}'),
                              word: _deck.first,
                            )
                          : _Front(
                              key: ValueKey('front-${_deck.first.id}'),
                              word: _deck.first,
                              onFlip: _flip,
                            ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: _flipped
                      ? Row(
                          children: [
                            Expanded(
                              child: FilledButton.icon(
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: AppColors.ink,
                                ),
                                onPressed: _later,
                                icon: const Icon(Icons.hourglass_bottom),
                                label: const Text('LATER'),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: FilledButton.icon(
                                style: FilledButton.styleFrom(
                                  backgroundColor: AppColors.green,
                                ),
                                onPressed: _know,
                                icon: const Icon(Icons.check_circle_rounded),
                                label: const Text('KNOW IT'),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            onPressed: _flip,
                            icon: const Icon(Icons.flip_rounded),
                            label: const Text('FLIP'),
                          ),
                        ),
                ),
              ],
            ),
    );
  }
}

class _Front extends StatelessWidget {
  const _Front({super.key, required this.word, required this.onFlip});

  final Word word;
  final VoidCallback onFlip;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WhiteCard(
      onTap: onFlip,
      padding: const EdgeInsets.all(24),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ArticleWord(
              word: word,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            if (word.pluralDisplay != null) ...[
              const SizedBox(height: 6),
              Text(
                'pl. ${word.pluralDisplay}',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: AppColors.inkSoft,
                ),
              ),
            ],
            const SizedBox(height: 8),
            Text(
              word.pos,
              style: theme.textTheme.labelLarge?.copyWith(
                color: AppColors.inkSoft,
              ),
            ),
            const SizedBox(height: 28),
            SpeakButton(text: word.display, size: 72, filled: true),
          ],
        ),
      ),
    );
  }
}

class _Back extends StatelessWidget {
  const _Back({super.key, required this.word});

  final Word word;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WhiteCard(
      padding: const EdgeInsets.all(24),
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: ArticleWord(
                      word: word,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SpeakButton(text: word.display),
                ],
              ),
              if (word.pluralDisplay != null)
                Text(
                  'pl. ${word.pluralDisplay}',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: AppColors.inkSoft,
                  ),
                ),
              const SizedBox(height: 20),
              Text(
                word.english.join(', '),
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.orangeDeep,
                ),
              ),
              if (word.exampleDe != null) ...[
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        word.exampleDe!,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    SpeakButton(text: word.exampleDe!),
                  ],
                ),
                if (word.exampleEn != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      word.exampleEn!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.inkSoft,
                      ),
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
