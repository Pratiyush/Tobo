import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:german_words/app.dart';
import 'package:german_words/data/word_repository.dart';
import 'package:german_words/models/word.dart';
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

  final bool available;
  final spoken = <String>[];

  @override
  Future<bool> isLanguageAvailable(String locale) async => available;

  @override
  Future<void> setLanguage(String locale) async {}

  @override
  Future<void> speak(String text) async => spoken.add(text);

  @override
  Future<void> stop() async {}
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
