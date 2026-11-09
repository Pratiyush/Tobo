import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../games/combo.dart';
import '../models/word.dart';
import '../providers/progress_provider.dart';
import '../providers/speech_provider.dart';
import '../theme/app_theme.dart';
import 'score_counter.dart';
import 'session_summary.dart';

export 'session_summary.dart';

/// Signal-strength bars for a word's mastery level (0 = not learned).
class MasteryBars extends StatelessWidget {
  const MasteryBars({super.key, required this.level});

  final int level;

  @override
  Widget build(BuildContext context) => Semantics(
    label: 'Mastery $level of $maxLevel',
    child: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var i = 1; i <= maxLevel; i++)
          Container(
            width: 4,
            height: 4.0 + i * 3,
            margin: const EdgeInsets.only(left: 2),
            decoration: BoxDecoration(
              color: i <= level ? AppColors.green : AppColors.track,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
      ],
    ),
  );
}

/// Circular percentage ring, as on the word-list cards.
class ProgressRing extends StatelessWidget {
  const ProgressRing({super.key, required this.value, this.size = 52});

  final double value;
  final double size;

  @override
  Widget build(BuildContext context) => Semantics(
    label: '${(value * 100).round()}% learned',
    excludeSemantics: true,
    child: SizedBox.square(
      dimension: size,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: value,
            strokeWidth: 5,
            backgroundColor: AppColors.track,
            color: AppColors.green,
            strokeCap: StrokeCap.round,
          ),
          Center(
            child: Text(
              '${(value * 100).round()}%',
              style: Theme.of(context).textTheme.labelMedium
                  ?.copyWith(fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    ),
  );
}

/// Round orange speaker button: plays [word]'s recorded clip, or says
/// [text] (an example sentence) with device TTS.
class SpeakButton extends ConsumerWidget {
  const SpeakButton({
    super.key,
    this.word,
    this.text,
    this.size = 48,
    this.filled = false,
  }) : assert((word == null) != (text == null), 'pass word or text');

  final Word? word;
  final String? text;
  final double size;
  final bool filled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final icon = Icon(Icons.volume_up_rounded, size: size * 0.55);
    Future<void> speak() => speakGerman(context, ref, word: word, text: text);
    return SizedBox.square(
      dimension: size,
      child: filled
          ? IconButton.filled(
              tooltip: 'Listen',
              style: IconButton.styleFrom(
                backgroundColor: AppColors.orange,
                foregroundColor: AppColors.ink,
              ),
              onPressed: speak,
              icon: icon,
            )
          : IconButton(
              tooltip: 'Listen',
              color: AppColors.orange,
              padding: EdgeInsets.zero,
              onPressed: speak,
              icon: icon,
            ),
    );
  }
}

/// Plays [word] or says [text], telling the user if nothing could be spoken.
Future<void> speakGerman(
  BuildContext context,
  WidgetRef ref, {
  Word? word,
  String? text,
}) async {
  final messenger = ScaffoldMessenger.maybeOf(context);
  final speaker = ref.read(speakerProvider);
  final ok = word != null
      ? await speaker.sayWord(word)
      : await speaker.say(text!);
  if (!ok) {
    messenger
      ?..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text(
            'No German voice installed. Add one in your device’s '
            'text-to-speech settings.',
          ),
        ),
      );
  }
}

/// "der Tag" with the article in its flag colour.
class ArticleWord extends StatelessWidget {
  const ArticleWord({super.key, required this.word, this.style});

  final Word word;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final base = style ?? Theme.of(context).textTheme.titleMedium!;
    final gender = word.gender;
    return Text.rich(
      TextSpan(
        children: [
          if (gender != null)
            TextSpan(
              text: '${gender.name} ',
              style: base.copyWith(
                color: gender == Gender.das
                    ? AppColors.dasInk
                    : AppColors.article(gender),
              ),
            ),
          TextSpan(text: word.german, style: base),
        ],
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

/// White rounded card used on the blue ground.
class WhiteCard extends StatelessWidget {
  const WhiteCard({
    super.key,
    required this.child,
    this.onTap,
    this.color = AppColors.card,
    this.padding = const EdgeInsets.all(16),
  });

  final Widget child;
  final VoidCallback? onTap;
  final Color color;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => Material(
    color: color,
    borderRadius: BorderRadius.circular(18),
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: onTap,
      child: Padding(padding: padding, child: child),
    ),
  );
}

/// Score header used by the games: "3/15" and points this session.
class GameHeader extends StatelessWidget {
  const GameHeader({
    super.key,
    required this.index,
    required this.total,
    required this.score,
    this.combo = 0,
  });

  final int index;
  final int total;
  final int score;

  /// Right answers in a row; a badge pops in from [Combo.showFrom].
  final int combo;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleMedium
        ?.copyWith(color: Colors.white, fontWeight: FontWeight.w800);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${index + 1 > total ? total : index + 1}/$total',
                style: style,
              ),
              const Spacer(),
              ComboBadge(combo: combo),
              const SizedBox(width: 12),
              ScoreCounter(score: score, style: style),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: total == 0 ? 0 : index / total,
              minHeight: 6,
              backgroundColor: Colors.white24,
              color: AppColors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
