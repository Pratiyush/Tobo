import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../games/combo.dart';
import '../theme/app_theme.dart';
import 'common.dart';
import '../l10n/l10n_ext.dart';

/// "🔥 ×3" streak badge; pops in and grows with the combo.
class ComboBadge extends StatelessWidget {
  const ComboBadge({super.key, required this.combo});

  final int combo;

  @override
  Widget build(BuildContext context) {
    final show = combo >= Combo.showFrom;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 220),
      transitionBuilder: (child, anim) => ScaleTransition(
        scale: CurvedAnimation(parent: anim, curve: Curves.elasticOut),
        child: child,
      ),
      child: show
          ? Semantics(
              key: ValueKey(combo),
              label: context.l10n.summaryCombo(combo),
              excludeSemantics: true,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: AppColors.gold,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '🔥 ×$combo',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.ink,
                  ),
                ),
              ),
            )
          : const SizedBox(key: ValueKey('none')),
    );
  }
}

/// End-of-session card shared by every game and drill: stars pop in, the
/// points count up, the best combo and a new best are celebrated.
class SessionSummary extends StatelessWidget {
  const SessionSummary({
    super.key,
    required this.title,
    required this.message,
    required this.onAgain,
    this.onDone,
    this.extra,
    this.stars,
    this.points,
    this.bestCombo = 0,
    this.newBest = false,
  });

  final String title;
  final String message;
  final VoidCallback? onAgain;

  /// Defaults to leaving the screen.
  final VoidCallback? onDone;

  /// Shown above the buttons, e.g. a "Double points" offer.
  final Widget? extra;

  /// 0–3 stars ([starsFor]); null shows a trophy instead.
  final int? stars;

  /// Points earned this round, counted up; null hides the line.
  final int? points;
  final int bestCombo;
  final bool newBest;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Reduced motion: everything appears at once, no burst.
    final calm = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    final card = WhiteCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (stars case final n?)
            StarRow(stars: n)
          else
            const Icon(
              Icons.emoji_events_rounded,
              size: 64,
              color: AppColors.gold,
            ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          if (newBest)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: _PopIn(
                delay: Duration(milliseconds: calm ? 0 : 700),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    context.l10n.summaryNewBest,
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.ink,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ),
          if (points case final p?) ...[
            const SizedBox(height: 10),
            TweenAnimationBuilder<int>(
              tween: IntTween(begin: calm ? p : 0, end: p),
              duration: Duration(milliseconds: calm ? 1 : 900),
              curve: Curves.easeOutCubic,
              builder: (context, v, _) => FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.bolt_rounded, color: AppColors.orangeInk),
                    Text(
                      context.l10n.commonPlusPoints(v),
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.orangeInk,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          if (bestCombo >= Combo.showFrom)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                context.l10n.summaryBestCombo(bestCombo),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.inkSoft,
                ),
              ),
            ),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.inkSoft,
            ),
          ),
          const SizedBox(height: 20),
          ?extra,
          if (onAgain != null)
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onAgain,
                child: Text(context.l10n.summaryPlayAgain),
              ),
            ),
          TextButton(
            onPressed: onDone ?? () => Navigator.of(context).maybePop(),
            child: Text(context.l10n.commonDone),
          ),
        ],
      ),
    );
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            card,
            if (!calm && (stars ?? 0) >= 2)
              const Positioned.fill(child: IgnorePointer(child: _Burst())),
          ],
        ),
      ),
    );
  }
}

/// 0–3 stars popping in one after another (all at once with reduced motion).
class StarRow extends StatelessWidget {
  const StarRow({super.key, required this.stars});

  final int stars;

  @override
  Widget build(BuildContext context) {
    final calm = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    return Semantics(
      label: context.l10n.summaryStars(stars),
      excludeSemantics: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < 3; i++)
            _PopIn(
              delay: Duration(milliseconds: calm ? 0 : 150 + 180 * i),
              child: Icon(
                i < stars ? Icons.star_rounded : Icons.star_border_rounded,
                size: i == 1 ? 64 : 48,
                color: i < stars ? AppColors.gold : AppColors.track,
              ),
            ),
        ],
      ),
    );
  }
}

/// Scales a child in after [delay] with a little overshoot.
class _PopIn extends StatefulWidget {
  const _PopIn({required this.delay, required this.child});

  final Duration delay;
  final Widget child;

  @override
  State<_PopIn> createState() => _PopInState();
}

class _PopInState extends State<_PopIn> with SingleTickerProviderStateMixin {
  late final _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 420),
  );

  @override
  void initState() {
    super.initState();
    if (widget.delay == Duration.zero) {
      _c.value = 1;
    } else {
      _timer = Timer(widget.delay, _c.forward);
    }
  }

  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ScaleTransition(
    scale: CurvedAnimation(parent: _c, curve: Curves.elasticOut),
    child: widget.child,
  );
}

/// A one-shot burst of article-coloured hex sparks over the summary card.
class _Burst extends StatefulWidget {
  const _Burst();

  @override
  State<_Burst> createState() => _BurstState();
}

class _BurstState extends State<_Burst> with SingleTickerProviderStateMixin {
  late final _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  )..forward();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _c,
    builder: (context, _) => CustomPaint(painter: _BurstPainter(_c.value)),
  );
}

class _BurstPainter extends CustomPainter {
  _BurstPainter(this.t);

  final double t;
  static const _colours = [
    AppColors.der,
    AppColors.die,
    AppColors.das,
    AppColors.orange,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    if (t >= 1) return;
    final origin = Offset(size.width / 2, 40);
    final rng = math.Random(7);
    final fade = (1 - t).clamp(0.0, 1.0);
    for (var i = 0; i < 28; i++) {
      final angle = -math.pi * (0.1 + 0.8 * rng.nextDouble());
      final speed = 120 + 160 * rng.nextDouble();
      final d = speed * Curves.easeOut.transform(t);
      final p =
          origin +
          Offset(math.cos(angle) * d, math.sin(angle) * d + 140 * t * t);
      final r = 4 + 4 * rng.nextDouble();
      final paint = Paint()
        ..color = _colours[i % _colours.length].withValues(alpha: fade);
      final path = Path();
      for (var k = 0; k < 6; k++) {
        final a = math.pi / 3 * k + t * 4;
        final v = p + Offset(math.cos(a), math.sin(a)) * r;
        k == 0 ? path.moveTo(v.dx, v.dy) : path.lineTo(v.dx, v.dy);
      }
      canvas.drawPath(path..close(), paint);
    }
  }

  @override
  bool shouldRepaint(_BurstPainter old) => old.t != t;
}
