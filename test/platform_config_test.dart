// Store-facing platform files that no widget test touches.
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('iOS lists Google\'s full SKAdNetwork set, unique and well formed', () {
    // Source: developers.google.com/admob/ios/3p-skadnetworks (fetched
    // 2026-11-09). Without the third-party ids, ads served by AdMob's
    // mediated buyers can't be attributed and fill drops on iOS 14+.
    final plist = File('ios/Runner/Info.plist').readAsStringSync();
    final ids = RegExp(
      r'<key>SKAdNetworkIdentifier</key>\s*<string>([^<]+)</string>',
    ).allMatches(plist).map((m) => m.group(1)!).toList();
    expect(ids.first, 'cstr6suwn9.skadnetwork', reason: "Google's own first");
    expect(ids.length, greaterThanOrEqualTo(50));
    expect(ids.toSet().length, ids.length, reason: 'no duplicates');
    for (final id in ids) {
      expect(id, matches(RegExp(r'^[a-z0-9]{10}\.skadnetwork$')));
    }
  });
}
