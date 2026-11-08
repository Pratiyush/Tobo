import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/stats_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';
import 'ad_policy.dart';
import 'ads_service.dart';

/// Uses a hint from [quota]. When none are left (ads on only), offers a
/// rewarded ad for [HintQuota.perReward] more. If no ad is available the
/// hints are granted anyway. Returns whether a hint may be shown now.
Future<bool> requestHint(
  BuildContext context,
  WidgetRef ref,
  HintQuota quota,
) async {
  if (quota.use()) return true;
  final watch = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Out of hints'),
      content: Text('Watch a short ad for ${HintQuota.perReward} more hints?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Not now'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Watch ad'),
        ),
      ],
    ),
  );
  if (watch != true) return false;
  final result = await ref.read(adsServiceProvider).showRewarded();
  if (!result.grant) return false;
  quota.refill();
  return quota.use();
}

/// Ends a game round: the shared interstitial cap may show an ad first.
Future<void> finishRound(WidgetRef ref, VoidCallback then) async {
  await ref.read(adsServiceProvider).roundFinished();
  then();
}

/// "Double points" on a game summary: a rewarded ad the player chooses.
class DoublePointsButton extends ConsumerStatefulWidget {
  const DoublePointsButton({super.key, required this.points});

  /// Points earned this round; the reward adds them once more.
  final int points;

  @override
  ConsumerState<DoublePointsButton> createState() => _DoublePointsState();
}

class _DoublePointsState extends ConsumerState<DoublePointsButton> {
  bool _used = false;

  @override
  Widget build(BuildContext context) {
    final ads = ref.watch(adsServiceProvider);
    if (!ads.enabled || widget.points == 0 || _used) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: OutlinedButton.icon(
        onPressed: () async {
          setState(() => _used = true);
          final result = await ads.showRewarded();
          if (result.grant) {
            ref.read(statsProvider.notifier).addPoints(widget.points);
          }
        },
        icon: const Icon(Icons.ondemand_video_rounded),
        label: Text('Double points (+${widget.points})'),
      ),
    );
  }
}

/// Home: a streak lost by one missed day can come back for a rewarded ad.
class StreakRestoreCard extends ConsumerWidget {
  const StreakRestoreCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ads = ref.watch(adsServiceProvider);
    final streak = ref.watch(restorableStreakProvider);
    if (!ads.enabled || streak == 0) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: WhiteCard(
        onTap: () async {
          final result = await ads.showRewarded();
          if (result.grant) ref.read(statsProvider.notifier).restoreStreak();
        },
        child: Row(
          children: [
            const Text('🔥', style: TextStyle(fontSize: 24)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Restore your $streak-day streak',
                style: Theme.of(context).textTheme.titleSmall
                    ?.copyWith(fontWeight: FontWeight.w800),
              ),
            ),
            const Icon(
              Icons.ondemand_video_rounded,
              color: AppColors.orangeInk,
            ),
          ],
        ),
      ),
    );
  }
}

/// One of the owner's other German apps, for the house-ad slot.
class SiblingApp {
  const SiblingApp({
    required this.name,
    required this.pitch,
    this.androidPackage = '',
    this.appStoreId = '',
  });

  final String name;
  final String pitch;

  /// Play package name; empty until the app is live on Play.
  final String androidPackage;

  /// Numeric App Store id; empty until the app is live on the App Store.
  final String appStoreId;
}

/// Each has a different job, which is the point: a family, not clones.
/// Fill in a store id when that app goes live; until then it is hidden.
const siblingApps = [
  SiblingApp(name: 'Lernle', pitch: 'Read real German stories, word by word'),
  SiblingApp(name: 'WordBit', pitch: 'A German word every time you unlock'),
  SiblingApp(name: 'Leben in Deutschland', pitch: 'Pass the citizenship test'),
  SiblingApp(name: 'German audiobook', pitch: 'Listen to graded stories'),
];

/// The house-ad slot on the Practice tab. No SDK, no tracking: a store link.
class HouseAdCard extends StatelessWidget {
  const HouseAdCard({super.key, this.apps = siblingApps, this.day});

  final List<SiblingApp> apps;

  /// Rotation seed; defaults to the day of the year.
  final int? day;

  @override
  Widget build(BuildContext context) {
    final android = Theme.of(context).platform == TargetPlatform.android;
    final live = [
      for (final app in apps)
        if (android ? app.androidPackage.isNotEmpty : app.appStoreId.isNotEmpty)
          app,
    ];
    if (live.isEmpty) return const SizedBox.shrink();
    final now = DateTime.now();
    final app =
        live[(day ?? now.difference(DateTime(now.year)).inDays) % live.length];
    final url = android
        ? Uri.parse(
            'https://play.google.com/store/apps/details?id=${app.androidPackage}',
          )
        : Uri.parse('https://apps.apple.com/app/id${app.appStoreId}');
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: WhiteCard(
        onTap: () => launchUrl(url, mode: LaunchMode.externalApplication),
        child: Row(
          children: [
            const Icon(Icons.auto_stories_rounded, color: AppColors.blueBottom),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'More German from Pratiyush',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: AppColors.inkSoft,
                    ),
                  ),
                  Text(
                    app.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(app.pitch, style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
            const Icon(Icons.open_in_new_rounded, color: AppColors.inkSoft),
          ],
        ),
      ),
    );
  }
}
