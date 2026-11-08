import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/content/content_source.dart';
import 'package:german_words/providers/preferences_provider.dart';
import 'package:german_words/providers/progress_provider.dart';
import 'package:german_words/providers/settings_provider.dart';
import 'package:german_words/providers/speech_provider.dart';
import 'package:german_words/providers/stats_provider.dart';
import 'package:german_words/providers/words_provider.dart';

import 'package:german_words/services/error_log.dart';

import 'package:shared_preferences/shared_preferences.dart';

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

  test(
    'the speaker retries a failed voice check and never caches a no',
    () async {
      final engine = FakeSpeechEngine(available: false);
      final speaker = Speaker(engine, retryDelay: Duration.zero);

      expect(await speaker.say('der Tag'), isFalse);
      expect(engine.availabilityChecks, 2, reason: 'one retry');
      expect(engine.spoken, isEmpty);

      // The engine finishes binding, or the user installs a German voice.
      engine.available = true;
      expect(await speaker.say('der Tag'), isTrue);
      expect(engine.spoken, ['der Tag']);

      // A yes is cached.
      await speaker.say('die Zeit');
      expect(engine.availabilityChecks, 3);
    },
  );

  test('a word plays its recorded clip, not device TTS', () async {
    final tts = FakeSpeechEngine();
    final audio = FakeAudioEngine();
    final word = deck.firstWhere((w) => w.isNoun);
    final speaker = Speaker(tts, audio: audio, content: FakeContentSource());

    expect(await speaker.sayWord(word), isTrue);
    expect(audio.played, [AssetMedia('assets/audio/de/${word.id}.mp3')]);
    expect(tts.spoken, isEmpty);
  });

  test('a word without a clip falls back to TTS and is logged', () async {
    final tts = FakeSpeechEngine();
    final audio = FakeAudioEngine();
    final word = deck.first;
    final speaker = Speaker(
      tts,
      audio: audio,
      content: FakeContentSource(withoutClips: {word.id}),
      retryDelay: Duration.zero,
    );

    expect(await speaker.sayWord(word), isTrue);
    expect(audio.played, isEmpty);
    expect(tts.spoken, [word.display]);
    expect(speaker.clipMisses, {word.id});
  });

  test('the error log keeps the newest 20 errors on the device', () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final log = ErrorLog(prefs);
    for (var i = 0; i < 25; i++) {
      log.record(StateError('boom $i'), StackTrace.current);
    }
    expect(log.entries, hasLength(ErrorLog.keep));
    expect(log.latest, contains('boom 24'));
    expect(log.entries.first, contains('boom 5'));
  });
}
