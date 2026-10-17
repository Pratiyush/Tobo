import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/word_repository.dart';
import '../models/word.dart';

/// The whole deck, most frequent first. Loaded from [wordsAsset] in `main()`
/// and injected with `overrideWithValue`.
final wordsProvider = Provider<List<Word>>(
  (ref) => throw UnimplementedError(
    'wordsProvider must be overridden in ProviderScope',
  ),
);

final wordListsProvider = Provider<List<WordList>>(
  (ref) => chunkIntoLists(ref.watch(wordsProvider)),
);

final wordsByIdProvider = Provider<Map<String, Word>>(
  (ref) => {for (final w in ref.watch(wordsProvider)) w.id: w},
);
