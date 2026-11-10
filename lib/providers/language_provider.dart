import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/languages.dart';
import 'preferences_provider.dart';

const appLanguageKey = 'settings_language';

/// The UI language the learner picked (a [Language.tag]), or null to follow
/// the device. Word meanings stay English: they are content, not UI.
class AppLanguageNotifier extends Notifier<String?> {
  @override
  String? build() {
    final tag = ref.watch(sharedPreferencesProvider).getString(appLanguageKey);
    // A tag from an older build that no longer has a translation: follow the
    // device instead of showing a half-English UI.
    return tag != null && languageForTag(tag)?.available == true ? tag : null;
  }

  void set(String? tag) {
    state = tag;
    final prefs = ref.read(sharedPreferencesProvider);
    tag == null
        ? prefs.remove(appLanguageKey)
        : prefs.setString(appLanguageKey, tag);
  }
}

final appLanguageProvider = NotifierProvider<AppLanguageNotifier, String?>(
  AppLanguageNotifier.new,
);
