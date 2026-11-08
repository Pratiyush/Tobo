/// Every ad setting lives here.
///
/// Build with `--dart-define=ADS_ENABLED=true` to turn ads on. Without it the
/// app runs [NoAdsService]: no SDK start, no consent form, no ATT prompt,
/// unlimited free hints, exactly as before ads existed.
library;

const adsEnabled = bool.fromEnvironment('ADS_ENABLED');

/// QA only: `--dart-define=ADS_TEST_UNITS=true` uses Google's test units in a
/// release build. Never set it for a store build.
const forceTestAdUnits = bool.fromEnvironment('ADS_TEST_UNITS');

/// QA only: `--dart-define=ADS_DEBUG_EEA=true` makes UMP treat the device as
/// being in the EEA, so the consent form shows on an emulator anywhere.
/// Emulators are test devices automatically. Never set it for a store build.
const debugConsentInEea = bool.fromEnvironment('ADS_DEBUG_EEA');

enum AdKind { banner, interstitial, rewarded }

/// Real ad unit ids from the AdMob account (pub-5964569110696877). Empty
/// until the hub supplies them. While empty, release builds request no ads,
/// and debug/profile builds use Google's test units.
const _units = {
  (android: true, kind: AdKind.banner): '',
  (android: true, kind: AdKind.interstitial): '',
  (android: true, kind: AdKind.rewarded): '',
  (android: false, kind: AdKind.banner): '',
  (android: false, kind: AdKind.interstitial): '',
  (android: false, kind: AdKind.rewarded): '',
};

/// Google's published test units (always safe to click).
const _testUnits = {
  (android: true, kind: AdKind.banner):
      'ca-app-pub-3940256099942544/9214589741',
  (android: true, kind: AdKind.interstitial):
      'ca-app-pub-3940256099942544/1033173712',
  (android: true, kind: AdKind.rewarded):
      'ca-app-pub-3940256099942544/5224354917',
  (android: false, kind: AdKind.banner):
      'ca-app-pub-3940256099942544/2435281174',
  (android: false, kind: AdKind.interstitial):
      'ca-app-pub-3940256099942544/4411468910',
  (android: false, kind: AdKind.rewarded):
      'ca-app-pub-3940256099942544/1712485313',
};

/// The unit to request, or null when none is configured for a release build.
String? adUnitFor(AdKind kind, {required bool android, required bool release}) {
  final real = _units[(android: android, kind: kind)]!;
  if (real.isNotEmpty && !forceTestAdUnits) return real;
  if (release && !forceTestAdUnits) return null;
  return _testUnits[(android: android, kind: kind)];
}
