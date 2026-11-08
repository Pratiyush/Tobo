import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:german_words/ads/ads_service.dart';
import 'package:german_words/app.dart';
import 'package:german_words/content/content_source.dart';
import 'package:german_words/data/word_repository.dart';
import 'package:german_words/models/word.dart';
import 'package:german_words/providers/feedback_provider.dart';
import 'package:german_words/providers/preferences_provider.dart';
import 'package:german_words/providers/speech_provider.dart';
import 'package:german_words/providers/words_provider.dart';
import 'package:german_words/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The real deck, read straight from the asset file.
final List<Word> deck = parseWords(File(wordsAsset).readAsStringSync());

/// Records calls instead of talking to the platform TTS engine.
class FakeSpeechEngine implements SpeechEngine {
  FakeSpeechEngine({this.available = true});

  /// What [isLanguageAvailable] answers; tests may flip it.
  bool available;
  int availabilityChecks = 0;
  final spoken = <String>[];

  @override
  Future<bool> isLanguageAvailable(String locale) async {
    availabilityChecks++;
    return available;
  }

  @override
  Future<void> setLanguage(String locale) async {}

  @override
  Future<void> speak(String text) async => spoken.add(text);

  @override
  Future<void> stop() async {}
}

/// Records clips instead of playing them.
class FakeAudioEngine implements AudioEngine {
  final played = <MediaRef>[];

  @override
  Future<void> play(MediaRef clip) async => played.add(clip);

  @override
  Future<void> stop() async {}
}

/// Every deck word has a clip unless listed in [withoutClips].
class FakeContentSource implements ContentSource {
  FakeContentSource({this.withoutClips = const {}});

  final Set<String> withoutClips;

  @override
  Future<List<Word>> loadWords() async => deck;

  @override
  MediaRef? audioFor(String wordId) => withoutClips.contains(wordId)
      ? null
      : AssetMedia('$audioDir/$wordId.mp3');

  @override
  MediaRef? imageFor(String wordId) => null;
}

/// Records game sounds instead of playing them.
class FakeFeedbackEngine implements FeedbackEngine {
  final played = <GameSound>[];

  @override
  void play(GameSound sound) => played.add(sound);
}

/// A clock tests can move forward.
class TestClock {
  TestClock([DateTime? start]) : now = start ?? DateTime(2026, 10, 17, 9);

  DateTime now;

  DateTime call() => now;
}

Future<ProviderContainer> createContainer({
  Map<String, Object> prefs = const {},
  SpeechEngine? engine,
  AudioEngine? audio,
  ContentSource? content,
  AdsService? ads,
  FeedbackEngine? feedback,
  TestClock? clock,
  List<Word>? words,
}) async {
  SharedPreferences.setMockInitialValues(prefs);
  final instance = await SharedPreferences.getInstance();
  return ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(instance),
      wordsProvider.overrideWithValue(words ?? deck),
      speechEngineProvider.overrideWithValue(engine ?? FakeSpeechEngine()),
      audioEngineProvider.overrideWithValue(audio ?? FakeAudioEngine()),
      contentSourceProvider.overrideWithValue(content ?? FakeContentSource()),
      adsServiceProvider.overrideWithValue(ads ?? NoAdsService()),
      feedbackEngineProvider.overrideWithValue(
        feedback ?? FakeFeedbackEngine(),
      ),
      if (clock != null) clockProvider.overrideWithValue(clock.call),
    ],
  );
}

Widget buildApp(ProviderContainer container) => UncontrolledProviderScope(
  container: container,
  child: const GermanWordsApp(),
);

Widget buildScreen(ProviderContainer container, Widget screen) =>
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(theme: buildTheme(), home: screen),
    );
