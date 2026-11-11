// Every screen in the UI languages whose scripts the host test can't measure
// (Arabic, Persian, Urdu, Hebrew, Hindi, Bengali, Tamil, Thai, Japanese,
// Korean, Chinese) on a real device, with the phone's own fonts: no overflow,
// no UI text cut off or broken mid-word, RTL laid out right to left. Latin,
// Greek and Cyrillic are measured with real Roboto on the host
// (test/all_locales_harness.dart).
//
// Opt-in, because it is slow (~80 s per language on an emulator; all 40
// took 55 min) and CI's E2E jobs run every file in integration_test/:
//   flutter test integration_test/locales_e2e_test.dart -d <device> \
//     --dart-define=LOCALES_E2E=true [--dart-define=LOCALES=ta,ar | =all]
import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/l10n/l10n_ext.dart';
import 'package:integration_test/integration_test.dart';

import '../test/all_locales_harness.dart';

const _run = bool.fromEnvironment('LOCALES_E2E');
const _locales = String.fromEnvironment('LOCALES');

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  if (!_run) {
    test(
      'locales on a device (opt-in: --dart-define=LOCALES_E2E=true)',
      () {},
      skip: 'slow device-only check; see the header of this file',
    );
    return;
  }
  final Set<String>? only = switch (_locales) {
    'all' => null,
    '' => {
      for (final l in AppLocalizations.supportedLocales)
        if (squareGlyphScripts.contains(l.languageCode)) l.toString(),
    },
    final list => list.split(',').toSet(),
  };
  runLocaleFitTests(shard: 0, shards: 1, realFonts: true, only: only);
}
