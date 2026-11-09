import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Whether a download may run without asking (spec content-client.md §3:
/// never auto-download on mobile data). Tests use a fake.
abstract interface class NetworkInfo {
  /// True on Wi-Fi or Ethernet. Any doubt counts as mobile data.
  Future<bool> isUnmetered();
}

class ConnectivityNetworkInfo implements NetworkInfo {
  ConnectivityNetworkInfo([Connectivity? connectivity])
    : _connectivity = connectivity ?? Connectivity();

  final Connectivity _connectivity;

  @override
  Future<bool> isUnmetered() async {
    try {
      final types = await _connectivity.checkConnectivity();
      return types.contains(ConnectivityResult.wifi) ||
          types.contains(ConnectivityResult.ethernet);
    } on Object catch (error) {
      developer.log('network probe failed: $error', name: 'content');
      return false;
    }
  }
}

final networkInfoProvider = Provider<NetworkInfo>(
  (ref) => ConnectivityNetworkInfo(),
);
