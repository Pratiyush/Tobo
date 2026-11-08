import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';

const germanLocale = 'de-DE';

/// Thin wrapper over the platform text-to-speech engine so it can be faked
/// in tests.
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

final speechEngineProvider = Provider<SpeechEngine>((ref) {
  final engine = FlutterTtsEngine();
  ref.onDispose(engine.stop);
  return engine;
});

/// Speaks German. Widgets use this, never `FlutterTts` directly.
class Speaker {
  Speaker(this._engine, {this.retryDelay = const Duration(milliseconds: 800)});

  final SpeechEngine _engine;

  /// Wait before asking the engine a second time. A cold Android TTS engine
  /// can fail its first query while it is still binding.
  final Duration retryDelay;

  /// Only a positive answer is cached: a "no" may be a transient failure, or
  /// the user may install a German voice while the app is running.
  bool _available = false;

  /// Returns false when the device has no German voice.
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
    await _engine.stop();
    await _engine.setLanguage(germanLocale);
    await _engine.speak(text);
    return true;
  }

  Future<void> stop() => _engine.stop();
}

final speakerProvider = Provider<Speaker>(
  (ref) => Speaker(ref.watch(speechEngineProvider)),
);
