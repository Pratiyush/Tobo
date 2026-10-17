import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/providers/preferences_provider.dart';
import 'package:german_words/providers/progress_provider.dart';
import 'package:german_words/providers/settings_provider.dart';
import 'package:german_words/providers/stats_provider.dart';
import 'package:german_words/providers/words_provider.dart';

import 'helpers.dart';

void main() {
  test('learning a word makes it due tomorrow', () async {
    final clock = TestClock();
    final c = await createContainer(clock: clock);
    final id = deck.first.id;

    c.read(progressProvider.notifier).learn(id);
    expect(c.read(learnedWordsProvider).map((w) => w.id), [id]);
    expect(c.read(dueWordsProvider), isEmpty);

    clock.now = clock.now.add(const Duration(days: 1));
    c.invalidate(dueWordsProvider);
    expect(c.read(dueWordsProvider).map((w) => w.id), [id]);
  });

  test('right answers climb levels; a wrong one drops to 1, due now', () async {
    final clock = TestClock();
    final c = await createContainer(clock: clock);
    final id = deck.first.id;
    final progress = c.read(progressProvider.notifier)..learn(id);

    progress.grade(id, correct: true);
    progress.grade(id, correct: true);
    expect(c.read(progressProvider)[id]!.level, 3);
    expect(
      c.read(progressProvider)[id]!.due,
      clock.now.add(const Duration(days: 4)),
    );

    progress.grade(id, correct: false);
    expect(c.read(progressProvider)[id]!.level, 1);
    expect(c.read(dueWordsProvider).map((w) => w.id), [id]);
  });

  test('grading never learns an unlearned word', () async {
    final c = await createContainer();
    c.read(progressProvider.notifier).grade(deck.first.id, correct: true);
    expect(c.read(progressProvider), isEmpty);
  });

  test('games only count as practice when the setting is on', () async {
    final c = await createContainer();
    final id = deck.first.id;
    c.read(progressProvider.notifier)
      ..learn(id)
      ..gradeFromGame(id, correct: true);
    expect(c.read(progressProvider)[id]!.level, 2);

    c.read(settingsProvider.notifier).setCountGamesAsPractice(false);
    c.read(progressProvider.notifier).gradeFromGame(id, correct: true);
    expect(c.read(progressProvider)[id]!.level, 2);
  });

  test('progress persists across launches', () async {
    final c = await createContainer();
    c.read(progressProvider.notifier).learn(deck[3].id);
    final saved = c.read(sharedPreferencesProvider).getString('word_progress')!;

    final next = await createContainer(prefs: {'word_progress': saved});
    expect(next.read(learnedWordsProvider).single.id, deck[3].id);
  });

  test('points build levels and streaks count consecutive days', () async {
    final clock = TestClock();
    final c = await createContainer(clock: clock);
    final stats = c.read(statsProvider.notifier);

    expect(c.read(statsProvider).level, 1);
    stats.addPoints(30);
    expect(c.read(statsProvider).level, 2);
    expect(c.read(currentStreakProvider), 1);

    stats.addPoints(5);
    expect(c.read(statsProvider).streak, 1, reason: 'same day');

    clock.now = clock.now.add(const Duration(days: 1));
    stats.addPoints(5);
    expect(c.read(statsProvider).streak, 2);

    clock.now = clock.now.add(const Duration(days: 3));
    c.invalidate(currentStreakProvider);
    expect(c.read(currentStreakProvider), 0, reason: 'missed days');
    stats.addPoints(5);
    expect(c.read(statsProvider).streak, 1);
  });

  test('the game pool works before anything is learned', () async {
    final c = await createContainer();
    final nouns = c.read(gamePoolProvider(true));
    expect(nouns.length, 40);
    expect(nouns.every((w) => w.isNoun), isTrue);

    final id = c.read(wordsProvider)[5].id;
    c.read(progressProvider.notifier).learn(id);
    expect(c.read(gamePoolProvider(false)).first.id, id);
  });
}
