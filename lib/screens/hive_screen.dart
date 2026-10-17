import 'dart:math';
import 'dart:ui' show PointMode;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../games/hive.dart';
import '../models/word.dart';
import '../providers/progress_provider.dart';
import '../providers/settings_provider.dart';
import '../providers/speech_provider.dart';
import '../providers/stats_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/blue_scaffold.dart';
import '../widgets/common.dart';

/// Words hidden in each Hive board.
const hiveWordsPerRound = 3;

/// One shared honeycomb of letters per round. Swipe (or tap) a path across
/// adjacent tiles to spell the German for the clue; the letters you use are
/// consumed, so the pool shrinks until the board is empty.
class HiveScreen extends ConsumerStatefulWidget {
  const HiveScreen({super.key, this.random});

  final Random? random;

  @override
  ConsumerState<HiveScreen> createState() => _HiveScreenState();
}

class _HiveScreenState extends ConsumerState<HiveScreen> {
  late final Random _rng = widget.random ?? Random();
  int _round = 0;
  int _score = 0;
  List<Word> _targets = const [];
  int _solved = 0;
  late HiveBoard _board;
  final List<Hex> _path = [];
  int _hints = 0;

  /// Briefly true after a wrong path, to flash the tiles red.
  bool _wrong = false;

  @override
  void initState() {
    super.initState();
    _newRound();
  }

  String _spell(Word w) => w.german.toLowerCase();

  void _newRound() {
    final pool = ref.read(gamePoolProvider(false));
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
    _solved = 0;
    _hints = 0;
    _path.clear();
  }

  bool get _roundDone => _solved >= _targets.length;

  Word get _target => _targets[_solved];

  /// The solution path of the current word, for widget tests.
  @visibleForTesting
  List<Hex> get debugTargetPath => _board.paths[_spell(_target)]!;

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
    ref.read(progressProvider.notifier).gradeFromGame(word.id, correct: true);
    final points = _hints == 0 ? Reward.hiveWord : Reward.game;
    ref.read(statsProvider.notifier).addPoints(points);
    if (ref.read(settingsProvider).autoSpeak) {
      ref.read(speakerProvider).say(word.display);
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

  void _hint() => setState(() {
    _path.clear();
    _hints = min(_hints + 1, _spell(_target).length);
  });

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
                Text(
                  'Round $_round',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.bolt_rounded, color: AppColors.gold),
                Text(
                  '$_score',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: WhiteCard(
              child: SizedBox(
                width: double.infinity,
                child: _roundDone
                    ? _RoundComplete(
                        words: _targets,
                        onNext: () => setState(_newRound),
                      )
                    : Column(
                        children: [
                          Text(
                            'Word ${_solved + 1} of ${_targets.length}',
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
                        ],
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
                  Text(
                    '${_board.tiles.length} letters left',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                  const Spacer(),
                  IconButton.filled(
                    tooltip: 'Hint',
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
  const _RoundComplete({required this.words, required this.onNext});

  final List<Word> words;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          'Board cleared!',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w900,
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
              SpeakButton(text: w.display),
            ],
          ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: onNext,
            child: const Text('NEXT ROUND'),
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
