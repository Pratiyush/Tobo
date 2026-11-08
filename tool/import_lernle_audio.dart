// Copies Lernle's recorded pronunciations for the words in
// assets/words_de.json into assets/audio/de/, and writes the manifest the app
// trusts (assets/audio/de/manifest.json).
//
//   dart run tool/import_lernle_audio.dart ../lernle/app/assets/audio/de
//
// The source directory is only read, never written.
//
// Provenance (checked 2026-11-08): Lernle's word clips are ElevenLabs v3
// renders (lernle 9a2ba5e9, "all 6,071 words re-voiced with ElevenLabs v3",
// 2026-09-08), made after c5441297 replaced the reference app's recordings.
// None of the 676 clips is byte-identical to any file under
// lernle/harvest/extract/tobo/audio. Never import from that harvest folder,
// and never call the ElevenLabs API from this repo.
//
// Nouns are spoken with their article ("das Haus"), matching Word.display.
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';

void main(List<String> args) {
  if (args.length != 1) {
    stderr.writeln(
      'usage: dart run tool/import_lernle_audio.dart <lernle audio/de dir>',
    );
    exit(64);
  }
  final source = Directory(args.single);
  if (!source.existsSync()) {
    stderr.writeln('No such directory: ${source.path}');
    exit(66);
  }
  if (source.absolute.path.contains('/harvest/')) {
    stderr.writeln('Refusing to import harvested reference-app audio.');
    exit(65);
  }

  final ids = [
    for (final row
        in jsonDecode(File('assets/words_de.json').readAsStringSync()) as List)
      (row as Map<String, dynamic>)['id'] as String,
  ];
  final target = Directory('assets/audio/de');
  if (target.existsSync()) target.deleteSync(recursive: true);
  target.createSync(recursive: true);

  final copied = <String>[];
  final hashes = <String, String>{};
  final missing = <String>[];
  for (final id in ids) {
    final clip = File('${source.path}/$id.mp3');
    if (clip.existsSync()) {
      clip.copySync('${target.path}/$id.mp3');
      copied.add(id);
      hashes[id] = sha256.convert(clip.readAsBytesSync()).toString();
    } else {
      missing.add(id);
    }
  }

  File('${target.path}/manifest.json').writeAsStringSync(
    '${const JsonEncoder.withIndent('  ').convert({'lang': 'de', 'source': 'lernle app/assets/audio/de (ElevenLabs v3)', 'count': copied.length, 'ids': copied, 'sha256': hashes})}\n',
  );
  stdout.writeln(
    'Copied ${copied.length} of ${ids.length} clips to ${target.path}'
    '${missing.isEmpty ? '' : '; no clip for ${missing.length}: ${missing.join(', ')}'}',
  );
}
