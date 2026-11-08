/// Pure ad rules from the placement map (docs/review-2026-11-08.md), kept
/// free of the SDK so they can be unit-tested.
library;

/// When an interstitial may show. One instance is shared by Hive, Der Die Das
/// and Fallee. It only fires when the player ends a round (Next round / Play
/// again / Done), never mid-round or on app open or exit.
class InterstitialPolicy {
  InterstitialPolicy({
    required this.firstSession,
    this.roundsBetween = 3,
    this.minGap = const Duration(minutes: 2),
    this.afterRewarded = const Duration(minutes: 1),
  });

  /// True on the very first launch: no interstitials at all.
  final bool firstSession;

  /// Finished rounds needed between two interstitials.
  final int roundsBetween;

  /// Minimum time between two interstitials.
  final Duration minGap;

  /// Quiet time after a rewarded ad the player chose to watch.
  final Duration afterRewarded;

  int _rounds = 0;
  DateTime? _lastShown;
  DateTime? _lastRewarded;

  /// Records a finished round; true if an interstitial may show now.
  bool roundFinished(DateTime now) {
    _rounds++;
    if (firstSession || _rounds < roundsBetween) return false;
    if (_lastShown != null && now.difference(_lastShown!) < minGap) {
      return false;
    }
    if (_lastRewarded != null &&
        now.difference(_lastRewarded!) < afterRewarded) {
      return false;
    }
    return true;
  }

  void interstitialShown(DateTime now) {
    _rounds = 0;
    _lastShown = now;
  }

  void rewardedShown(DateTime now) => _lastRewarded = now;
}

/// Free hints per Practice session or Hive board. With ads on, more come from
/// a rewarded ad the player chooses to watch, or free when no ad is available.
/// With ads off the quota is unlimited.
class HintQuota {
  HintQuota({required this.limited, this.free = 3});

  final bool limited;
  final int free;
  late int _left = free;

  /// Refill size for one rewarded ad.
  static const perReward = 3;

  bool get canHint => !limited || _left > 0;

  int get left => _left;

  /// Uses one hint; false when none are left.
  bool use() {
    if (!limited) return true;
    if (_left == 0) return false;
    _left--;
    return true;
  }

  void refill() => _left += perReward;
}
