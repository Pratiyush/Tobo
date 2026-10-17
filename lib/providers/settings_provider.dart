import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'preferences_provider.dart';

const _autoSpeakKey = 'settings_auto_speak';
const _gamesAsPracticeKey = 'settings_games_as_practice';

class Settings {
  const Settings({this.autoSpeak = true, this.countGamesAsPractice = true});

  /// Speak each word when its card or answer appears.
  final bool autoSpeak;

  /// Game answers move learned words up or down like practice does.
  final bool countGamesAsPractice;
}

class SettingsNotifier extends Notifier<Settings> {
  @override
  Settings build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return Settings(
      autoSpeak: prefs.getBool(_autoSpeakKey) ?? true,
      countGamesAsPractice: prefs.getBool(_gamesAsPracticeKey) ?? true,
    );
  }

  void setAutoSpeak(bool value) {
    state = Settings(
      autoSpeak: value,
      countGamesAsPractice: state.countGamesAsPractice,
    );
    ref.read(sharedPreferencesProvider).setBool(_autoSpeakKey, value);
  }

  void setCountGamesAsPractice(bool value) {
    state = Settings(autoSpeak: state.autoSpeak, countGamesAsPractice: value);
    ref.read(sharedPreferencesProvider).setBool(_gamesAsPracticeKey, value);
  }
}

final settingsProvider = NotifierProvider<SettingsNotifier, Settings>(
  SettingsNotifier.new,
);
