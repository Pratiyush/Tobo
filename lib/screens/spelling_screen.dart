import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../games/spelling.dart';
import '../models/word.dart';
import '../providers/progress_provider.dart';
import '../providers/settings_provider.dart';
import '../providers/speech_provider.dart';
import '../providers/stats_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/blue_scaffold.dart';
import '../widgets/common.dart';

/// Words per spelling session.
const spellingSessionSize = 10;

/// English clue, a keyboard of only the needed letters (plus decoys), and
/// the German to spell. Nouns are spelled with their article.
class SpellingScreen extends ConsumerStatefulWidget {
  const SpellingScreen({super.key, required this.words, this.random});

  final List<Word> words;
  final Random? random;

  @override
  ConsumerState<SpellingScreen> createState() => _SpellingScreenState();
}

enum _Result { pending, correct, wrong }

class _SpellingScreenState extends ConsumerState<SpellingScreen> {
  late final Random _rng = widget.random ?? Random();
  late List<Word> _words;
  int _index = 0;
  int _score = 0;
  bool _hinted = false;
  _Result _result = _Result.pending;
  late SpellingPuzzle _puzzle;

  @override
  void initState() {
    super.initState();
    _start();
  }

  void _start() {
    _words = widget.words.take(spellingSessionSize).toList();
    _index = 0;
    _score = 0;
    _load();
  }

  void _load() {
    if (_index >= _words.length) return;
    _puzzle = SpellingPuzzle(_words[_index].display, _rng);
    _hinted = false;
    _result = _Result.pending;
  }

  Word get _word => _words[_index];

  void _submit() {
    final correct = _puzzle.isCorrect;
    ref.read(progressProvider.notifier).grade(_word.id, correct: correct);
    if (correct) {
      final points = _hinted ? Reward.game : Reward.practice;
      ref.read(statsProvider.notifier).addPoints(points);
      _score += points;
    }
    if (ref.read(settingsProvider).autoSpeak) {
      ref.read(speakerProvider).say(_word.display);
    }
    setState(() => _result = correct ? _Result.correct : _Result.wrong);
  }

  /// Skipping counts as a miss so the word comes back soon.
  void _skip() {
    ref.read(progressProvider.notifier).grade(_word.id, correct: false);
    setState(() => _result = _Result.wrong);
  }

  void _next() => setState(() {
    _index++;
    _load();
  });

  @override
  Widget build(BuildContext context) {
    return BlueScaffold(
      title: 'Practice',
      onPop: () => ref.read(speakerProvider).stop(),
      body: _index >= _words.length
          ? SessionSummary(
              title: 'Gut gemacht!',
              message:
                  'You practised ${_words.length} words and earned '
                  '$_score points.',
              onAgain: null,
            )
          : Column(
              children: [
                GameHeader(index: _index, total: _words.length, score: _score),
                Expanded(child: _buildPuzzle(context)),
              ],
            ),
    );
  }

  Widget _buildPuzzle(BuildContext context) {
    final theme = Theme.of(context);
    final done = _result != _Result.pending;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        WhiteCard(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                _word.english.join(', '),
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              if (_word.isNoun)
                Text(
                  'noun — include der, die or das',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.inkSoft,
                  ),
                ),
              const SizedBox(height: 16),
              Container(
                key: const ValueKey('answer'),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: switch (_result) {
                    _Result.pending => AppColors.track,
                    _Result.correct => AppColors.green.withValues(alpha: 0.18),
                    _Result.wrong => AppColors.red.withValues(alpha: 0.15),
                  },
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _puzzle.typed.isEmpty && !done ? ' ' : _puzzle.typed,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                  ),
                ),
              ),
              if (done) ...[
                const SizedBox(height: 12),
                Text(
                  _result == _Result.correct ? 'Richtig!' : 'The answer is',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: _result == _Result.correct
                        ? AppColors.green
                        : AppColors.red,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: ArticleWord(
                        word: _word,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SpeakButton(text: _word.display),
                  ],
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 16),
        if (done)
          FilledButton(onPressed: _next, child: const Text('NEXT'))
        else ...[
          _Keyboard(
            puzzle: _puzzle,
            onKey: (k) => setState(() => _puzzle.type(k)),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _RoundKey(
                tooltip: 'Hint',
                icon: Icons.lightbulb_rounded,
                color: AppColors.gold,
                onTap: () => setState(() {
                  _hinted = true;
                  _puzzle.hint();
                }),
              ),
              const SizedBox(width: 8),
              _RoundKey(
                tooltip: 'Skip',
                icon: Icons.skip_next_rounded,
                color: Colors.white,
                onTap: _skip,
              ),
              const Spacer(),
              _RoundKey(
                tooltip: 'Delete',
                icon: Icons.backspace_rounded,
                color: AppColors.orange,
                onTap: () => setState(_puzzle.backspace),
              ),
              const SizedBox(width: 8),
              _RoundKey(
                tooltip: 'Check',
                icon: Icons.keyboard_return_rounded,
                color: AppColors.green,
                onTap: _puzzle.isFull ? _submit : null,
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class _Keyboard extends StatelessWidget {
  const _Keyboard({required this.puzzle, required this.onKey});

  final SpellingPuzzle puzzle;
  final ValueChanged<String> onKey;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final MapEntry(key: key, value: left) in puzzle.keys.entries)
          Opacity(
            opacity: left == 0 ? 0.35 : 1,
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: left == 0 ? null : () => onKey(key),
                child: Semantics(
                  button: true,
                  label: key == SpellingPuzzle.space ? 'space' : key,
                  excludeSemantics: true,
                  child: SizedBox(
                    width: key == SpellingPuzzle.space ? 96 : 48,
                    height: 52,
                    child: Stack(
                      children: [
                        Center(
                          child: key == SpellingPuzzle.space
                              ? const Icon(Icons.space_bar_rounded)
                              : Text(
                                  key,
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                        ),
                        if (left > 1)
                          Positioned(
                            top: 4,
                            right: 6,
                            child: Text(
                              '$left',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: AppColors.orangeDeep,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _RoundKey extends StatelessWidget {
  const _RoundKey({
    required this.tooltip,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String tooltip;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => IconButton.filled(
    tooltip: tooltip,
    iconSize: 26,
    style: IconButton.styleFrom(
      backgroundColor: color,
      foregroundColor: color == Colors.white || color == AppColors.gold
          ? AppColors.ink
          : Colors.white,
      disabledBackgroundColor: Colors.white24,
      minimumSize: const Size(52, 52),
    ),
    onPressed: onTap,
    icon: Icon(icon),
  );
}
