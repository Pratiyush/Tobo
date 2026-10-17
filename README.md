# Wortschatz

A Flutter app (Android and iOS) for learning German vocabulary, in an arcade
style: blue background, white cards, orange buttons. No ads, no paywall, and
nothing is locked behind points.

## Features

- **Word lists** of 50 words, most frequent first, each with a progress ring.
- **Learn**: flashcards. The front shows *der/die/das* + word, the plural and a
  🔊 button; the back shows the meaning and an example sentence. You answer
  **Later** or **Know it**.
- **Practice**: spelling drill over the learned words that are due. You get an English
  clue and a keyboard of only the letters you need plus a few decoys. A small
  number on a key means that letter is available more than once. Nouns are
  spelled with their article. Hint and skip are available.
- **Games**
  - **Hive**: one honeycomb of letters per round. Swipe (or tap) across
    adjacent tiles to spell the German for each clue. Used letters disappear.
  - **Der Die Das**: pick the article with buttons in the German flag colours
    (der black, die red, das gold).
  - **Fallee**: a German word falls; tap its meaning before it lands.
- Points, level and daily streak. Learned words come back for practice on a
  simple Leitner schedule (1, 2, 4, 8, 16 days). The *Count games as practice*
  setting lets game answers count toward that schedule.
- Words are spoken with the device's German (`de-DE`) text-to-speech.

## Words

`assets/words_de.json` contains 676 words. They come from the reviewed deck in
[Pratiyush/lernle](https://github.com/Pratiyush/lernle) (`content/lemmas/de.jsonl`),
with bare articles removed. To refresh it:

```sh
dart run tool/import_lernle.dart ../lernle/content/lemmas/de.jsonl
```

Only import `de.jsonl`. `de_tobo.jsonl` is still pending review.

## Commands

```sh
flutter pub get
dart format lib test tool
flutter analyze
flutter test
flutter run
```

CI (`.github/workflows/build.yml`) runs analyze and test, then builds
`wortschatz.apk` and an unsigned `wortschatz-unsigned.ipa`. You can download
both from the workflow run.
