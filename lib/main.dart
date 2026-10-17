import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'data/word_repository.dart';
import 'providers/preferences_provider.dart';
import 'providers/words_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final words = parseWords(await rootBundle.loadString(wordsAsset));
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        wordsProvider.overrideWithValue(words),
      ],
      child: const GermanWordsApp(),
    ),
  );
}
