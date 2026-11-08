import 'dart:developer' as developer;

import 'package:shared_preferences/shared_preferences.dart';

/// Uncaught errors, kept on the device only (nothing is uploaded). The
/// newest is offered in the "Contact support" mail so users can report it.
class ErrorLog {
  ErrorLog(this._prefs, {DateTime Function()? clock})
    : _clock = clock ?? DateTime.now;

  static const key = 'error_log';
  static const keep = 20;

  final SharedPreferences _prefs;
  final DateTime Function() _clock;

  List<String> get entries => _prefs.getStringList(key) ?? const [];

  String? get latest => entries.isEmpty ? null : entries.last;

  void record(Object error, StackTrace? stack) {
    final top = (stack?.toString() ?? '')
        .split('\n')
        .where((l) => l.trim().isNotEmpty)
        .take(4)
        .join('\n');
    final entry = '${_clock().toIso8601String()} $error\n$top';
    developer.log(entry, name: 'error');
    final all = [...entries, entry];
    _prefs.setStringList(
      key,
      all.length > keep ? all.sublist(all.length - keep) : all,
    );
  }
}
