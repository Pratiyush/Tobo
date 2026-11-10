import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/daily_goal_provider.dart';
import '../games/combo.dart';
import '../providers/feedback_provider.dart';
import '../ads/ad_widgets.dart';
import '../games/gender_rules.dart';
import '../games/quiz.dart';
import '../models/word.dart';
import '../providers/progress_provider.dart';
import '../providers/settings_provider.dart';
import '../providers/speech_provider.dart';
import '../providers/stats_provider.dart';
import '../providers/words_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/blue_scaffold.dart';
import '../widgets/common.dart';
import '../l10n/l10n_ext.dart';

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

  /// Why the noun has its article, shown with the feedback when known.
  String? _hint;

  Combo _combo = Combo();

  /// Points this round, bonuses included.
  int _points = 0;
  bool _newBest = false;

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
    _combo = Combo();
    _points = 0;
    _newBest = false;
  }

  Future<void> _answer(Gender g) async {
    if (_picked != null) return;
    final word = _words[_index];
    final correct = g == word.gender;
    ref
        .read(progressProvider.notifier)
        .gradeFromGame(word.id, correct: correct);
    final feedback = ref.read(feedbackProvider);
    if (correct) {
      final points = Reward.game + _combo.hit();
      _score++;
      _points += points;
      ref.read(statsProvider.notifier).addPoints(points);
      ref.read(dailyGoalProvider.notifier).tick();
      feedback.right(combo: _combo.current);
    } else {
      _combo.miss();
      feedback.wrong();
    }
    if (ref.read(settingsProvider).autoSpeak) {
      // After the sound, so the chime doesn't cover the word.
      Future<void>.delayed(
        Duration(milliseconds: feedback.enabled ? 300 : 0),
        () => mounted ? ref.read(speakerProvider).sayWord(word) : null,
      );
    }
    final rule = genderHint(word, ref.read(nounsProvider));
    final hint = rule == null ? null : genderHintText(context.l10n, rule);
    setState(() {
      _picked = g;
      _hint = hint;
    });
    // Longer when there's a rule to read.
    final ms = (correct ? 600 : 1400) + (hint == null ? 0 : 1600);
    await Future<void>.delayed(Duration(milliseconds: ms));
    if (!mounted) return;
    setState(() {
      _picked = null;
      _index++;
      if (_index >= _words.length) {
        feedback.roundEnd();
        _newBest = ref
            .read(bestScoresProvider.notifier)
            .submit('derdiedas', _score);
      }
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
                  ? context.l10n.dddPerfect
                  : context.l10n.dddTip,
              stars: starsFor(_score, _words.length),
              points: _points,
              bestCombo: _combo.best,
              newBest: _newBest,
              extra: DoublePointsButton(points: _points),
              onAgain: () => finishRound(ref, () => setState(_start)),
              onDone: () => finishRound(ref, () {
                if (mounted) Navigator.of(context).maybePop();
              }),
            )
          : Column(
              children: [
                GameHeader(
                  index: _index,
                  total: _words.length,
                  score: _score,
                  combo: _combo.current,
                ),
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
                                    : context.l10n.dddItsArticle(
                                        _words[_index].gender!.name,
                                      ),
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: _picked == _words[_index].gender
                                      ? AppColors.greenInk
                                      : AppColors.die,
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
                            if (_picked != null && _hint != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  _hint!,
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: AppColors.inkSoft,
                                  ),
                                ),
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
  Widget build(BuildContext context) => AnimatedScale(
    // Dimmed buttons shrink and turn a light tint of their own colour (der
    // grey, die pink, das pale gold). Fading them let the blue ground show
    // through (der looked navy, die purple), which blurred the colour hook.
    scale: dimmed ? 0.85 : 1,
    duration: const Duration(milliseconds: 150),
    child: Material(
      color: dimmed
          ? AppColors.dimmedArticle(gender)
          : AppColors.article(gender),
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
                color: dimmed ? Colors.white : AppColors.onArticle(gender),
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
