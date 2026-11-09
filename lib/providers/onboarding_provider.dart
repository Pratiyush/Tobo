import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'preferences_provider.dart';

const onboardedKey = 'onboarded';

/// Whether the first-run level question was answered. Learners who already
/// have progress (updating from a version without onboarding) skip it.
class OnboardingNotifier extends Notifier<bool> {
  @override
  bool build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getBool(onboardedKey) ??
        (prefs.containsKey('word_progress') ||
            prefs.containsKey('stats_points'));
  }

  void complete() {
    state = true;
    ref.read(sharedPreferencesProvider).setBool(onboardedKey, true);
  }
}

final onboardedProvider = NotifierProvider<OnboardingNotifier, bool>(
  OnboardingNotifier.new,
);

const hiveCoachedKey = 'hive_coached';

/// Whether the Hive's "how to play" line has done its job: shown to a
/// first-time player until they solve one word. Anyone with a Hive best
/// score has played before and never sees it.
class HiveCoachNotifier extends Notifier<bool> {
  @override
  bool build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getBool(hiveCoachedKey) ?? prefs.containsKey('best_hive');
  }

  void done() {
    if (state) return;
    state = true;
    ref.read(sharedPreferencesProvider).setBool(hiveCoachedKey, true);
  }
}

final hiveCoachedProvider = NotifierProvider<HiveCoachNotifier, bool>(
  HiveCoachNotifier.new,
);
