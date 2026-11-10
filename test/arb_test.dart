// Every translation is complete and keeps what must not change: the same
// keys as English, no empty strings, the same placeholders, plural forms
// with an `other` branch, the brand and game names, the German learning
// content, emoji, and no stray invisible direction marks.
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

Map<String, dynamic> _read(File f) =>
    jsonDecode(f.readAsStringSync()) as Map<String, dynamic>;

/// Words that stay exactly as in English wherever English has them.
const _protected = [
  'Wortschatz',
  'Hive',
  'Der Die Das',
  'Fallee',
  'Pratiyush',
  'Perfekt!',
  'Blitzschnell!',
  'der',
  'die',
  'das',
  'A1',
  'B2',
  '❤️',
  '★',
];

final _bidi = RegExp('[\u200E\u200F\u202A-\u202E\u2066-\u2069]');

void main() {
  final dir = Directory('lib/l10n');
  final en = _read(File('${dir.path}/app_en.arb'));
  final keys = {
    for (final k in en.keys)
      if (!k.startsWith('@')) k,
  };
  final files = dir.listSync().whereType<File>().where(
    (f) => f.path.endsWith('.arb') && !f.path.endsWith('app_en.arb'),
  );

  test('the English template is complete', () {
    expect(keys.length, greaterThan(150));
    for (final k in keys) {
      expect(en['@$k'], isA<Map<String, dynamic>>(), reason: '$k note');
      expect((en['@$k'] as Map)['description'], isNotEmpty, reason: k);
    }
  });

  for (final file in files) {
    final name = file.uri.pathSegments.last;
    test('$name: complete and faithful', () {
      final arb = _read(file);
      expect(arb['@@locale'], isNotEmpty);
      final have = {
        for (final k in arb.keys)
          if (!k.startsWith('@')) k,
      };
      expect(keys.difference(have), isEmpty, reason: 'missing in $name');
      expect(have.difference(keys), isEmpty, reason: 'unknown in $name');
      for (final k in keys) {
        final source = en[k] as String;
        final text = arb[k] as String;
        expect(text.trim(), isNotEmpty, reason: '$name $k');
        final meta = en['@$k'] as Map<String, dynamic>;
        for (final p in (meta['placeholders'] as Map? ?? {}).keys) {
          expect(text, contains('{$p'), reason: '$name $k lost {$p}');
        }
        if (source.contains(', plural,')) {
          expect(text, contains('other{'), reason: '$name $k plural');
          // gen-l10n merges =1 and one into one branch and warns.
          expect(
            text.contains('=1{') && RegExp(r'\bone\{').hasMatch(text),
            isFalse,
            reason: '$name $k has both =1 and one',
          );
        }
        for (final word in _protected) {
          final inSource = RegExp(
            '(^|[^A-Za-z])${RegExp.escape(word)}([^A-Za-z]|\$)',
          ).hasMatch(source);
          // der/die/das only where English quotes them as German articles.
          if (!inSource) continue;
          if (const {'der', 'die', 'das'}.contains(word) &&
              !const {
                'dddTip',
                'rulePluralOnly',
                'learnPluralOnly',
                'spellingNounHint',
              }.contains(k)) {
            continue;
          }
          expect(text, contains(word), reason: '$name $k must keep "$word"');
        }
        expect(_bidi.hasMatch(text), isFalse, reason: '$name $k bidi mark');
      }
    });
  }
}
