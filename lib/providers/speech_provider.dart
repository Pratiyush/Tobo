import 'dart:async';
import 'dart:developer' as developer;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../content/content_source.dart';
import '../models/word.dart';

const germanLocale = 'de-DE';

/// Thin wrapper over the platform text-to-speech engine so it can be faked
/// in tests. Only used for sentences and words without a recorded clip.
abstract class SpeechEngine {
  Future<bool> isLanguageAvailable(String locale);
  Future<void> setLanguage(String locale);
  Future<void> speak(String text);
  Future<void> stop();
}

class FlutterTtsEngine implements SpeechEngine {
  FlutterTtsEngine() : _tts = FlutterTts() {
    // Play through the iOS silent switch, like a media app.
    _tts.setIosAudioCategory(IosTextToSpeechAudioCategory.playback, [
      IosTextToSpeechAudioCategoryOptions.duckOthers,
    ]);
    _tts.setSpeechRate(0.45);
  }

  final FlutterTts _tts;

  @override
  Future<bool> isLanguageAvailable(String locale) async =>
      await _tts.isLanguageAvailable(locale) == true;

  @override
  Future<void> setLanguage(String locale) => _tts.setLanguage(locale);

  @override
  Future<void> speak(String text) => _tts.speak(text);

  @override
  Future<void> stop() => _tts.stop();
}

/// Plays recorded clips. Faked in tests.
abstract class AudioEngine {
  /// Starts [clip]; completes once playback has started. Throws if the clip
  /// can't be played.
  Future<void> play(MediaRef clip);
  Future<void> stop();
}

class AudioPlayersEngine implements AudioEngine {
  AudioPlayersEngine() {
    // Nothing uses the playback position; without this, audioplayers
    // schedules a frame every vsync while a clip plays (see BUG-25).
    _player.positionUpdater = null;
    // Like the TTS engine: play through the iOS silent switch.
    unawaited(
      _player.setAudioContext(
        AudioContextConfig(respectSilence: false).build(),
      ),
    );
  }

  final _player = AudioPlayer(playerId: 'pronunciation');

  /// Completes each time a clip finishes. Integration tests listen to it.
  Stream<void> get onComplete => _player.onPlayerComplete;

  @override
  Future<void> play(MediaRef clip) async {
    await _player.stop();
    await _player.play(switch (clip) {
      // AudioCache prefixes asset paths with "assets/".
      AssetMedia(:final path) => AssetSource(
        path.replaceFirst(RegExp('^assets/'), ''),
      ),
      FileMedia(:final path) => DeviceFileSource(path),
      RemoteMedia(:final url) => UrlSource(url.toString()),
    });
  }

  @override
  Future<void> stop() => _player.stop();

  Future<void> dispose() => _player.dispose();
}

final speechEngineProvider = Provider<SpeechEngine>((ref) {
  final engine = FlutterTtsEngine();
  ref.onDispose(engine.stop);
  return engine;
});

final audioEngineProvider = Provider<AudioEngine>((ref) {
  final engine = AudioPlayersEngine();
  ref.onDispose(engine.dispose);
  return engine;
});

/// Speaks German. Widgets use this, never `FlutterTts` or `AudioPlayer`.
class Speaker {
  Speaker(
    this._engine, {
    this._audio,
    this._content,
    this.retryDelay = const Duration(milliseconds: 800),
  });

  final SpeechEngine _engine;
  final AudioEngine? _audio;
  final ContentSource? _content;

  /// Wait before asking the engine a second time. A cold Android TTS engine
  /// can fail its first query while it is still binding.
  final Duration retryDelay;

  /// Only a positive answer is cached: a "no" may be a transient failure, or
  /// the user may install a German voice while the app is running.
  bool _available = false;

  /// Word ids that had no clip and fell back to device TTS.
  final Set<String> clipMisses = {};

  /// Plays the word's recorded clip (nouns with their article), falling back
  /// to device TTS when there is none or it can't play. Returns false when
  /// nothing could be spoken.
  Future<bool> sayWord(Word word) async {
    final clip = _content?.audioFor(word.id);
    final audio = _audio;
    if (clip != null && audio != null) {
      try {
        await _engine.stop();
        await audio.play(clip);
        return true;
      } on Object catch (error) {
        developer.log('Clip $clip failed: $error', name: 'audio');
      }
    } else if (clipMisses.add(word.id)) {
      developer.log('No clip for ${word.id}; using device TTS', name: 'audio');
    }
    return say(word.display);
  }

  /// Speaks [text] with device TTS. Used for example sentences. Returns false
  /// when the device has no German voice.
  Future<bool> say(String text) async {
    if (!_available) {
      _available =
          await _engine.isLanguageAvailable(germanLocale) ||
          await Future<bool>.delayed(
            retryDelay,
            () => _engine.isLanguageAvailable(germanLocale),
          );
    }
    if (!_available) return false;
    await _audio?.stop();
    await _engine.stop();
    await _engine.setLanguage(germanLocale);
    await _engine.speak(text);
    return true;
  }

  Future<void> stop() async {
    await _audio?.stop();
    await _engine.stop();
  }
}

final speakerProvider = Provider<Speaker>(
  (ref) => Speaker(
    ref.watch(speechEngineProvider),
    audio: ref.watch(audioEngineProvider),
    content: ref.watch(contentSourceProvider),
  ),
);
