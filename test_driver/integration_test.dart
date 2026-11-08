// Driver for `flutter drive`: saves takeScreenshot() images to
// build/screenshots/ (store listing screenshots from the E2E run).
import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() => integrationDriver(
  onScreenshot: (name, bytes, [args]) async {
    final file = File('build/screenshots/$name.png')
      ..createSync(recursive: true);
    file.writeAsBytesSync(bytes);
    return true;
  },
);
