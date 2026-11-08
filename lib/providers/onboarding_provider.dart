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
