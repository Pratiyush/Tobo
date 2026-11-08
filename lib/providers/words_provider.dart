import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/word_repository.dart';
import '../models/word.dart';
import 'settings_provider.dart';

/// The whole deck, most frequent first. Loaded from [wordsAsset] in `main()`
/// and injected with `overrideWithValue`.
final wordsProvider = Provider<List<Word>>(
  (ref) => throw UnimplementedError(
    'wordsProvider must be overridden in ProviderScope',
  ),
);

/// The words of the learner's chosen levels: A1 first, then A2, B1, B2;
/// most frequent first within a level. Word lists and all games draw from
/// it. Progress stays keyed by word id, so changing levels loses nothing.
final activeWordsProvider = Provider<List<Word>>((ref) {
  final choice = ref.watch(settingsProvider.select((s) => s.levels));
  final words = ref.watch(wordsProvider);
  return [
    for (final level in choice.active)
      for (final w in words)
        if (w.level == level) w,
  ];
});

final wordListsProvider = Provider<List<WordList>>(
  (ref) => chunkByLevel(ref.watch(activeWordsProvider)),
);

final wordsByIdProvider = Provider<Map<String, Word>>(
  (ref) => {for (final w in ref.watch(wordsProvider)) w.id: w},
);

/// Nouns only, for gender hints.
final nounsProvider = Provider<List<Word>>(
  (ref) => [
    for (final w in ref.watch(wordsProvider))
      if (w.isNoun) w,
  ],
);
