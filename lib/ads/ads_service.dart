import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io' show Platform;

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../providers/preferences_provider.dart';
import 'ad_policy.dart';
import 'ads_config.dart';

/// Result of offering a rewarded ad.
enum RewardResult {
  /// Watched to the end: grant the extra.
  earned,

  /// Closed early: no extra.
  skipped,

  /// No ad could be shown: grant the extra anyway (no paywall).
  unavailable;

  bool get grant => this != skipped;
}

/// Everything the app does with ads. Screens never touch the SDK.
abstract class AdsService {
  /// False when built without ADS_ENABLED: no quotas, no ad UI at all.
  bool get enabled;

  /// True once consent allows requests and the SDK has started.
  ValueListenable<bool> get ready;

  /// True when UMP says Settings must offer "Privacy & ad choices".
  ValueListenable<bool> get privacyOptionsRequired;

  /// UMP consent, then ATT on iOS, then SDK start. Safe to call repeatedly.
  Future<void> start();

  Future<void> showPrivacyOptions();

  /// The banner unit to request, or null.
  String? get bannerUnit;

  /// Offers a rewarded ad the player asked for.
  Future<RewardResult> showRewarded();

  /// Call when the player ends a game round; may show an interstitial
  /// (capped by [InterstitialPolicy]) before returning.
  Future<void> roundFinished();
}

/// Ads compiled out (the default), and the fake for widget tests.
class NoAdsService implements AdsService {
  @override
  bool get enabled => false;

  @override
  final ValueListenable<bool> ready = ValueNotifier(false);

  @override
  final ValueListenable<bool> privacyOptionsRequired = ValueNotifier(false);

  @override
  Future<void> start() async {}

  @override
  Future<void> showPrivacyOptions() async {}

  @override
  String? get bannerUnit => null;

  @override
  Future<RewardResult> showRewarded() async => RewardResult.unavailable;

  @override
  Future<void> roundFinished() async {}
}

class GoogleAdsService implements AdsService {
  GoogleAdsService({required this.policy, required this.clock});

  final InterstitialPolicy policy;
  final DateTime Function() clock;

  static bool get _android => Platform.isAndroid;

  final _ready = ValueNotifier(false);
  final _privacy = ValueNotifier(false);
  Future<void>? _starting;
  InterstitialAd? _interstitial;
  RewardedAd? _rewarded;

  @override
  bool get enabled => true;

  @override
  ValueListenable<bool> get ready => _ready;

  @override
  ValueListenable<bool> get privacyOptionsRequired => _privacy;

  String? _unit(AdKind kind) =>
      adUnitFor(kind, android: _android, release: kReleaseMode);

  @override
  String? get bannerUnit => _unit(AdKind.banner);

  @override
  Future<void> start() => _starting ??= _start();

  Future<void> _start() async {
    final consent = ConsentInformation.instance;
    final updated = Completer<void>();
    consent.requestConsentInfoUpdate(
      ConsentRequestParameters(
        consentDebugSettings: debugConsentInEea
            ? ConsentDebugSettings(
                debugGeography: DebugGeography.debugGeographyEea,
              )
            : null,
      ),
      updated.complete,
      (error) {
        _log('consent update failed: ${error.message}');
        updated.complete();
      },
    );
    await updated.future;

    final dismissed = Completer<void>();
    await ConsentForm.loadAndShowConsentFormIfRequired((error) {
      if (error != null) _log('consent form: ${error.message}');
      dismissed.complete();
    });
    await dismissed.future;
    _privacy.value =
        await consent.getPrivacyOptionsRequirementStatus() ==
        PrivacyOptionsRequirementStatus.required;

    // ATT after UMP, as Google recommends; only asks once.
    if (Platform.isIOS &&
        await AppTrackingTransparency.trackingAuthorizationStatus ==
            TrackingStatus.notDetermined) {
      await AppTrackingTransparency.requestTrackingAuthorization();
    }

    if (!await consent.canRequestAds()) {
      _log('consent does not allow ad requests');
      return;
    }
    await MobileAds.instance.initialize();
    _ready.value = true;
    _loadInterstitial();
    _loadRewarded();
  }

  @override
  Future<void> showPrivacyOptions() async {
    final done = Completer<void>();
    await ConsentForm.showPrivacyOptionsForm((error) {
      if (error != null) _log('privacy options: ${error.message}');
      done.complete();
    });
    await done.future;
    // Consent may have changed either way.
    if (!_ready.value && await ConsentInformation.instance.canRequestAds()) {
      _starting = null;
      await start();
    }
  }

  void _loadInterstitial() {
    final unit = _unit(AdKind.interstitial);
    if (unit == null || !_ready.value) return;
    InterstitialAd.load(
      adUnitId: unit,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitial = ad,
        onAdFailedToLoad: (error) => _log('interstitial: ${error.message}'),
      ),
    );
  }

  void _loadRewarded() {
    final unit = _unit(AdKind.rewarded);
    if (unit == null || !_ready.value) return;
    RewardedAd.load(
      adUnitId: unit,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) => _rewarded = ad,
        onAdFailedToLoad: (error) => _log('rewarded: ${error.message}'),
      ),
    );
  }

  @override
  Future<RewardResult> showRewarded() async {
    final ad = _rewarded;
    if (ad == null) {
      _loadRewarded();
      return RewardResult.unavailable;
    }
    _rewarded = null;
    var earned = false;
    final closed = Completer<void>();
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        closed.complete();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        _log('rewarded show: ${error.message}');
        ad.dispose();
        closed.complete();
      },
    );
    await ad.show(onUserEarnedReward: (_, _) => earned = true);
    await closed.future;
    policy.rewardedShown(clock());
    _loadRewarded();
    return earned ? RewardResult.earned : RewardResult.skipped;
  }

  @override
  Future<void> roundFinished() async {
    if (!policy.roundFinished(clock())) return;
    final ad = _interstitial;
    if (ad == null) {
      _loadInterstitial();
      return;
    }
    _interstitial = null;
    final closed = Completer<void>();
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        closed.complete();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        closed.complete();
      },
    );
    await ad.show();
    await closed.future;
    policy.interstitialShown(clock());
    _loadInterstitial();
  }

  void _log(String message) => developer.log(message, name: 'ads');
}

/// Cold starts so far, counted in `main()`. The first one is the "first
/// session": no interstitials.
const launchCountKey = 'app_launches';

final adsServiceProvider = Provider<AdsService>((ref) {
  if (!adsEnabled) return NoAdsService();
  final launches =
      ref.watch(sharedPreferencesProvider).getInt(launchCountKey) ?? 1;
  return GoogleAdsService(
    policy: InterstitialPolicy(firstSession: launches <= 1),
    clock: ref.watch(clockProvider),
  );
});

/// Standard banner for menus and lists only (placement map). It takes no
/// space until an ad has loaded.
class AdBanner extends ConsumerStatefulWidget {
  const AdBanner({super.key});

  @override
  ConsumerState<AdBanner> createState() => _AdBannerState();
}

class _AdBannerState extends ConsumerState<AdBanner> {
  BannerAd? _ad;
  bool _loaded = false;
  int? _width;

  @override
  void dispose() {
    _ad?.dispose();
    super.dispose();
  }

  Future<void> _load(int width) async {
    final ads = ref.read(adsServiceProvider);
    final unit = ads.bannerUnit;
    if (unit == null || width == _width) return;
    _width = width;
    // Standard 320x50, not the "large adaptive" size (137 dp on a Pixel 7,
    // 15% of the screen): this is a learning app's menu. To trade calm for
    // eCPM, use AdSize.getLargeAnchoredAdaptiveBannerAdSize(width).
    const size = AdSize.banner;
    if (!mounted) return;
    await _ad?.dispose();
    _ad = BannerAd(
      adUnitId: unit,
      size: size,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          if (mounted) setState(() => _loaded = true);
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          if (mounted) setState(() => _loaded = false);
        },
      ),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    final ads = ref.watch(adsServiceProvider);
    if (!ads.enabled) return const SizedBox.shrink();
    return ValueListenableBuilder<bool>(
      valueListenable: ads.ready,
      builder: (context, ready, _) {
        if (!ready) return const SizedBox.shrink();
        return LayoutBuilder(
          builder: (context, constraints) {
            _load(constraints.maxWidth.truncate());
            final ad = _ad;
            if (!_loaded || ad == null) return const SizedBox.shrink();
            return Container(
              // A full-width white strip, keeping the ad clear of the tap
              // targets above and below it.
              width: double.infinity,
              color: Colors.white,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                width: ad.size.width.toDouble(),
                height: ad.size.height.toDouble(),
                child: AdWidget(ad: ad),
              ),
            );
          },
        );
      },
    );
  }
}
