// BUG-40: Dart's toUpperCase ignores the language: Turkish "Pratik" became
// "PRATIK" (must be "PRATİK") and Greek capitals kept their accents
// ("ΜΆΘΕ", must be "ΜΑΘΕ").
import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/l10n/l10n_ext.dart';

void main() {
  test('Turkish and Azerbaijani dotted and dotless i', () {
    expect(upperFor('Pratik', 'tr'), 'PRATİK');
    expect(upperFor('Öğren ılık', 'tr'), 'ÖĞREN ILIK');
    expect(upperFor('iş', 'az'), 'İŞ');
  });

  test('Greek capitals drop the accents', () {
    expect(upperFor('Μάθε', 'el'), 'ΜΑΘΕ');
    expect(upperFor('Εξάσκηση', 'el'), 'ΕΞΑΣΚΗΣΗ');
    expect(upperFor('ΐ ΰ ώ ή', 'el'), 'Ϊ Ϋ Ω Η');
  });

  test('other languages upper-case as usual', () {
    expect(upperFor('Learn', 'en'), 'LEARN');
    expect(upperFor('Üben', 'de'), 'ÜBEN');
    expect(upperFor('Pratik', 'fr'), 'PRATIK');
    expect(upperFor('学习', 'zh'), '学习');
  });

  test('a locale name with a region or script still counts', () {
    expect(upperFor('Pratik', 'tr_TR'), 'PRATİK');
    expect(upperFor('Μάθε', 'el_GR'), 'ΜΑΘΕ');
  });
}
