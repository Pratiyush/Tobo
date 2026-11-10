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
GenderHint? genderHint(Word word, Iterable<Word> nouns) {
  final gender = word.gender;
  if (gender == null) return null;
  if (word.isPluralOnly) {
    return const PluralOnlyHint();
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
    return head.gender == gender ? CompoundHint(head.display) : null;
  }

  for (final (suffix, ruleGender) in _suffixRules) {
    if (lower.length > suffix.length + 1 && lower.endsWith(suffix)) {
      return ruleGender == gender ? SuffixHint(suffix, gender.name) : null;
    }
  }
  return null;
}

/// Why a noun takes its article; rendered in the UI language by
/// genderHintText (lib/l10n/l10n_ext.dart).
sealed class GenderHint {
  const GenderHint();
}

/// Plural-only nouns always take die.
class PluralOnlyHint extends GenderHint {
  const PluralOnlyHint();
}

/// A compound takes its last part's article; [head] is e.g. "die Miete".
class CompoundHint extends GenderHint {
  const CompoundHint(this.head);
  final String head;
}

/// Most nouns ending in -[suffix] take [article] (der, die or das).
class SuffixHint extends GenderHint {
  const SuffixHint(this.suffix, this.article);
  final String suffix;
  final String article;
}
