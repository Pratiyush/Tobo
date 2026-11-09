import 'dart:convert';
import 'dart:io';

import 'dart:async';

import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:german_words/content/content_client.dart';
import 'package:german_words/providers/content_update_provider.dart';

import 'helpers.dart';

/// Serves a map of path -> bytes and records what was fetched.
class FakeFetcher implements ContentFetcher {
  FakeFetcher(this.files, {this.etag = '"e1"'});

  final Map<String, List<int>> files;
  final String etag;
  final fetched = <String>[];

  @override
  Future<FetchResult> get(Uri url, {String? etag}) async {
    final path = url.path.substring(1);
    fetched.add(path);
    if (etag != null && etag == this.etag && path == 'manifest.json') {
      return FetchResult(304, const [], etag);
    }
    final body = files[path];
    return body == null
        ? const FetchResult(404, [], null)
        : FetchResult(200, body, this.etag);
  }
}

String _hash(List<int> b) => sha256.convert(b).toString();

/// A tiny CDN: version [version], 3 words, word 0's clip changed upstream.
({FakeFetcher fetcher, List<String> ids, Map<String, String> seed}) _cdn({
  int version = 2,
  int minClient = 1,
  bool corruptClip = false,
}) {
  final words = deck.take(3).toList();
  final ids = [for (final w in words) w.id];
  final seed = {for (final id in ids) id: _hash(utf8.encode('seed-$id'))};
  final newClip = utf8.encode('new recording for ${ids.first}');
  final rows = [
    for (final w in words)
      {
        'id': w.id,
        'lemma': w.german,
        'pos': w.pos,
        'article': w.gender?.name,
        'plural': w.plural,
        'translations': {
          'en': [...w.english, if (w == words.first) 'corrected'],
        },
        'examples': [
          {'de': w.exampleDe, 'en': w.exampleEn},
        ],
        'cefr': w.cefr,
      },
  ];
  final pack = utf8.encode(jsonEncode({'level': 'A1', 'words': rows}));
  final lookup = utf8.encode(
    jsonEncode({
      'clips': {
        for (final id in ids)
          id: id == ids.first
              ? {
                  'url': 'files/new.mp3',
                  // A corrupt download: the bytes won't match this hash.
                  'sha256': corruptClip ? _hash([1, 2, 3]) : _hash(newClip),
                  'bytes': newClip.length,
                }
              : {'url': 'files/$id.mp3', 'sha256': seed[id], 'bytes': 1},
      },
    }),
  );
  final manifest = utf8.encode(
    jsonEncode({
      'content_version': version,
      'min_client': minClient,
      'lookup': {
        'url': 'lookup.json',
        'sha256': _hash(lookup),
        'bytes': lookup.length,
      },
      'levels': {
        'a1': {
          'words': {
            'url': 'words/a1.json',
            'sha256': _hash(pack),
            'bytes': pack.length,
          },
        },
      },
    }),
  );
  return (
    fetcher: FakeFetcher({
      'manifest.json': manifest,
      'lookup.json': lookup,
      'words/a1.json': pack,
      'files/new.mp3': newClip,
    }),
    ids: ids,
    seed: seed,
  );
}

void main() {
  late Directory tmp;
  setUp(() => tmp = Directory.systemTemp.createTempSync('content'));
  tearDown(() => tmp.deleteSync(recursive: true));

  ContentUpdater updater(
    ({FakeFetcher fetcher, List<String> ids, Map<String, String> seed}) cdn,
  ) => ContentUpdater(
    fetcher: cdn.fetcher,
    store: ContentStore(tmp),
    wordIds: cdn.ids,
    seedClipHashes: cdn.seed,
    baseUrl: 'https://cdn.test',
  );

  test('version compare and sha256 verify', () {
    expect(isNewerContent(2, 1), isTrue);
    expect(isNewerContent(1, 1), isFalse);
    expect(isNewerContent(1, 2), isFalse);
    final bytes = utf8.encode('Zeit');
    expect(sha256Matches(bytes, _hash(bytes)), isTrue);
    expect(sha256Matches(bytes, _hash(utf8.encode('Zeiten'))), isFalse);
  });

  test('CDN rows map onto word rows', () {
    final row = wordRowFromCdn({
      'id': 'de.zeit.n',
      'lemma': 'Zeit',
      'article': 'die',
      'plural': 'Zeiten',
      'pos': 'noun',
      'cefr': 'A1',
      'translations': {
        'en': ['time'],
      },
      'examples': [
        {'de': 'Ich habe keine Zeit.', 'en': 'I have no time.'},
      ],
    });
    expect(row, {
      'id': 'de.zeit.n',
      'de': 'Zeit',
      'pos': 'noun',
      'gender': 'die',
      'plural': 'Zeiten',
      'en': ['time'],
      'exDe': 'Ich habe keine Zeit.',
      'exEn': 'I have no time.',
      'cefr': 'A1',
    });
  });

  test('only clips whose hash changed are fetched', () {
    final clips = {
      'a': {'url': 'files/a.mp3', 'sha256': 'new', 'bytes': 1},
      'b': {'url': 'files/b.mp3', 'sha256': 'same', 'bytes': 1},
    };
    expect(
      clipsToFetch(clips, ['a', 'b', 'c'], {'a': 'old', 'b': 'same'}).keys,
      ['a'],
    );
  });

  test('check: 304, up to date, available, app too old', () async {
    final cdn = _cdn();
    final u = updater(cdn);
    final (first, etag) = await u.check();
    expect(first.state, UpdateState.available);
    expect(first.downloadBytes, greaterThan(0));
    final (second, _) = await u.check(etag: etag);
    expect(second.state, UpdateState.upToDate, reason: '304');

    final (same, _) = await updater(_cdn(version: 1)).check();
    expect(same.state, UpdateState.upToDate);
    final (old, _) = await updater(_cdn(minClient: 2)).check();
    expect(old.state, UpdateState.appTooOld);
  });

  test('update installs words and only the changed clip', () async {
    final cdn = _cdn();
    final u = updater(cdn);
    final (check, _) = await u.check();
    await u.update(check.manifest!);

    final store = ContentStore(tmp);
    expect(store.version, 2);
    expect(store.words, hasLength(3));
    expect((store.words!.first as Map)['en'], contains('corrected'));
    expect(cdn.fetcher.fetched.where((p) => p.startsWith('files/')), [
      'files/new.mp3',
    ]);
    expect(store.clipPath(cdn.ids.first), isNotNull);
    expect(store.clipPath(cdn.ids[1]), isNull, reason: 'bundled clip stays');
  });

  test('a bad hash rolls back: old content stays, no staging left', () async {
    final cdn = _cdn(corruptClip: true);
    final u = updater(cdn);
    final (check, _) = await u.check();
    await expectLater(u.update(check.manifest!), throwsStateError);

    final store = ContentStore(tmp);
    expect(store.version, seedContentVersion);
    expect(store.words, isNull);
    expect(tmp.listSync(), isEmpty);
  });

  test('v2 -> v3 swaps atomically and carries downloaded clips', () async {
    final v2 = _cdn();
    final (c2, _) = await updater(v2).check();
    await updater(v2).update(c2.manifest!);
    final first = v2.ids.first;
    final v2Clip = File(ContentStore(tmp).clipPath(first)!).readAsStringSync();

    // v3 changes nothing for word 0: its v2 clip must be carried over.
    final v3 = _cdn(version: 3);
    final lookup = jsonDecode(utf8.decode(v3.fetcher.files['lookup.json']!));
    final installed = ContentStore(tmp).clipHashes;
    (lookup['clips'] as Map)[first]['sha256'] = installed[first];
    v3.fetcher.files['lookup.json'] = utf8.encode(jsonEncode(lookup));
    final manifest = jsonDecode(
      utf8.decode(v3.fetcher.files['manifest.json']!),
    );
    manifest['lookup']['sha256'] = _hash(v3.fetcher.files['lookup.json']!);
    v3.fetcher.files['manifest.json'] = utf8.encode(jsonEncode(manifest));

    final u3 = ContentUpdater(
      fetcher: v3.fetcher,
      store: ContentStore(tmp),
      wordIds: v3.ids,
      seedClipHashes: v3.seed,
      baseUrl: 'https://cdn.test',
    );
    final (c3, _) = await u3.check();
    await u3.update(c3.manifest!);
    final store = ContentStore(tmp);
    expect(store.version, 3);
    expect(File(store.clipPath(first)!).readAsStringSync(), v2Clip);
    expect(Directory('${tmp.path}/v2').existsSync(), isFalse);
  });

  test('CONTENT_CDN_ENABLED defaults to off', () {
    expect(contentCdnEnabled, isFalse);
  });

  testWidgets('with the CDN client off: no store, no checks, no Settings row', (
    tester,
  ) async {
    final c = await createContainer();
    expect(c.read(contentStoreProvider), isNull);
    await c.read(contentUpdateProvider.notifier).checkDaily();
    expect(c.read(contentUpdateProvider).state, UpdateState.idle);
    await tester.pumpWidget(buildApp(c));
    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Word content'), findsNothing);
  });

  group('HttpContentFetcher on a flaky network (BUG-36)', () {
    MockClient flaky(List<Object> script, List<int> calls) =>
        MockClient((request) async {
          calls.add(1);
          final step = script[calls.length - 1];
          if (step is Exception) throw step;
          return http.Response('ok', step as int, headers: {'etag': '"e"'});
        });

    final url = Uri.parse('https://cdn.test/manifest.json');

    test('a dropped connection is retried, then succeeds', () async {
      final calls = <int>[];
      final f = HttpContentFetcher(
        client: flaky([http.ClientException('reset'), 200], calls),
        backoff: Duration.zero,
      );
      final r = await f.get(url);
      expect(r.status, 200);
      expect(calls, hasLength(2));
    });

    test('a stalled request times out and is retried', () async {
      final calls = <int>[];
      final f = HttpContentFetcher(
        client: MockClient((request) async {
          calls.add(1);
          if (calls.length == 1) await Completer<void>().future;
          return http.Response('ok', 200);
        }),
        timeout: const Duration(milliseconds: 20),
        backoff: Duration.zero,
      );
      expect((await f.get(url)).status, 200);
      expect(calls, hasLength(2));
    });

    test('a 503 from the edge is retried; a 404 or 500 is not', () async {
      final calls = <int>[];
      final f = HttpContentFetcher(
        client: flaky([503, 200], calls),
        backoff: Duration.zero,
      );
      expect((await f.get(url)).status, 200);
      for (final status in [404, 500]) {
        final once = <int>[];
        final g = HttpContentFetcher(
          client: flaky([status, 200], once),
          backoff: Duration.zero,
        );
        expect((await g.get(url)).status, status);
        expect(once, hasLength(1), reason: '$status is not transient');
      }
    });

    test('gives up after 3 attempts with the last error', () async {
      final calls = <int>[];
      final f = HttpContentFetcher(
        client: flaky(List.filled(5, http.ClientException('down')), calls),
        backoff: Duration.zero,
      );
      await expectLater(f.get(url), throwsA(isA<http.ClientException>()));
      expect(calls, hasLength(HttpContentFetcher.attempts));
      expect(HttpContentFetcher.attempts, 3);
    });

    test('a non-network error (bad data) is not retried', () async {
      final calls = <int>[];
      final f = HttpContentFetcher(
        client: flaky([const FormatException('bad'), 200], calls),
        backoff: Duration.zero,
      );
      await expectLater(f.get(url), throwsFormatException);
      expect(calls, hasLength(1));
    });
  });
}
