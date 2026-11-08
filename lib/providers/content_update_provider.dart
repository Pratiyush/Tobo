import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../content/content_client.dart';
import '../content/content_source.dart';
import 'preferences_provider.dart';
import 'words_provider.dart';

const _lastCheckKey = 'content_last_check';
const _etagKey = 'content_etag';

/// CDN base URL; `--dart-define=CONTENT_BASE_URL=http://10.0.2.2:8787`
/// points a debug build at `content/tools/serve`.
const contentBaseUrlOverride = String.fromEnvironment('CONTENT_BASE_URL');

/// Injected in `main()`: the on-disk store of downloaded content.
final contentStoreProvider = Provider<ContentStore?>((ref) => null);

final contentFetcherProvider = Provider<ContentFetcher>(
  (ref) => HttpContentFetcher(),
);

/// Daily manifest check and on-tap update (spec: content-client.md).
class ContentUpdateNotifier extends Notifier<UpdateCheck> {
  @override
  UpdateCheck build() => const UpdateCheck(UpdateState.idle);

  ContentUpdater? get _updater {
    final store = ref.read(contentStoreProvider);
    if (store == null) return null;
    final content = ref.read(contentSourceProvider);
    return ContentUpdater(
      fetcher: ref.read(contentFetcherProvider),
      store: store,
      wordIds: [for (final w in ref.read(wordsProvider)) w.id],
      seedClipHashes: content is BundledContentSource
          ? content.seedClipHashes
          : const {},
      baseUrl: contentBaseUrlOverride.isEmpty
          ? contentBaseUrl
          : contentBaseUrlOverride,
    );
  }

  /// Installed content version.
  int get installedVersion =>
      ref.read(contentStoreProvider)?.version ?? seedContentVersion;

  /// At most once a day, on app open. Fails silently (offline is normal).
  Future<void> checkDaily() async {
    final prefs = ref.read(sharedPreferencesProvider);
    final now = ref.read(clockProvider)();
    final last = prefs.getInt(_lastCheckKey);
    if (last != null &&
        now.difference(DateTime.fromMillisecondsSinceEpoch(last)) <
            const Duration(hours: 24)) {
      return;
    }
    await check(silent: true);
  }

  /// Checks now (Settings button) or quietly (daily).
  Future<void> check({bool silent = false}) async {
    final updater = _updater;
    if (updater == null || state.state == UpdateState.updating) return;
    final prefs = ref.read(sharedPreferencesProvider);
    if (!silent) state = const UpdateCheck(UpdateState.checking);
    try {
      final (result, etag) = await updater.check(
        etag: prefs.getString(_etagKey),
      );
      await prefs.setInt(
        _lastCheckKey,
        ref.read(clockProvider)().millisecondsSinceEpoch,
      );
      if (etag != null) await prefs.setString(_etagKey, etag);
      state = result;
    } on Object catch (error) {
      developer.log('content check failed: $error', name: 'content');
      state = UpdateCheck(silent ? UpdateState.idle : UpdateState.failed);
    }
  }

  /// Downloads and installs the available version. On any failure the old
  /// content stays and the check runs again tomorrow.
  Future<void> update() async {
    final manifest = state.manifest;
    final updater = _updater;
    if (manifest == null ||
        updater == null ||
        state.state != UpdateState.available) {
      return;
    }
    state = UpdateCheck(UpdateState.updating, manifest: manifest);
    try {
      await updater.update(manifest);
      state = UpdateCheck(UpdateState.updated, manifest: manifest);
    } on Object catch (error) {
      developer.log('content update failed: $error', name: 'content');
      // Retry tomorrow: forget the ETag so the next check re-reads.
      await ref.read(sharedPreferencesProvider).remove(_etagKey);
      state = UpdateCheck(UpdateState.failed, manifest: manifest);
    }
  }
}

final contentUpdateProvider =
    NotifierProvider<ContentUpdateNotifier, UpdateCheck>(
      ContentUpdateNotifier.new,
    );
