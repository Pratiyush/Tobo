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

/// Wortschatz's AdMob ids (publisher pub-5964569110696877), from the hub's
/// German/docs/admob-ids.json, verified in the console 2026-11-08. They are
/// public: they ship inside the app. Used by RELEASE builds only.
abstract final class AdMobIds {
  /// Also set as the release `admobAppId` in android/app/build.gradle.kts.
  static const androidApp = 'ca-app-pub-5964569110696877~7110414739';

  static const android = {
    AdKind.banner: 'ca-app-pub-5964569110696877/2103685971', // banner_menu
    // interstitial_round; AdMob also caps it at 1 per user per 2 minutes.
    AdKind.interstitial: 'ca-app-pub-5964569110696877/7575504506',
    AdKind.rewarded: 'ca-app-pub-5964569110696877/9569057117', // rewarded_hint
  };

  /// No iOS AdMob app yet (created when the iOS build nears TestFlight).
  /// While this is empty, ads are a no-op on iOS, debug builds included.
  static const iosApp = '';

  static const ios = <AdKind, String>{};
}

/// Google's published test units (always safe to click). Debug and profile
/// builds use these, never the real ids.
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

/// Whether the platform has an AdMob app at all. Without one, ads stay a
/// no-op even when ADS_ENABLED is on.
bool platformHasAdMobApp({required bool android}) =>
    android ? AdMobIds.androidApp.isNotEmpty : AdMobIds.iosApp.isNotEmpty;

/// The unit to request, or null: release builds use the real ids, debug and
/// profile builds Google's test units ([forceTest] = ADS_TEST_UNITS QA flag
/// forces test units in release too). Null when the platform has no app.
String? adUnitFor(
  AdKind kind, {
  required bool android,
  required bool release,
  bool forceTest = forceTestAdUnits,
}) {
  if (!platformHasAdMobApp(android: android)) return null;
  if (!release || forceTest) return _testUnits[(android: android, kind: kind)];
  final real = (android ? AdMobIds.android : AdMobIds.ios)[kind];
  return real == null || real.isEmpty ? null : real;
}
