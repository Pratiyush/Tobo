import 'level.dart';

/// German grammatical gender, named after its definite article.
enum Gender { der, die, das }

/// One German word with its English meanings, from lernle's reviewed deck.
class Word {
  const Word({
    required this.id,
    required this.german,
    required this.pos,
    required this.english,
    this.gender,
    this.plural,
    this.exampleDe,
    this.exampleEn,
    this.cefr = 'A1',
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    final gender = json['gender'] as String?;
    final plural = json['plural'] as String?;
    return Word(
      id: json['id'] as String,
      german: json['de'] as String,
      pos: json['pos'] as String,
      english: [for (final e in json['en'] as List) e as String],
      gender: gender == null ? null : Gender.values.byName(gender),
      plural: plural == null || plural.isEmpty ? null : plural,
      exampleDe: json['exDe'] as String?,
      exampleEn: json['exEn'] as String?,
      cefr: json['cefr'] as String? ?? 'A1',
    );
  }

  /// Stable lernle id such as `de.zeit.n`. Progress is stored under it.
  final String id;
  final String german;

  /// Part of speech: noun, verb, adjective, ...
  final String pos;
  final List<String> english;
  final Gender? gender;
  final String? plural;
  final String? exampleDe;
  final String? exampleEn;
  final String cefr;

  bool get isNoun => gender != null;

  Level get level => Level.of(cefr);

  /// The word as learners should say it: nouns carry their article.
  String get display => gender == null ? german : '${gender!.name} $german';

  String get meaning => english.first;

  /// A noun that exists only in the plural (die Leute, die Eltern, die
  /// Ferien): the deck stores it as "die" with plural = singular. Feminine
  /// nouns never have an unchanged plural, so this marks exactly those.
  bool get isPluralOnly => gender == Gender.die && plural == german;

  /// German plurals always take "die". Null for plural-only nouns, whose
  /// "plural" would just repeat the word.
  String? get pluralDisplay =>
      plural == null || isPluralOnly ? null : 'die $plural';
}
