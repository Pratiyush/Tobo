import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/word.dart';
import 'preferences_provider.dart';
import 'settings_provider.dart';
import 'words_provider.dart';

const _progressKey = 'word_progress';

/// Highest mastery level; shown as full signal bars.
const maxLevel = 5;

/// Days until a word at each level is due again (index = level).
const _intervals = [0, 1, 2, 4, 8, 16];

/// How well a learned word is known, and when to practise it next.
class WordProgress {
  const WordProgress({required this.level, required this.due});

  factory WordProgress.fromJson(Map<String, dynamic> json) => WordProgress(
    level: json['l'] as int,
    due: DateTime.fromMillisecondsSinceEpoch(json['d'] as int),
  );

  /// 1 (just learned) to [maxLevel].
  final int level;
  final DateTime due;

  Map<String, Object> toJson() => {'l': level, 'd': due.millisecondsSinceEpoch};
}

/// Progress of every learned word, keyed by word id and persisted.
class ProgressNotifier extends Notifier<Map<String, WordProgress>> {
  @override
  Map<String, WordProgress> build() {
    final raw = ref.watch(sharedPreferencesProvider).getString(_progressKey);
    if (raw == null) return const {};
    final json = jsonDecode(raw) as Map<String, dynamic>;
    return {
      for (final e in json.entries)
        e.key: WordProgress.fromJson(e.value as Map<String, dynamic>),
    };
  }

  DateTime get _now => ref.read(clockProvider)();

  /// "Know it" on a flashcard: the word joins the practice queue tomorrow.
  void learn(String id) {
    if (state.containsKey(id)) return;
    _put(id, 1);
  }

  /// Records a practice answer for a learned word. Unlearned words are left
  /// alone, so games never mark a word as learned behind your back.
  void grade(String id, {required bool correct}) {
    final current = state[id];
    if (current == null) return;
    _put(id, correct ? (current.level + 1).clamp(1, maxLevel) : 1);
  }

  /// A game answer; only counts when "Count games as practice" is on.
  void gradeFromGame(String id, {required bool correct}) {
    if (ref.read(settingsProvider).countGamesAsPractice) {
      grade(id, correct: correct);
    }
  }

  void reset() {
    state = const {};
    ref.read(sharedPreferencesProvider).remove(_progressKey);
  }

  void _put(String id, int level) {
    final due = level == 1 && state[id] != null
        ? _now
        : _now.add(Duration(days: _intervals[level]));
    state = {...state, id: WordProgress(level: level, due: due)};
    ref
        .read(sharedPreferencesProvider)
        .setString(
          _progressKey,
          jsonEncode({for (final e in state.entries) e.key: e.value.toJson()}),
        );
  }
}

final progressProvider =
    NotifierProvider<ProgressNotifier, Map<String, WordProgress>>(
      ProgressNotifier.new,
    );

/// Learned words in deck order.
final learnedWordsProvider = Provider<List<Word>>((ref) {
  final progress = ref.watch(progressProvider);
  return ref
      .watch(wordsProvider)
      .where((w) => progress.containsKey(w.id))
      .toList();
});

/// Learned words due for practice, most overdue first.
final dueWordsProvider = Provider<List<Word>>((ref) {
  final progress = ref.watch(progressProvider);
  final now = ref.watch(clockProvider)();
  return ref
      .watch(learnedWordsProvider)
      .where((w) => !progress[w.id]!.due.isAfter(now))
      .toList()
    ..sort((a, b) => progress[a.id]!.due.compareTo(progress[b.id]!.due));
});

/// Words the games draw from: learned words, weakest first, then the most
/// frequent unlearned words so the games work from day one.
final gamePoolProvider = Provider.family<List<Word>, bool>((ref, nounsOnly) {
  final progress = ref.watch(progressProvider);
  final words = ref
      .watch(wordsProvider)
      .where((w) => !nounsOnly || w.isNoun)
      .toList();
  final learned = words.where((w) => progress.containsKey(w.id)).toList()
    ..sort((a, b) => progress[a.id]!.level.compareTo(progress[b.id]!.level));
  final fresh = words.where((w) => !progress.containsKey(w.id));
  return [...learned, ...fresh.take(learned.length < 40 ? 40 : 10)];
});
