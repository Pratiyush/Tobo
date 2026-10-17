import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../games/quiz.dart';
import '../models/word.dart';
import '../providers/progress_provider.dart';
import '../providers/speech_provider.dart';
import '../providers/stats_provider.dart';
import '../providers/words_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/blue_scaffold.dart';
import '../widgets/common.dart';

/// Words per Fallee session.
const falleeRounds = 15;

/// Time a word takes to fall at the start; it speeds up as you go.
const falleeStartDuration = Duration(seconds: 6);

/// A German word falls from the top; tap its meaning before it lands.
class FalleeScreen extends ConsumerStatefulWidget {
  const FalleeScreen({super.key, this.random});

  final Random? random;

  @override
  ConsumerState<FalleeScreen> createState() => _FalleeScreenState();
}

class _FalleeScreenState extends ConsumerState<FalleeScreen>
    with SingleTickerProviderStateMixin {
  late final Random _rng = widget.random ?? Random();
  late final AnimationController _fall = AnimationController(
    vsync: this,
    duration: falleeStartDuration,
  )..addStatusListener(_onFallStatus);

  late List<Word> _words;
  int _index = 0;
  int _score = 0;
  List<Word> _options = const [];

  /// Set while feedback shows: the option tapped, or null on a timeout.
  Word? _picked;
  bool _answered = false;

  @override
  void initState() {
    super.initState();
    _start();
  }

  void _start() {
    _words = pickRound(
      ref.read(gamePoolProvider(false)),
      _rng,
      count: falleeRounds,
    );
    _index = 0;
    _score = 0;
    _load();
  }

  void _load() {
    _answered = false;
    _picked = null;
    if (_index >= _words.length) {
      _fall.stop();
      return;
    }
    final word = _words[_index];
    // Distractors come from the whole deck, not just this session's words.
    _options = [word, pickDistractor(word, ref.read(wordsProvider), _rng)]
      ..shuffle(_rng);
    final ms = falleeStartDuration.inMilliseconds - _index * 200;
    _fall
      ..duration = Duration(milliseconds: max(2500, ms))
      ..forward(from: 0);
  }

  void _onFallStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed && !_answered) _resolve(null);
  }

  Future<void> _resolve(Word? picked) async {
    if (_answered) return;
    _answered = true;
    _fall.stop();
    final word = _words[_index];
    final correct = picked?.id == word.id;
    ref
        .read(progressProvider.notifier)
        .gradeFromGame(word.id, correct: correct);
    if (correct) {
      _score++;
      ref.read(statsProvider.notifier).addPoints(Reward.game);
    }
    setState(() => _picked = picked);
    await Future<void>.delayed(Duration(milliseconds: correct ? 500 : 1300));
    if (!mounted) return;
    setState(() {
      _index++;
      _load();
    });
  }

  @override
  void dispose() {
    _fall.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlueScaffold(
      title: 'Fallee',
      onPop: () => ref.read(speakerProvider).stop(),
      body: _index >= _words.length
          ? SessionSummary(
              title: '$_score / ${_words.length}',
              message: _score >= _words.length * 0.8
                  ? 'Blitzschnell! Lightning fast.'
                  : 'Keep going: the more you play, the faster you’ll read.',
              onAgain: () => setState(_start),
            )
          : Column(
              children: [
                GameHeader(index: _index, total: _words.length, score: _score),
                Expanded(
                  child: AnimatedBuilder(
                    animation: _fall,
                    builder: (context, child) => Align(
                      alignment: Alignment(0, -1 + 2 * _fall.value),
                      child: child,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        key: const ValueKey('falling-word'),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ArticleWord(
                          word: _words[_index],
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 4,
                  color: AppColors.orange,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      for (final (i, option) in _options.indexed) ...[
                        if (i > 0) const SizedBox(width: 12),
                        Expanded(child: _optionButton(theme, option)),
                      ],
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _optionButton(ThemeData theme, Word option) {
    final word = _words[_index];
    final showResult = _answered;
    final Color bg;
    if (showResult && option.id == word.id) {
      bg = AppColors.green;
    } else if (showResult && option.id == _picked?.id) {
      bg = AppColors.red;
    } else {
      bg = Colors.white;
    }
    return SizedBox(
      height: 72,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: bg == Colors.white ? AppColors.ink : Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 8),
        ),
        onPressed: () => _resolve(option),
        child: Text(
          option.meaning,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
