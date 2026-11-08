import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'content/content_source.dart';
import 'providers/preferences_provider.dart';
import 'providers/words_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    // Load both at once; the splash stays up until the first frame.
    final content = BundledContentSource();
    final (prefs, words) = await (
      SharedPreferences.getInstance(),
      content.loadWords(),
    ).wait;
    runApp(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          contentSourceProvider.overrideWithValue(content),
          wordsProvider.overrideWithValue(words),
        ],
        child: const GermanWordsApp(),
      ),
    );
  } catch (error) {
    // Never leave the user staring at the splash screen.
    runApp(StartupErrorApp(error: error));
  }
}
