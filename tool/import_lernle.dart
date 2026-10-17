// Regenerates assets/words_de.json from lernle's reviewed German deck.
//
//   dart run tool/import_lernle.dart ../../lernle/content/lemmas/de.jsonl
//
// Only `de.jsonl` (reviewed) is imported. `de_tobo.jsonl` is pending review
// and must not ship.
import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  if (args.length != 1) {
    stderr.writeln('usage: dart run tool/import_lernle.dart <de.jsonl>');
    exit(64);
  }
  final rows =
      File(args.single)
          .readAsLinesSync()
          .where((line) => line.trim().isNotEmpty)
          .map((line) => jsonDecode(line) as Map<String, dynamic>)
          // Bare articles ("der", "dem") are what the games teach, not words.
          .where((row) => row['pos'] != 'article')
          .toList()
        ..sort(
          (a, b) => (a['freq_rank'] as int).compareTo(b['freq_rank'] as int),
        );

  final words = [
    for (final row in rows)
      {
        'id': row['id'],
        'de': row['headword'],
        'pos': row['pos'],
        if (row['gender'] != null) 'gender': row['gender'],
        if (row['plural'] != null) 'plural': row['plural'],
        'en': row['en'],
        if (row['example_de'] != null) 'exDe': row['example_de'],
        if (row['example_en'] != null) 'exEn': row['example_en'],
        'cefr': row['cefr'],
      },
  ];
  const encoder = JsonEncoder.withIndent(null);
  File('assets/words_de.json')
      .writeAsStringSync('[\n${words.map(encoder.convert).join(',\n')}\n]\n');
  stdout.writeln('Wrote ${words.length} words to assets/words_de.json');
}
