import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../games/daily.dart';
import 'preferences_provider.dart';
import 'progress_provider.dart';
import 'settings_provider.dart';

/// Today's board for the learner's level.
final dailyHiveProvider = Provider<DailyHive>((ref) {
  final now = ref.watch(clockProvider)();
  final chosen = ref.watch(settingsProvider.select((s) => s.levels)).active;
  final progress = ref.watch(levelProgressProvider);
  return DailyHive(
    DateTime(now.year, now.month, now.day),
    dailyLevel(chosen, (l) => progress[l]!.learned < progress[l]!.total),
  );
});

/// Stars earned on today's board (0–3), or null when not played yet.
class DailyHiveResult extends Notifier<int?> {
  @override
  int? build() => ref
      .watch(sharedPreferencesProvider)
      .getInt(ref.watch(dailyHiveProvider).prefsKey);

  void record(int stars) {
    state = stars;
    ref
        .read(sharedPreferencesProvider)
        .setInt(ref.read(dailyHiveProvider).prefsKey, stars);
  }
}

final dailyHiveResultProvider = NotifierProvider<DailyHiveResult, int?>(
  DailyHiveResult.new,
);

/// Opens the platform share sheet; replaced in tests.
final shareTextProvider = Provider<Future<void> Function(String)>(
  (ref) =>
      (text) => SharePlus.instance.share(ShareParams(text: text)),
);
