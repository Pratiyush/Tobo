// Content client end to end (spec: German/docs/content-client.md §8).
//
// Live smoke test (needs internet):
//   flutter test integration_test/content_e2e_test.dart -d <device>
// Update against the local server (Android emulator):
//   python3 -I tool/content/make_test_dist.py ../content/dist build/content-test-dist
//   node ../content/tools/serve --dir build/content-test-dist --port 8787 &
//   flutter test integration_test/content_e2e_test.dart -d emulator-5564 \
//     --dart-define=CONTENT_BASE_URL=http://10.0.2.2:8787
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/app.dart';
import 'package:german_words/content/content_client.dart';
import 'package:german_words/content/content_source.dart';
import 'package:german_words/providers/content_update_provider.dart';
import 'package:german_words/providers/preferences_provider.dart';
import 'package:german_words/providers/speech_provider.dart';
import 'package:german_words/providers/words_provider.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('live CDN: manifest parses and a file verifies by sha256', (
    tester,
  ) async {
    final tmp = await Directory.systemTemp.createTemp('content-smoke');
    addTearDown(() => tmp.delete(recursive: true));
    final updater = ContentUpdater(
      fetcher: HttpContentFetcher(),
      store: ContentStore(tmp),
      wordIds: const ['de.zeit.n'],
    );
    late UpdateCheck check;
    late String? etag;
    await tester.runAsync(() async => (check, etag) = await updater.check());
    expect(check.manifest, isNotNull);
    expect(check.manifest!.minClient, lessThanOrEqualTo(contentClientVersion));
    expect(check.state, anyOf(UpdateState.upToDate, UpdateState.available));
    // A second check with the ETag is a cheap 304.
    late UpdateCheck again;
    await tester.runAsync(
      () async => (again, _) = await updater.check(etag: etag),
    );
    expect(again.state, UpdateState.upToDate);
    // Download the lookup and verify its hash, as an update would.
    final lookup = check.manifest!.lookup;
    late FetchResult r;
    await tester.runAsync(
      () async => r = await HttpContentFetcher().get(
        Uri.parse('$contentBaseUrl/${lookup.url}'),
      ),
    );
    expect(r.status, 200);
    expect(sha256Matches(r.body, lookup.sha256), isTrue);
  });

  testWidgets(
    'update from the local server: changed clip downloads and plays',
    (tester) async {
      final support = await getApplicationSupportDirectory();
      final root = Directory('${support.path}/content-e2e');
      if (root.existsSync()) root.deleteSync(recursive: true);
      addTearDown(() => root.deleteSync(recursive: true));
      final store = ContentStore(root);
      final content = UpdatableContentSource(store);
      final words = await content.loadWords();
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      final audio = AudioPlayersEngine();
      final c = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          contentSourceProvider.overrideWithValue(content),
          contentStoreProvider.overrideWithValue(store),
          wordsProvider.overrideWithValue(words),
          audioEngineProvider.overrideWithValue(audio),
        ],
      );
      addTearDown(c.dispose);
      await tester.pumpWidget(
        UncontrolledProviderScope(container: c, child: const GermanWordsApp()),
      );
      await tester.pumpAndSettle();
      expect(content.audioFor('de.sein.v'), isA<AssetMedia>());

      await tester.tap(find.text('Settings'));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(TextButton, 'Check'));
      for (var i = 0; i < 100 && find.text('Update').evaluate().isEmpty; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      expect(find.textContaining('Version 2 available'), findsOneWidget);
      await tester.tap(find.widgetWithText(TextButton, 'Update'));
      for (
        var i = 0;
        i < 300 && c.read(contentUpdateProvider).state != UpdateState.updated;
        i++
      ) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      expect(c.read(contentUpdateProvider).state, UpdateState.updated);
      expect(store.version, 2);
      expect(store.words, hasLength(words.length));

      // The changed word now plays its downloaded clip; others stay bundled.
      final clip = content.audioFor('de.sein.v');
      expect(clip, isA<FileMedia>());
      expect(content.audioFor('de.zeit.n'), isA<AssetMedia>());
      final done = audio.onComplete.first;
      await audio.play(clip!);
      await done.timeout(const Duration(seconds: 10));
      await tester.pumpAndSettle();
    },
    skip: contentBaseUrlOverride.isEmpty,
  );
}
