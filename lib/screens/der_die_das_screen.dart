import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../games/quiz.dart';
import '../models/word.dart';
import '../providers/progress_provider.dart';
import '../providers/settings_provider.dart';
import '../providers/speech_provider.dart';
import '../providers/stats_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/blue_scaffold.dart';
import '../widgets/common.dart';

/// Nouns per Der Die Das session.
const derDieDasRounds = 20;

/// A noun and three buttons in the German flag colours.
class DerDieDasScreen extends ConsumerStatefulWidget {
  const DerDieDasScreen({super.key, this.random});

  final Random? random;

  @override
  ConsumerState<DerDieDasScreen> createState() => _DerDieDasScreenState();
}

class _DerDieDasScreenState extends ConsumerState<DerDieDasScreen> {
  late final Random _rng = widget.random ?? Random();
  late List<Word> _words;
  int _index = 0;
  int _score = 0;

  /// The article picked for the current noun, while feedback shows.
  Gender? _picked;

  @override
  void initState() {
    super.initState();
    _start();
  }

  void _start() {
    _words = pickRound(
      ref.read(gamePoolProvider(true)),
      _rng,
      count: derDieDasRounds,
    );
    _index = 0;
    _score = 0;
    _picked = null;
  }

  Future<void> _answer(Gender g) async {
    if (_picked != null) return;
    final word = _words[_index];
    final correct = g == word.gender;
    ref
        .read(progressProvider.notifier)
        .gradeFromGame(word.id, correct: correct);
    if (correct) {
      _score++;
      ref.read(statsProvider.notifier).addPoints(Reward.game);
    }
    if (ref.read(settingsProvider).autoSpeak) {
      ref.read(speakerProvider).say(word.display);
    }
    setState(() => _picked = g);
    await Future<void>.delayed(Duration(milliseconds: correct ? 600 : 1400));
    if (!mounted) return;
    setState(() {
      _picked = null;
      _index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlueScaffold(
      title: 'Der Die Das',
      onPop: () => ref.read(speakerProvider).stop(),
      body: _index >= _words.length
          ? SessionSummary(
              title: '$_score / ${_words.length}',
              message: _score == _words.length
                  ? 'Perfekt! Every article right.'
                  : 'Colour is the memory hook: der black, die red, das gold.',
              onAgain: () => setState(_start),
            )
          : Column(
              children: [
                GameHeader(index: _index, total: _words.length, score: _score),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: WhiteCard(
                      padding: const EdgeInsets.all(24),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_picked != null)
                              Text(
                                _picked == _words[_index].gender
                                    ? 'Richtig!'
                                    : 'It’s ${_words[_index].gender!.name}',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: _picked == _words[_index].gender
                                      ? AppColors.green
                                      : AppColors.red,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            const SizedBox(height: 8),
                            if (_picked != null)
                              ArticleWord(
                                word: _words[_index],
                                style: _wordStyle(theme),
                              )
                            else
                              Text(
                                _words[_index].german,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: _wordStyle(theme),
                              ),
                            const SizedBox(height: 12),
                            Text(
                              _words[_index].meaning,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: AppColors.inkSoft,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (final g in Gender.values)
                        _ArticleButton(
                          gender: g,
                          dimmed:
                              _picked != null &&
                              g != _picked &&
                              g != _words[_index].gender,
                          onTap: () => _answer(g),
                        ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  TextStyle? _wordStyle(ThemeData theme) =>
      theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w900);
}

class _ArticleButton extends StatelessWidget {
  const _ArticleButton({
    required this.gender,
    required this.dimmed,
    required this.onTap,
  });

  final Gender gender;
  final bool dimmed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => AnimatedOpacity(
    opacity: dimmed ? 0.3 : 1,
    duration: const Duration(milliseconds: 150),
    child: Material(
      color: AppColors.article(gender),
      shape: const CircleBorder(
        side: BorderSide(color: Colors.white, width: 3),
      ),
      elevation: 4,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox.square(
          dimension: 92,
          child: Center(
            child: Text(
              '${gender.name[0].toUpperCase()}${gender.name.substring(1)}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.onArticle(gender),
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
