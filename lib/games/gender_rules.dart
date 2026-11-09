import '../models/word.dart';

/// Textbook suffix patterns. Several have exceptions (der Baum, das Ei), so
/// hints say "most" and are only shown when the noun's real article agrees.
const _suffixRules = <(String, Gender)>[
  ('ung', Gender.die),
  ('heit', Gender.die),
  ('keit', Gender.die),
  ('schaft', Gender.die),
  ('ion', Gender.die),
  ('tät', Gender.die),
  ('ik', Gender.die),
  ('enz', Gender.die),
  ('anz', Gender.die),
  ('ei', Gender.die),
  ('chen', Gender.das),
  ('lein', Gender.das),
  ('ment', Gender.das),
  ('um', Gender.das),
  ('ling', Gender.der),
  ('ismus', Gender.der),
  ('ist', Gender.der),
  ('ig', Gender.der),
];

/// Why [word] takes its article, when a reliable pattern explains it, or null.
///
/// Compounds take the article of their last part ("die Kaltmiete" from "die
/// Miete"), looked up among [nouns]. A hint is only returned when it agrees
/// with the word's real article, so it can never teach a wrong one; e.g.
/// "die Antwort" gets none although it ends in "Wort".
String? genderHint(Word word, Iterable<Word> nouns) {
  final gender = word.gender;
  if (gender == null) return null;
  if (word.isPluralOnly) {
    return 'Plural-only noun: plurals always take die.';
  }
  final lower = word.german.toLowerCase();

  Word? head;
  for (final other in nouns) {
    final part = other.german.toLowerCase();
    if (other.id == word.id || other.gender == null || part.length < 3) {
      continue;
    }
    if (lower.length - part.length >= 3 &&
        lower.endsWith(part) &&
        (head == null || part.length > head.german.length)) {
      head = other;
    }
  }
  if (head != null) {
    return head.gender == gender
        ? 'Compound words take the article of their last part: '
              '${head.display}.'
        : null;
  }

  for (final (suffix, ruleGender) in _suffixRules) {
    if (lower.length > suffix.length + 1 && lower.endsWith(suffix)) {
      return ruleGender == gender
          ? 'Most nouns ending in -$suffix take ${gender.name}.'
          : null;
    }
  }
  return null;
}
