import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/level.dart';
import 'preferences_provider.dart';

const _autoSpeakKey = 'settings_auto_speak';
const _gamesAsPracticeKey = 'settings_games_as_practice';
const _soundEffectsKey = 'settings_sound_effects';
const _levelsKey = 'settings_levels';

class Settings {
  const Settings({
    this.autoSpeak = true,
    this.countGamesAsPractice = true,
    this.soundEffects = true,
    this.levels = const LevelChoice.sequence(),
  });

  /// Speak each word when its card or answer appears.
  final bool autoSpeak;

  /// Game answers move learned words up or down like practice does.
  final bool countGamesAsPractice;

  /// Game sounds and haptics.
  final bool soundEffects;

  /// Which levels the word lists and all games draw from.
  final LevelChoice levels;

  Settings copyWith({
    bool? autoSpeak,
    bool? countGamesAsPractice,
    bool? soundEffects,
    LevelChoice? levels,
  }) => Settings(
    autoSpeak: autoSpeak ?? this.autoSpeak,
    countGamesAsPractice: countGamesAsPractice ?? this.countGamesAsPractice,
    soundEffects: soundEffects ?? this.soundEffects,
    levels: levels ?? this.levels,
  );
}

class SettingsNotifier extends Notifier<Settings> {
  @override
  Settings build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return Settings(
      autoSpeak: prefs.getBool(_autoSpeakKey) ?? true,
      countGamesAsPractice: prefs.getBool(_gamesAsPracticeKey) ?? true,
      soundEffects: prefs.getBool(_soundEffectsKey) ?? true,
      levels: LevelChoice.fromPrefs(prefs.getStringList(_levelsKey)),
    );
  }

  void setAutoSpeak(bool value) {
    state = state.copyWith(autoSpeak: value);
    ref.read(sharedPreferencesProvider).setBool(_autoSpeakKey, value);
  }

  void setCountGamesAsPractice(bool value) {
    state = state.copyWith(countGamesAsPractice: value);
    ref.read(sharedPreferencesProvider).setBool(_gamesAsPracticeKey, value);
  }

  void setLevels(LevelChoice value) {
    state = state.copyWith(levels: value);
    ref
        .read(sharedPreferencesProvider)
        .setStringList(_levelsKey, value.toPrefs());
  }

  void setSoundEffects(bool value) {
    state = state.copyWith(soundEffects: value);
    ref.read(sharedPreferencesProvider).setBool(_soundEffectsKey, value);
  }
}

final settingsProvider = NotifierProvider<SettingsNotifier, Settings>(
  SettingsNotifier.new,
);
