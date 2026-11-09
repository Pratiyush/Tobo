// Client for the shared german-content CDN (spec: German/docs/content-client.md).
//
// Wortschatz bundles its own seed: the 676 words and their clips, byte-
// identical to CDN content_version 1. Once a day (on app open) it checks the
// manifest. When a newer content_version exists, the learner can update:
// only Wortschatz's words and the clips whose sha256 changed are downloaded,
// every file is sha256-verified, the new version is written to a staging
// directory and switched in atomically. Any failure keeps the old content.
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

/// The CDN client is off unless built with `--dart-define=CONTENT_CDN_ENABLED=true`
/// (hub decision, 2026-11-09): off, the app uses only its bundled seed and
/// makes no content requests at all. Turn it on once the privacy policy has
/// its content-downloads section.
const contentCdnEnabled = bool.fromEnvironment('CONTENT_CDN_ENABLED');

/// The live CDN. The local `content/tools/serve` mirrors it for tests.
const contentBaseUrl = 'https://german-content.pratiyush1.workers.dev';

/// This client's protocol version, compared with the manifest's min_client.
const contentClientVersion = 1;

/// content_version the bundled seed matches (checked 2026-11-08: all 676
/// words and clips identical to the CDN's).
const seedContentVersion = 1;

/// Levels Wortschatz's words come from.
const contentLevels = ['a1', 'a2', 'b1', 'b2'];

/// A file on the CDN: path relative to the base URL, plus its hash and size.
class RemoteFile {
  const RemoteFile(this.url, this.sha256, this.bytes);

  factory RemoteFile.fromJson(Map<String, dynamic> j) =>
      RemoteFile(j['url'] as String, j['sha256'] as String, j['bytes'] as int);

  final String url;
  final String sha256;
  final int bytes;
}

/// The parts of /manifest.json Wortschatz uses.
class ContentManifest {
  const ContentManifest({
    required this.contentVersion,
    required this.minClient,
    required this.lookup,
    required this.words,
  });

  factory ContentManifest.fromJson(Map<String, dynamic> j) {
    final levels = j['levels'] as Map<String, dynamic>;
    return ContentManifest(
      contentVersion: j['content_version'] as int,
      minClient: j['min_client'] as int,
      lookup: RemoteFile.fromJson(j['lookup'] as Map<String, dynamic>),
      words: {
        for (final level in contentLevels)
          if (levels[level] case final Map<String, dynamic> l)
            level: RemoteFile.fromJson(l['words'] as Map<String, dynamic>),
      },
    );
  }

  final int contentVersion;
  final int minClient;
  final RemoteFile lookup;
  final Map<String, RemoteFile> words;

  bool get appTooOld => minClient > contentClientVersion;
}

/// True when [remote] is newer than what is installed.
bool isNewerContent(int remote, int installed) => remote > installed;

bool sha256Matches(List<int> bytes, String expected) =>
    sha256.convert(bytes).toString() == expected.toLowerCase();

/// Converts a CDN words-pack row into Wortschatz's word row (the same shape
/// tool/import_lernle.dart writes).
Map<String, Object?> wordRowFromCdn(Map<String, dynamic> r) {
  final examples = (r['examples'] as List?) ?? const [];
  final first = examples.isEmpty
      ? const <String, dynamic>{}
      : examples.first as Map<String, dynamic>;
  final plural = r['plural'] as String?;
  return {
    'id': r['id'],
    'de': r['lemma'],
    'pos': r['pos'],
    if (r['article'] != null) 'gender': r['article'],
    if (plural != null && plural.isNotEmpty) 'plural': plural,
    'en': (r['translations'] as Map<String, dynamic>)['en'],
    if (first['de'] != null) 'exDe': first['de'],
    if (first['en'] != null) 'exEn': first['en'],
    'cefr': r['cefr'],
  };
}

/// Clips to download: Wortschatz's ids whose CDN hash differs from the
/// installed one. Ids the CDN doesn't know keep their installed clip.
Map<String, RemoteFile> clipsToFetch(
  Map<String, dynamic> lookupClips,
  Iterable<String> ids,
  Map<String, String> installedHashes,
) => {
  for (final id in ids)
    if (lookupClips[id] case final Map<String, dynamic> c
        when c['sha256'] != installedHashes[id])
      id: RemoteFile.fromJson(c),
};

/// Result of a GET: status, body, ETag.
class FetchResult {
  const FetchResult(this.status, this.body, this.etag);

  final int status;
  final List<int> body;
  final String? etag;
}

/// Network access, faked in tests.
abstract class ContentFetcher {
  Future<FetchResult> get(Uri url, {String? etag});
}

class HttpContentFetcher implements ContentFetcher {
  HttpContentFetcher([http.Client? client]) : _client = client ?? http.Client();

  final http.Client _client;

  @override
  Future<FetchResult> get(Uri url, {String? etag}) async {
    // No identifiers beyond what HTTP needs; no cookies, no analytics.
    final response = await _client
        .get(url, headers: {'If-None-Match': ?etag})
        .timeout(const Duration(seconds: 30));
    return FetchResult(
      response.statusCode,
      response.bodyBytes,
      response.headers['etag'],
    );
  }
}

/// Installed content on disk: `root/vN/words.json`, `root/vN/clips.json`
/// and `root/vN/audio/ID.mp3`, plus `root/installed.json` naming the live
/// version N.
class ContentStore {
  ContentStore(this.root);

  final Directory root;

  File get _pointer => File('${root.path}/installed.json');

  /// The installed version, or [seedContentVersion] when only the seed exists.
  int get version {
    try {
      final j = jsonDecode(_pointer.readAsStringSync()) as Map<String, dynamic>;
      return j['version'] as int;
    } on Object {
      return seedContentVersion;
    }
  }

  Directory get _live => Directory('${root.path}/v$version');

  /// Words of the installed version, or null to use the bundled seed.
  List<dynamic>? get words {
    final f = File('${_live.path}/words.json');
    if (version <= seedContentVersion || !f.existsSync()) return null;
    try {
      return jsonDecode(f.readAsStringSync()) as List<dynamic>;
    } on Object {
      return null;
    }
  }

  /// sha256 of every installed (downloaded) clip, keyed by word id.
  Map<String, String> get clipHashes {
    final f = File('${_live.path}/clips.json');
    if (!f.existsSync()) return const {};
    return (jsonDecode(f.readAsStringSync()) as Map<String, dynamic>)
        .cast<String, String>();
  }

  /// Path of a downloaded clip for [id], or null to use the bundled one.
  String? clipPath(String id) {
    if (version <= seedContentVersion) return null;
    final f = File('${_live.path}/audio/$id.mp3');
    return f.existsSync() ? f.path : null;
  }

  /// Writes [version] atomically: everything goes to a staging directory,
  /// then the pointer file is replaced by a rename. Clips not in [newClips]
  /// are carried over from the current version. On any error the staging
  /// directory is removed and the current version stays live.
  Future<void> install({
    required int version,
    required List<Map<String, Object?>> words,
    required Map<String, List<int>> newClips,
    required Map<String, String> clipHashes,
  }) async {
    final staging = Directory('${root.path}/staging-v$version');
    try {
      if (staging.existsSync()) staging.deleteSync(recursive: true);
      Directory('${staging.path}/audio').createSync(recursive: true);
      File('${staging.path}/words.json').writeAsStringSync(jsonEncode(words));
      final previous = _live;
      for (final id in clipHashes.keys) {
        final target = File('${staging.path}/audio/$id.mp3');
        if (newClips[id] case final bytes?) {
          target.writeAsBytesSync(bytes, flush: true);
        } else if (File('${previous.path}/audio/$id.mp3') case final old
            when old.existsSync()) {
          old.copySync(target.path);
        }
      }
      File('${staging.path}/clips.json')
          .writeAsStringSync(jsonEncode(clipHashes));
      final live = Directory('${root.path}/v$version');
      if (live.existsSync()) live.deleteSync(recursive: true);
      staging.renameSync(live.path);
      final tmp = File('${_pointer.path}.tmp')
        ..writeAsStringSync(jsonEncode({'version': version}), flush: true);
      tmp.renameSync(_pointer.path);
      // Old versions are no longer referenced.
      for (final dir in root.listSync().whereType<Directory>()) {
        final name = dir.uri.pathSegments.where((s) => s.isNotEmpty).last;
        if (name.startsWith('v') && name != 'v$version') {
          dir.deleteSync(recursive: true);
        }
      }
    } on Object {
      if (staging.existsSync()) staging.deleteSync(recursive: true);
      rethrow;
    }
  }
}

enum UpdateState {
  idle,
  checking,
  upToDate,
  available,
  updating,
  updated,
  appTooOld,
  failed,
}

/// What a check found.
class UpdateCheck {
  const UpdateCheck(this.state, {this.manifest, this.downloadBytes = 0});

  final UpdateState state;
  final ContentManifest? manifest;

  /// Approximate size of the update (lookup + words packs; clips are only
  /// known after the lookup is fetched).
  final int downloadBytes;
}

/// Checks the manifest and applies updates for Wortschatz's word ids.
class ContentUpdater {
  ContentUpdater({
    required this.fetcher,
    required this.store,
    required this.wordIds,
    this.seedClipHashes = const {},
    this.baseUrl = contentBaseUrl,
  });

  final ContentFetcher fetcher;
  final ContentStore store;
  final List<String> wordIds;

  /// Hashes of the bundled clips, so an update only fetches changed ones.
  final Map<String, String> seedClipHashes;
  final String baseUrl;

  Map<String, String> get _installedHashes =>
      store.version > seedContentVersion ? store.clipHashes : seedClipHashes;

  Uri _url(String path) => Uri.parse('$baseUrl/$path');

  /// Fetches /manifest.json ([etag] makes it a cheap 304 when unchanged).
  Future<(UpdateCheck, String?)> check({String? etag}) async {
    final r = await fetcher.get(_url('manifest.json'), etag: etag);
    if (r.status == 304) return (const UpdateCheck(UpdateState.upToDate), etag);
    if (r.status != 200) throw HttpException('manifest ${r.status}');
    final manifest = ContentManifest.fromJson(
      jsonDecode(utf8.decode(r.body)) as Map<String, dynamic>,
    );
    if (manifest.appTooOld) {
      return (UpdateCheck(UpdateState.appTooOld, manifest: manifest), r.etag);
    }
    if (!isNewerContent(manifest.contentVersion, store.version)) {
      return (UpdateCheck(UpdateState.upToDate, manifest: manifest), r.etag);
    }
    final bytes =
        manifest.lookup.bytes +
        manifest.words.values.fold<int>(0, (sum, f) => sum + f.bytes);
    return (
      UpdateCheck(
        UpdateState.available,
        manifest: manifest,
        downloadBytes: bytes,
      ),
      r.etag,
    );
  }

  Future<List<int>> _verified(RemoteFile file) async {
    final r = await fetcher.get(_url(file.url));
    if (r.status != 200) throw HttpException('${file.url} ${r.status}');
    if (!sha256Matches(r.body, file.sha256)) {
      throw StateError('sha256 mismatch for ${file.url}');
    }
    return r.body;
  }

  /// Downloads, verifies and installs [manifest]'s version. Throws on any
  /// failure, leaving the installed content untouched.
  Future<void> update(ContentManifest manifest) async {
    final lookup = jsonDecode(
      utf8.decode(await _verified(manifest.lookup)),
    ) as Map<String, dynamic>;
    final rows = <String, Map<String, dynamic>>{};
    for (final file in manifest.words.values) {
      final pack = jsonDecode(
        utf8.decode(await _verified(file)),
      ) as Map<String, dynamic>;
      for (final r in pack['words'] as List) {
        final row = r as Map<String, dynamic>;
        rows[row['id'] as String] = row;
      }
    }
    // Keep Wortschatz's own deck order (most frequent first).
    final words = [
      for (final id in wordIds)
        if (rows[id] case final row?) wordRowFromCdn(row),
    ];
    if (words.length < wordIds.length * 0.9) {
      throw StateError('update covers only ${words.length} words');
    }
    final clips = lookup['clips'] as Map<String, dynamic>;
    final installed = _installedHashes;
    final fetch = clipsToFetch(clips, wordIds, installed);
    final newClips = {
      for (final MapEntry(:key, :value) in fetch.entries)
        key: await _verified(value),
    };
    await store.install(
      version: manifest.contentVersion,
      words: words,
      newClips: newClips,
      clipHashes: {
        ...installed,
        for (final MapEntry(:key, :value) in fetch.entries) key: value.sha256,
      },
    );
  }
}
