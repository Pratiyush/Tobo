/// The languages the app UI is, or will be, translated into: one row each with
/// its flag and its name in itself. The picker in Settings offers the ones
/// that have an ARB file in this folder, so the list grows as translations
/// land; the rest of the table waits for its file.
library;

import 'dart:ui' show Locale;

import 'app_localizations.dart';

class Language {
  const Language(
    this.tag,
    this.flag,
    this.name,
    this.english, {
    this.arb,
    this.rtl = false,
  });

  /// BCP 47 tag, as the player's pick is stored: 'de', 'pt-BR', 'zh-Hant'.
  final String tag;

  /// An emoji flag. None carries religious text, and none is one that iOS
  /// hides in some regions. A language may share a flag with another when
  /// most of its speakers live in that country (Tamil and Hindi both use
  /// 🇮🇳); the native name tells them apart.
  final String flag;

  /// The language's name in itself ("Deutsch"), as the picker lists it.
  final String name;

  /// Its name in English, which the picker's search matches too.
  final String english;

  /// The locale of its ARB file, when that isn't [tag]. gen-l10n wants a
  /// plain-language file under any regional one, so Brazilian Portuguese is
  /// app_pt.arb (European: app_pt_PT.arb) and Simplified Chinese app_zh.arb
  /// (Traditional: app_zh_Hant.arb).
  final String? arb;

  /// Written right to left: the whole UI mirrors. German words keep their
  /// own direction.
  final bool rtl;

  /// The locale its strings load from (its ARB file's).
  Locale get locale => localeOf(arb ?? tag);

  /// Its ARB file name in lib/l10n.
  String get arbFile => 'app_${(arb ?? tag).replaceAll('-', '_')}.arb';

  /// Whether it has been translated (has an ARB file), so the picker offers it.
  /// True when [flag] is a script badge (Persian: no flag without religious
  /// text fits), drawn as a small label instead of an emoji.
  bool get flagIsBadge =>
      !flag.runes.every((r) => r >= 0x1F1E6 && r <= 0x1F1FF);

  bool get available => AppLocalizations.supportedLocales.contains(locale);

  /// Whether a search for [query] finds it: by its own name, its English name
  /// or its tag, ignoring case and accents.
  bool matches(String query) {
    final q = fold(query.trim());
    return q.isEmpty ||
        fold(name).contains(q) ||
        fold(english).contains(q) ||
        tag.toLowerCase().startsWith(q);
  }

  @override
  String toString() => tag;
}

/// The target set, in no particular order (the picker sorts by [name]).
const languages = <Language>[
  Language('en', '🇬🇧', 'English', 'English'),
  Language('de', '🇩🇪', 'Deutsch', 'German'),
  Language('fr', '🇫🇷', 'Français', 'French'),
  Language('es', '🇪🇸', 'Español', 'Spanish'),
  Language('it', '🇮🇹', 'Italiano', 'Italian'),
  Language(
    'pt-BR',
    '🇧🇷',
    'Português (Brasil)',
    'Portuguese (Brazil)',
    arb: 'pt',
  ),
  Language('pt-PT', '🇵🇹', 'Português (Portugal)', 'Portuguese (Portugal)'),
  Language('nl', '🇳🇱', 'Nederlands', 'Dutch'),
  Language('pl', '🇵🇱', 'Polski', 'Polish'),
  Language('tr', '🇹🇷', 'Türkçe', 'Turkish'),
  Language('ru', '🇷🇺', 'Русский', 'Russian'),
  Language('uk', '🇺🇦', 'Українська', 'Ukrainian'),
  Language('cs', '🇨🇿', 'Čeština', 'Czech'),
  Language('sk', '🇸🇰', 'Slovenčina', 'Slovak'),
  Language('sv', '🇸🇪', 'Svenska', 'Swedish'),
  Language('da', '🇩🇰', 'Dansk', 'Danish'),
  Language('nb', '🇳🇴', 'Norsk bokmål', 'Norwegian'),
  Language('fi', '🇫🇮', 'Suomi', 'Finnish'),
  Language('el', '🇬🇷', 'Ελληνικά', 'Greek'),
  Language('ro', '🇷🇴', 'Română', 'Romanian'),
  Language('hu', '🇭🇺', 'Magyar', 'Hungarian'),
  Language('hr', '🇭🇷', 'Hrvatski', 'Croatian'),
  Language('bg', '🇧🇬', 'Български', 'Bulgarian'),
  Language('he', '🇮🇱', 'עברית', 'Hebrew', rtl: true),
  Language('ar', '🇪🇬', 'العربية', 'Arabic', rtl: true),
  Language('fa', 'فا', 'فارسی', 'Persian', rtl: true),
  Language('ur', '🇵🇰', 'اردو', 'Urdu', rtl: true),
  Language('hi', '🇮🇳', 'हिन्दी', 'Hindi'),
  Language('bn', '🇧🇩', 'বাংলা', 'Bengali'),
  Language('ta', '🇮🇳', 'தமிழ்', 'Tamil'),
  Language('th', '🇹🇭', 'ไทย', 'Thai'),
  Language('vi', '🇻🇳', 'Tiếng Việt', 'Vietnamese'),
  Language('id', '🇮🇩', 'Bahasa Indonesia', 'Indonesian'),
  Language('ms', '🇲🇾', 'Bahasa Melayu', 'Malay'),
  Language('fil', '🇵🇭', 'Filipino', 'Filipino'),
  Language('ja', '🇯🇵', '日本語', 'Japanese'),
  Language('ko', '🇰🇷', '한국어', 'Korean'),
  Language('zh-Hans', '🇨🇳', '简体中文', 'Chinese (Simplified)', arb: 'zh'),
  Language('zh-Hant', '🇭🇰', '繁體中文', 'Chinese (Traditional)'),
  Language('sw', '🇰🇪', 'Kiswahili', 'Swahili'),
];

/// The translated languages, as the picker lists them: Latin-script names
/// alphabetically (accents ignored), then the other scripts, each together.
List<Language> get availableLanguages => [
  for (final l in languages)
    if (l.available) l,
]..sort((a, b) => fold(a.name).compareTo(fold(b.name)));

Language? languageForTag(String tag) {
  for (final l in languages) {
    if (l.tag == tag) return l;
  }
  return null;
}

/// The table's row for [locale], one we have an ARB file for.
Language? languageFor(Locale locale) {
  for (final l in languages) {
    if (l.locale == locale) return l;
  }
  return null;
}

/// 'pt-BR' -> pt_BR, 'zh-Hant' -> zh_Hant (also takes '_').
Locale localeOf(String tag) {
  final parts = tag.split(RegExp('[-_]'));
  String? script, country;
  for (final p in parts.skip(1)) {
    if (p.length == 4) {
      script = p[0].toUpperCase() + p.substring(1).toLowerCase();
    } else {
      country = p.toUpperCase();
    }
  }
  return Locale.fromSubtags(
    languageCode: parts.first.toLowerCase(),
    scriptCode: script,
    countryCode: country,
  );
}

/// The locale we have that best suits the device's [preferred] languages
/// (most preferred first): the whole locale, else its script or region, else
/// the plain language. English when we have none of them.
Locale resolveLocale(Iterable<Locale> preferred) {
  const supported = AppLocalizations.supportedLocales;
  Locale? find(bool Function(Locale s) test) {
    for (final s in supported) {
      if (test(s)) return s;
    }
    return null;
  }

  for (final raw in preferred) {
    final l = normalisedLocale(raw);
    final lang = l.languageCode;
    final found =
        find((s) => s == l) ??
        (l.scriptCode == null
            ? null
            : find(
                (s) =>
                    s.languageCode == lang &&
                    s.scriptCode == l.scriptCode &&
                    s.countryCode == null,
              )) ??
        (l.countryCode == null
            ? null
            : find(
                (s) =>
                    s.languageCode == lang &&
                    s.countryCode == l.countryCode &&
                    s.scriptCode == null,
              )) ??
        find(
          (s) =>
              s.languageCode == lang &&
              s.scriptCode == null &&
              s.countryCode == null,
        );
    if (found != null) return found;
  }
  return const Locale('en');
}

/// Device locales name some languages in ways the table doesn't: Norwegian
/// as 'no' (or Nynorsk 'nn'), Filipino as 'tl', and Chinese often without a
/// script (Taiwan, Hong Kong and Macau write Traditional).
Locale normalisedLocale(Locale l) {
  final lang = switch (l.languageCode) {
    'no' || 'nn' => 'nb',
    'tl' => 'fil',
    'iw' => 'he',
    'in' => 'id',
    final code => code,
  };
  var script = l.scriptCode;
  if (lang == 'zh' && script == null) {
    script = const {'TW', 'HK', 'MO'}.contains(l.countryCode) ? 'Hant' : 'Hans';
  }
  return Locale.fromSubtags(
    languageCode: lang,
    scriptCode: script,
    countryCode: l.countryCode,
  );
}

/// Lower case without accents, for sorting and search: "Čeština" -> "cestina".
String fold(String s) {
  final out = StringBuffer();
  for (final r in s.toLowerCase().runes) {
    final c = String.fromCharCode(r);
    out.write(_plain[c] ?? c);
  }
  return out.toString();
}

const _plain = {
  'á': 'a',
  'à': 'a',
  'â': 'a',
  'ã': 'a',
  'ä': 'a',
  'å': 'a',
  'ă': 'a',
  'ą': 'a',
  'ç': 'c',
  'č': 'c',
  'ć': 'c',
  'ď': 'd',
  'đ': 'd',
  'é': 'e',
  'è': 'e',
  'ê': 'e',
  'ë': 'e',
  'ě': 'e',
  'ę': 'e',
  'ế': 'e',
  'ệ': 'e',
  'í': 'i',
  'ì': 'i',
  'î': 'i',
  'ï': 'i',
  'ı': 'i',
  'ľ': 'l',
  'ł': 'l',
  'ñ': 'n',
  'ň': 'n',
  'ń': 'n',
  'ó': 'o',
  'ò': 'o',
  'ô': 'o',
  'õ': 'o',
  'ö': 'o',
  'ő': 'o',
  'ø': 'o',
  'ř': 'r',
  'š': 's',
  'ș': 's',
  'ş': 's',
  'ś': 's',
  'ť': 't',
  'ț': 't',
  'ú': 'u',
  'ù': 'u',
  'û': 'u',
  'ü': 'u',
  'ů': 'u',
  'ű': 'u',
  'ý': 'y',
  'ž': 'z',
  'ź': 'z',
  'ż': 'z',
  'ß': 'ss',
  'æ': 'ae',
};
