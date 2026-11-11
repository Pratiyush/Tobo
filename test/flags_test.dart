// The language picker's flags (game-localize rules, red-team 2026-11-11):
// no flag with religious text, none an OS hides by region, none politically
// loaded for the language's learners; a script badge where no flag fits.
import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/l10n/languages.dart';

void main() {
  test('no banned flags', () {
    final flags = {for (final l in languages) l.flag};
    expect(flags, isNot(contains('🇸🇦')), reason: 'Shahada on the flag');
    expect(flags, isNot(contains('🇮🇷')), reason: 'Takbir on the flag');
    expect(
      flags,
      isNot(contains('🇹🇼')),
      reason: 'hidden on CN-region iPhones',
    );
  });

  test('script badges where no flag fits', () {
    for (final (tag, badge) in [
      ('fa', 'فا'),
      ('zh-Hans', '简'),
      ('zh-Hant', '繁'),
      ('ru', 'Ру'),
    ]) {
      final language = languageForTag(tag)!;
      expect(language.flag, badge);
      expect(language.flagIsBadge, isTrue, reason: tag);
    }
    expect(languageForTag('de')!.flagIsBadge, isFalse);
  });

  test('every language has a flag or badge and a native name', () {
    for (final l in languages) {
      expect(l.flag, isNotEmpty, reason: l.tag);
      expect(l.name, isNotEmpty, reason: l.tag);
    }
  });
}
