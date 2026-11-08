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

/// Today's board result, or null when not played yet.
typedef DailyResult = ({int stars, int hints});

class DailyHiveResult extends Notifier<DailyResult?> {
  @override
  DailyResult? build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final key = ref.watch(dailyHiveProvider).prefsKey;
    final stars = prefs.getInt(key);
    return stars == null
        ? null
        : (stars: stars, hints: prefs.getInt('${key}_hints') ?? 0);
  }

  void record(int stars, int hints) {
    state = (stars: stars, hints: hints);
    final key = ref.read(dailyHiveProvider).prefsKey;
    ref.read(sharedPreferencesProvider)
      ..setInt(key, stars)
      ..setInt('${key}_hints', hints);
  }
}

final dailyHiveResultProvider = NotifierProvider<DailyHiveResult, DailyResult?>(
  DailyHiveResult.new,
);

/// Opens the platform share sheet; replaced in tests.
final shareTextProvider = Provider<Future<void> Function(String)>(
  (ref) =>
      (text) => SharePlus.instance.share(ShareParams(text: text)),
);
