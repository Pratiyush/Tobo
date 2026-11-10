/// The platforms know every UI language: iOS through CFBundleLocalizations
/// in Info.plist (the App Store's Languages line), Android 13+ through
/// res/xml/locales_config.xml (the per-app language setting). Device locales
/// resolve to the right translation, including the legacy and regional
/// spellings phones use.
library;

import 'dart:io';
import 'dart:ui' show Locale;

import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/l10n/languages.dart';

/// Android's per-app list writes Hebrew and Indonesian with legacy codes.
const _androidLegacy = {'he': 'iw', 'id': 'in'};

List<String> _strings(String source, RegExp pattern) => [
  for (final m in pattern.allMatches(source)) m.group(1)!,
];

void main() {
  final tags = [for (final l in languages) l.tag];

  test('Info.plist lists every UI language once', () {
    final plist = File('ios/Runner/Info.plist').readAsStringSync();
    final array = RegExp(
      r'<key>CFBundleLocalizations</key>\s*<array>(.*?)</array>',
      dotAll: true,
    ).firstMatch(plist);
    expect(array, isNotNull);
    final apple = _strings(
      array!.group(1)!,
      RegExp(r'<string>([^<]*)</string>'),
    );
    expect(apple.toSet().length, apple.length);
    expect(apple.toSet(), tags.toSet());
  });

  test('locales_config.xml lists every UI language once', () {
    final xml = File('android/app/src/main/res/xml/locales_config.xml')
        .readAsStringSync();
    final android = _strings(xml, RegExp(r'<locale\s+android:name="([^"]+)"'));
    expect(android.toSet().length, android.length);
    expect(android.toSet(), {for (final t in tags) _androidLegacy[t] ?? t});
    expect(
      File('android/app/src/main/AndroidManifest.xml').readAsStringSync(),
      contains('android:localeConfig="@xml/locales_config"'),
    );
  });

  group('device locale resolves to a translation', () {
    Locale l(String lang, [String? script, String? country]) =>
        Locale.fromSubtags(
          languageCode: lang,
          scriptCode: script,
          countryCode: country,
        );
    final cases = {
      l('de', null, 'AT'): 'de',
      l('pt', null, 'PT'): 'pt-PT',
      l('pt', null, 'BR'): 'pt-BR',
      l('pt'): 'pt-BR',
      l('no'): 'nb',
      l('nn', null, 'NO'): 'nb',
      l('tl', null, 'PH'): 'fil',
      l('zh', null, 'TW'): 'zh-Hant',
      l('zh', null, 'HK'): 'zh-Hant',
      l('zh', null, 'CN'): 'zh-Hans',
      l('zh', 'Hant'): 'zh-Hant',
      l('xx'): 'en',
    };
    for (final MapEntry(key: device, value: tag) in cases.entries) {
      test('$device → $tag', () {
        final expected = languageForTag(tag)!;
        // Until a language is translated it falls back to English.
        final want = expected.available ? expected.locale : const Locale('en');
        expect(resolveLocale([device]), want);
      });
    }
  });
}
