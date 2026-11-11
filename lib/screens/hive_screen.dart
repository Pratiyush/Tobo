import 'dart:math';
import 'dart:ui' show PointMode;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/score_counter.dart';
import '../providers/words_provider.dart';
import '../providers/daily_hive_provider.dart';
import '../games/daily.dart';
import '../providers/daily_goal_provider.dart';
import '../games/combo.dart';
import '../providers/feedback_provider.dart';
import '../ads/ad_policy.dart';
import '../ads/ad_widgets.dart';
import '../ads/ads_service.dart';
import '../games/hive.dart';
import '../models/word.dart';
import '../providers/onboarding_provider.dart';
import '../providers/progress_provider.dart';
import '../providers/settings_provider.dart';
import '../providers/speech_provider.dart';
import '../providers/stats_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/blue_scaffold.dart';
import '../widgets/common.dart';
import '../l10n/l10n_ext.dart';

/// Words hidden in each Hive board.
const hiveWordsPerRound = 3;

/// One shared honeycomb of letters per round. Swipe (or tap) a path across
/// adjacent tiles to spell the German for the clue; the letters you use are
/// consumed, so the pool shrinks until the board is empty.
class HiveScreen extends ConsumerStatefulWidget {
  const HiveScreen({super.key, this.random, this.daily});

  final Random? random;

  /// Today's shared board: one seeded round from that level's words.
  final DailyHive? daily;

  @override
  ConsumerState<HiveScreen> createState() => _HiveScreenState();
}

class _HiveScreenState extends ConsumerState<HiveScreen> {
  late final Random _rng = widget.random ?? widget.daily?.random ?? Random();
  int _round = 0;
  int _score = 0;
  List<Word> _targets = const [];
  int _solved = 0;
  late HiveBoard _board;
  final List<Hex> _path = [];
  int _hints = 0;

  /// Hint taps left on this board (ads on only).
  late HintQuota _hintQuota;

  /// Points earned on this board, for "Double points".
  int _roundPoints = 0;

  /// Words solved in a row without a hint (across boards).
  final Combo _combo = Combo();

  /// Hints used on this board: 0 earns 3 stars, up to 2 earns 2, more 1.
  int _roundHints = 0;

  /// Briefly true after a wrong path, to flash the tiles red.
  bool _wrong = false;

  @override
  void initState() {
    super.initState();
    _newRound();
  }

  /// Nouns keep their capital on the tile, as German writes them.
  String _spell(Word w) => w.german;

  void _newRound() {
    final daily = widget.daily;
    final pool = daily != null
        ? daily.pool(ref.read(wordsProvider))
        : ref.read(gamePoolProvider(false));
    for (var count = hiveWordsPerRound; count > 0; count--) {
      final words = pickHiveWords(pool, _spell, _rng, count: count);
      final board = HiveBoard.layout(words.map(_spell).toList(), _rng);
      if (board != null) {
        _targets = words;
        _board = board;
        break;
      }
    }
    _round++;
    _roundPoints = 0;
    _roundHints = 0;
    _hintQuota = HintQuota(limited: ref.read(adsServiceProvider).enabled);
    _solved = 0;
    _hints = 0;
    _path.clear();
  }

  bool get _roundDone => _solved >= _targets.length;

  Word get _target => _targets[_solved];

  /// The solution path of the current word, for widget tests.
  @visibleForTesting
  List<Hex> get debugTargetPath => _board.paths[_spell(_target)]!;

  @visibleForTesting
  List<Word> get debugTargets => _targets;

  /// Stars for this board: no hints 3, up to 2 hints 2, more 1.
  int get _stars => _roundHints == 0
      ? 3
      : _roundHints <= 2
      ? 2
      : 1;

  String get _traced => _path.map((h) => _board.tiles[h]!).join();

  void _extend(Hex hex) {
    if (!_board.tiles.containsKey(hex)) return;
    if (_path.length >= 2 && _path[_path.length - 2] == hex) {
      _path.removeLast();
    } else if (_path.isEmpty ||
        (!_path.contains(hex) && _path.last.isAdjacentTo(hex))) {
      _path.add(hex);
    }
  }

  void _onTap(Hex hex) {
    if (_roundDone || !_board.tiles.containsKey(hex)) return;
    setState(() {
      if (_path.isNotEmpty && _path.last == hex) {
        _path.removeLast();
      } else {
        _extend(hex);
      }
    });
    if (_path.length == _spell(_target).length) _check();
  }

  void _check() {
    if (_path.isEmpty || _roundDone) return;
    if (_traced != _spell(_target)) {
      ref.read(feedbackProvider).wrong();
      setState(() => _wrong = true);
      Future<void>.delayed(const Duration(milliseconds: 350), () {
        if (!mounted) return;
        setState(() {
          _wrong = false;
          _path.clear();
        });
      });
      return;
    }

    final word = _target;
    ref.read(hiveCoachedProvider.notifier).done();
    ref.read(progressProvider.notifier).gradeFromGame(word.id, correct: true);
    final bonus = _hints == 0 ? _combo.hit() : 0;
    if (_hints > 0) _combo.miss();
    final points = (_hints == 0 ? Reward.hiveWord : Reward.game) + bonus;
    _roundPoints += points;
    ref.read(statsProvider.notifier).addPoints(points);
    ref.read(dailyGoalProvider.notifier).tick();
    final feedback = ref.read(feedbackProvider);
    final lastWord = _solved + 1 >= _targets.length;
    if (lastWord) {
      feedback.roundEnd();
      ref.read(bestScoresProvider.notifier).submit('hive', _score + points);
      if (widget.daily != null) {
        ref.read(dailyHiveResultProvider.notifier).record(_stars, _roundHints);
      }
    } else {
      feedback.right(combo: _combo.current);
    }
    if (ref.read(settingsProvider).autoSpeak) {
      // After the sound, so the chime doesn't cover the word.
      Future<void>.delayed(
        Duration(milliseconds: feedback.enabled ? 300 : 0),
        () => mounted ? ref.read(speakerProvider).sayWord(word) : null,
      );
    }

    setState(() {
      _score += points;
      _solved++;
      _hints = 0;
      _path.clear();
      if (!_roundDone) {
        // The traced letters are consumed. Re-pack what's left so every
        // remaining word can still be traced.
        final rest = _targets.skip(_solved).map(_spell).toList();
        _board = HiveBoard.layout(rest, _rng) ?? _board;
      }
    });
  }

  Future<void> _hint() async {
    if (!await requestHint(context, ref, _hintQuota)) return;
    setState(() {
      _roundHints++;
      _path.clear();
      _hints = min(_hints + 1, _spell(_target).length);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hinted = _roundDone
        ? const <Hex>{}
        : _board.paths[_spell(_target)]!.take(_hints).toSet();
    return BlueScaffold(
      title: 'Hive',
      onPop: () => ref.read(speakerProvider).stop(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    widget.daily != null
                        ? context.l10n.dailyHiveTitle(widget.daily!.level.label)
                        : context.l10n.hiveRound(_round),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const Spacer(),
                ComboBadge(combo: _combo.current),
                const SizedBox(width: 12),
                ScoreCounter(
                  score: _score,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          // The board has fixed geometry; the clue card stops growing at 1.6x
          // text so the board still fits a 360 x 640 phone at font 2.0.
          MediaQuery.withClampedTextScaling(
            maxScaleFactor: 1.6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: WhiteCard(
                child: SizedBox(
                  width: double.infinity,
                  child: _roundDone
                      ? _RoundComplete(
                          words: _targets,
                          points: _roundPoints,
                          stars: _stars,
                          onShare: widget.daily == null
                              ? null
                              : () => ref.read(shareTextProvider)(
                                  dailyShareText(
                                    context.l10n,
                                    widget.daily!,
                                    stars: _stars,
                                    hints: _roundHints,
                                  ),
                                ),
                          onNext: widget.daily != null
                              ? () => Navigator.of(context).maybePop()
                              : () =>
                                    finishRound(ref, () => setState(_newRound)),
                        )
                      : Column(
                          children: [
                            Text(
                              context.l10n.hiveWordOf(
                                _solved + 1,
                                _targets.length,
                              ),
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: AppColors.inkSoft,
                              ),
                            ),
                            Text(
                              _target.meaning,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _traced.isEmpty ? _blanks(_target) : _traced,
                              key: const ValueKey('hive-traced'),
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: _wrong ? AppColors.red : AppColors.ink,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 3,
                              ),
                            ),
                            if (!ref.watch(hiveCoachedProvider))
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  context.l10n.hiveCoach,
                                  textAlign: TextAlign.center,
                                  // Three lines: Tamil needs them at 360 dp
                                  // (locales_e2e_test, real fonts).
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: AppColors.inkSoft,
                                  ),
                                ),
                              ),
                          ],
                        ),
                ),
              ),
            ),
          ),
          Expanded(
            child: _roundDone
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.all(12),
                    child: _HexBoardView(
                      tiles: _board.tiles,
                      path: _path,
                      hinted: hinted,
                      wrong: _wrong,
                      onTap: _onTap,
                      onDragStart: (h) => setState(() {
                        _path.clear();
                        _extend(h);
                      }),
                      onDrag: (h) => setState(() => _extend(h)),
                      onDragEnd: _check,
                    ),
                  ),
          ),
          if (!_roundDone)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      context.l10n.hiveLettersLeft(_board.tiles.length),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton.filled(
                    tooltip: context.l10n.commonHint,
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.gold,
                      foregroundColor: AppColors.ink,
                      minimumSize: const Size(52, 52),
                    ),
                    onPressed: _hint,
                    icon: const Icon(Icons.lightbulb_rounded),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  String _blanks(Word w) {
    final blanks = List.filled(w.german.length, '_').join(' ');
    return w.gender == null ? blanks : '${w.gender!.name} $blanks';
  }
}

class _RoundComplete extends StatelessWidget {
  const _RoundComplete({
    required this.words,
    required this.points,
    required this.stars,
    required this.onNext,
    this.onShare,
  });

  /// Daily board: share the result instead of starting another round.
  final VoidCallback? onShare;

  final int points;
  final int stars;

  final List<Word> words;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        StarRow(stars: stars),
        Text(
          context.l10n.hiveBoardCleared,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          context.l10n.commonPlusPoints(points),
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
            color: AppColors.orangeInk,
          ),
        ),
        const SizedBox(height: 8),
        for (final w in words)
          Row(
            children: [
              Expanded(
                child: ArticleWord(
                  word: w,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  w.meaning,
                  textAlign: TextAlign.end,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.inkSoft,
                  ),
                ),
              ),
              SpeakButton(word: w),
            ],
          ),
        const SizedBox(height: 12),
        if (onShare == null) DoublePointsButton(points: points),
        if (onShare != null)
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: onShare,
              icon: const Icon(Icons.ios_share_rounded),
              label: Text(context.l10n.hiveShareResult),
            ),
          ),
        SizedBox(
          width: double.infinity,
          child: onShare != null
              ? TextButton(
                  onPressed: onNext,
                  child: Text(context.l10n.commonDone),
                )
              : FilledButton(
                  onPressed: onNext,
                  child: Text(context.l10n.hiveNextRound),
                ),
        ),
      ],
    );
  }
}

/// Draws the honeycomb and turns touches into hexes.
class _HexBoardView extends StatelessWidget {
  const _HexBoardView({
    required this.tiles,
    required this.path,
    required this.hinted,
    required this.wrong,
    required this.onTap,
    required this.onDragStart,
    required this.onDrag,
    required this.onDragEnd,
  });

  final Map<Hex, String> tiles;
  final List<Hex> path;
  final Set<Hex> hinted;
  final bool wrong;
  final ValueChanged<Hex> onTap;
  final ValueChanged<Hex> onDragStart;
  final ValueChanged<Hex> onDrag;
  final VoidCallback onDragEnd;

  static final _sqrt3 = sqrt(3);

  /// Centre of [h] for a unit hex (pointy top).
  static Offset _unit(Hex h) => Offset(_sqrt3 * (h.q + h.r / 2), 1.5 * h.r);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final centres = {for (final h in tiles.keys) h: _unit(h)};
        final xs = centres.values.map((o) => o.dx);
        final ys = centres.values.map((o) => o.dy);
        final minX = xs.reduce(min), maxX = xs.reduce(max);
        final minY = ys.reduce(min), maxY = ys.reduce(max);
        final w = maxX - minX + _sqrt3;
        final h = maxY - minY + 2;
        final size = min(
          48.0,
          min(constraints.maxWidth / w, constraints.maxHeight / h),
        );
        final origin = Offset(
          (constraints.maxWidth - w * size) / 2 + _sqrt3 / 2 * size,
          (constraints.maxHeight - h * size) / 2 + size,
        );
        Offset centre(Hex hex) =>
            origin + (centres[hex]! - Offset(minX, minY)) * size;

        Hex? hit(Offset p) {
          for (final hex in tiles.keys) {
            if ((centre(hex) - p).distance < size * 0.85) return hex;
          }
          return null;
        }

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapUp: (d) {
            final hex = hit(d.localPosition);
            if (hex != null) onTap(hex);
          },
          onPanStart: (d) {
            final hex = hit(d.localPosition);
            if (hex != null) onDragStart(hex);
          },
          onPanUpdate: (d) {
            final hex = hit(d.localPosition);
            if (hex != null) onDrag(hex);
          },
          onPanEnd: (_) => onDragEnd(),
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: _PathPainter([for (final p in path) centre(p)]),
                ),
              ),
              for (final hex in tiles.keys)
                Positioned(
                  left: centre(hex).dx - size,
                  top: centre(hex).dy - size,
                  width: size * 2,
                  height: size * 2,
                  child: IgnorePointer(
                    child: _HexTile(
                      key: ValueKey('hex-${hex.q}-${hex.r}'),
                      letter: tiles[hex]!,
                      size: size,
                      color: path.contains(hex)
                          ? (wrong ? AppColors.red : AppColors.hexSelected)
                          : hinted.contains(hex)
                          ? AppColors.hexHint
                          : AppColors.hexTile,
                      onColor: path.contains(hex)
                          ? Colors.white
                          : AppColors.ink,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _HexTile extends StatelessWidget {
  const _HexTile({
    super.key,
    required this.letter,
    required this.size,
    required this.color,
    required this.onColor,
  });

  final String letter;
  final double size;
  final Color color;
  final Color onColor;

  @override
  Widget build(BuildContext context) => CustomPaint(
    painter: _HexPainter(color),
    child: Center(
      child: Text(
        letter,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: onColor,
          fontWeight: FontWeight.w900,
          fontSize: size * 0.7,
        ),
      ),
    ),
  );
}

class _HexPainter extends CustomPainter {
  _HexPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final r = size.width / 2 * 0.94;
    final c = size.center(Offset.zero);
    final path = Path();
    for (var i = 0; i < 6; i++) {
      final a = pi / 180 * (60 * i - 30);
      final p = c + Offset(cos(a), sin(a)) * r;
      i == 0 ? path.moveTo(p.dx, p.dy) : path.lineTo(p.dx, p.dy);
    }
    path.close();
    canvas.drawShadow(path, Colors.black, 3, false);
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_HexPainter old) => old.color != color;
}

class _PathPainter extends CustomPainter {
  _PathPainter(this.points);

  final List<Offset> points;

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;
    final paint = Paint()
      ..color = AppColors.orangeDeep
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawPoints(PointMode.polygon, points, paint);
  }

  @override
  bool shouldRepaint(_PathPainter old) => old.points != points;
}
