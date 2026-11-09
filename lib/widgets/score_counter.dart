import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// The session score in a game header. When it rises, the number bumps and a
/// "+N" floats up and fades, so combo bonuses visibly pay out. With reduced
/// motion the number simply changes.
class ScoreCounter extends StatefulWidget {
  const ScoreCounter({super.key, required this.score, this.style});

  final int score;
  final TextStyle? style;

  @override
  State<ScoreCounter> createState() => _ScoreCounterState();
}

class _ScoreCounterState extends State<ScoreCounter>
    with SingleTickerProviderStateMixin {
  late final _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 750),
  );
  int _gain = 0;

  @override
  void didUpdateWidget(ScoreCounter old) {
    super.didUpdateWidget(old);
    final gain = widget.score - old.score;
    final calm = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    if (gain > 0 && !calm) {
      _gain = gain;
      _c.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _c,
    builder: (context, _) {
      final t = _c.value;
      final active = _c.isAnimating;
      // Bump: up to 1.3x in the first third, back to 1x.
      final bump = active ? 1 + 0.3 * (t < 0.3 ? t / 0.3 : (1 - t) / 0.7) : 1.0;
      return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.bolt_rounded, color: AppColors.gold),
              Transform.scale(
                scale: bump,
                child: Text('${widget.score}', style: widget.style),
              ),
            ],
          ),
          if (active)
            Positioned(
              right: 0,
              top: -6 - 28 * Curves.easeOut.transform(t),
              child: Opacity(
                opacity: (1 - t).clamp(0.0, 1.0),
                child: Text(
                  '+$_gain',
                  key: const ValueKey('score-pop'),
                  style: widget.style?.copyWith(
                    color: AppColors.gold,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
        ],
      );
    },
  );
}
