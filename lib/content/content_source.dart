import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/word_repository.dart';
import '../models/word.dart';

/// Recorded pronunciations, one `<word id>.mp3` each.
const audioDir = 'assets/audio/de';

/// The clips that exist. A clip missing from it falls back to device TTS.
const audioManifestAsset = '$audioDir/manifest.json';

/// A media file: a bundled asset today, a CDN URL once content moves to the
/// shared german-content repo.
sealed class MediaRef {
  const MediaRef();
}

final class AssetMedia extends MediaRef {
  const AssetMedia(this.path);

  /// Full asset key, e.g. `assets/audio/de/de.zeit.n.mp3`.
  final String path;

  @override
  bool operator ==(Object other) => other is AssetMedia && other.path == path;

  @override
  int get hashCode => path.hashCode;

  @override
  String toString() => 'AssetMedia($path)';
}

final class RemoteMedia extends MediaRef {
  const RemoteMedia(this.url);

  final Uri url;

  @override
  bool operator ==(Object other) => other is RemoteMedia && other.url == url;

  @override
  int get hashCode => url.hashCode;

  @override
  String toString() => 'RemoteMedia($url)';
}

/// Every word, clip and picture the app shows comes through here, keyed by
/// Lernle word id. Switching to the CDN means adding one implementation; no
/// screen or provider changes.
abstract interface class ContentSource {
  /// Loads the deck and the media indexes. Called once before `runApp`.
  Future<List<Word>> loadWords();

  /// The recorded pronunciation of [wordId], or null when there is none.
  MediaRef? audioFor(String wordId);

  /// A picture for [wordId], or null. Wortschatz shows no word pictures yet.
  MediaRef? imageFor(String wordId);
}

/// Content bundled in the app: [wordsAsset] plus the clips in [audioDir].
class BundledContentSource implements ContentSource {
  BundledContentSource([AssetBundle? bundle]) : _bundle = bundle ?? rootBundle;

  final AssetBundle _bundle;
  Set<String> _audioIds = const {};

  @override
  Future<List<Word>> loadWords() async {
    final (words, manifest) = await (
      _bundle.loadString(wordsAsset),
      _bundle.loadString(audioManifestAsset),
    ).wait;
    _audioIds = {
      for (final id
          in (jsonDecode(manifest) as Map<String, dynamic>)['ids'] as List)
        id as String,
    };
    return parseWords(words);
  }

  @override
  MediaRef? audioFor(String wordId) =>
      _audioIds.contains(wordId) ? AssetMedia('$audioDir/$wordId.mp3') : null;

  @override
  MediaRef? imageFor(String wordId) => null;
}

/// Injected in `main()` with `overrideWithValue`, like the word list.
final contentSourceProvider = Provider<ContentSource>(
  (ref) => throw UnimplementedError(
    'contentSourceProvider must be overridden in ProviderScope',
  ),
);
