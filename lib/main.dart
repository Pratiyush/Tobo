import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ads/ads_service.dart';
import 'app.dart';
import 'services/error_log.dart';
import 'content/content_client.dart';
import 'content/content_source.dart';
import 'providers/content_update_provider.dart';
import 'providers/preferences_provider.dart';
import 'providers/words_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    // Load both at once; the splash stays up until the first frame.
    // CONTENT_CDN_ENABLED off (default): bundled seed only, no store, no
    // network content requests.
    final store = contentCdnEnabled
        ? ContentStore(
            Directory(
              '${(await getApplicationSupportDirectory()).path}/content',
            ),
          )
        : null;
    final content = store != null
        ? UpdatableContentSource(store)
        : BundledContentSource();
    final (prefs, words) = await (
      SharedPreferences.getInstance(),
      content.loadWords(),
    ).wait;
    await prefs.setInt(launchCountKey, (prefs.getInt(launchCountKey) ?? 0) + 1);
    final errors = ErrorLog(prefs);
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      errors.record(details.exception, details.stack);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      errors.record(error, stack);
      return true;
    };
    runApp(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          contentSourceProvider.overrideWithValue(content),
          if (store != null) contentStoreProvider.overrideWithValue(store),
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
