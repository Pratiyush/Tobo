import 'dart:async';
import 'dart:developer' as developer;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'preferences_provider.dart';
import 'settings_provider.dart';

/// Game sounds, synthesized by tool/sfx/make_sfx.py (original).
enum GameSound { correct, wrong, combo, roundEnd }

/// Plays a sound and its haptic. Faked in tests.
abstract class FeedbackEngine {
  void play(GameSound sound);
}

class DeviceFeedbackEngine implements FeedbackEngine {
  DeviceFeedbackEngine() {
    for (final p in _players.values) {
      // No position tracking: audioplayers' frame-based updater would ask
      // for a frame every vsync while "playing", and Android's low-latency
      // (SoundPool) player never reports completion, so after one chime the
      // app would never go idle again (BUG-25).
      p.positionUpdater = null;
      // Low-latency, mixed with other audio, and quiet under the iOS silent
      // switch (unlike word recordings, which play through it).
      unawaited(p.setPlayerMode(PlayerMode.lowLatency));
      unawaited(
        p.setAudioContext(
          AudioContextConfig(
            respectSilence: true,
            focus: AudioContextConfigFocus.mixWithOthers,
          ).build(),
        ),
      );
      unawaited(p.setReleaseMode(ReleaseMode.stop));
    }
  }

  static const _files = {
    GameSound.correct: 'sfx/correct.wav',
    GameSound.wrong: 'sfx/wrong.wav',
    GameSound.combo: 'sfx/combo.wav',
    GameSound.roundEnd: 'sfx/round_end.wav',
  };

  final _players = {
    for (final s in GameSound.values) s: AudioPlayer(playerId: 'sfx-${s.name}'),
  };

  @override
  void play(GameSound sound) {
    switch (sound) {
      case GameSound.correct:
        HapticFeedback.lightImpact();
      case GameSound.wrong:
        HapticFeedback.mediumImpact();
      case GameSound.combo:
        HapticFeedback.selectionClick();
      case GameSound.roundEnd:
        HapticFeedback.heavyImpact();
    }
    final player = _players[sound]!;
    // Fire and forget; a sound that can't play must never surface an error.
    unawaited(
      player
          .stop()
          .then((_) => player.play(AssetSource(_files[sound]!)))
          .catchError((Object e) => developer.log('sfx: $e', name: 'audio')),
    );
  }

  Future<void> dispose() async {
    for (final p in _players.values) {
      await p.dispose();
    }
  }
}

final feedbackEngineProvider = Provider<FeedbackEngine>((ref) {
  final engine = DeviceFeedbackEngine();
  ref.onDispose(engine.dispose);
  return engine;
});

/// What games call: respects the "Sounds & vibration" setting.
class GameFeedback {
  GameFeedback(this._engine, {required this.enabled});

  final FeedbackEngine _engine;
  final bool enabled;

  void right({int combo = 0}) {
    if (!enabled) return;
    _engine.play(combo >= 3 ? GameSound.combo : GameSound.correct);
  }

  void wrong() {
    if (enabled) _engine.play(GameSound.wrong);
  }

  void roundEnd() {
    if (enabled) _engine.play(GameSound.roundEnd);
  }
}

final feedbackProvider = Provider<GameFeedback>(
  (ref) => GameFeedback(
    ref.watch(feedbackEngineProvider),
    enabled: ref.watch(settingsProvider).soundEffects,
  ),
);

/// Best score per game, persisted.
class BestScores extends Notifier<Map<String, int>> {
  static String _key(String game) => 'best_$game';

  @override
  Map<String, int> build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return {
      for (final game in const ['derdiedas', 'fallee', 'hive', 'practice'])
        game: prefs.getInt(_key(game)) ?? 0,
    };
  }

  void reset() {
    final prefs = ref.read(sharedPreferencesProvider);
    for (final game in state.keys) {
      prefs.remove(_key(game));
    }
    state = {for (final game in state.keys) game: 0};
  }

  /// Records [score] for [game]; true when it beats the previous best.
  bool submit(String game, int score) {
    final previous = state[game] ?? 0;
    if (score <= previous) return false;
    state = {...state, game: score};
    ref.read(sharedPreferencesProvider).setInt(_key(game), score);
    return true;
  }
}

final bestScoresProvider = NotifierProvider<BestScores, Map<String, int>>(
  BestScores.new,
);
