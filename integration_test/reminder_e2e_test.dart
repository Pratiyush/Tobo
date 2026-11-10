// The daily reminder on a real device: the notifications plugin, its
// manifest receivers and desugaring are wired, and the OS holds exactly one
// daily reminder until it is cancelled.
//
//   flutter test integration_test/reminder_e2e_test.dart -d <device>
import 'dart:io' show Platform;

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart' show Locale;
import 'package:german_words/l10n/l10n_ext.dart';
import 'package:german_words/services/reminders.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'scheduling holds one daily reminder; rescheduling replaces it; cancel clears it',
    (tester) async {
      final reminders = LocalReminders();
      final texts = reminderTexts(lookupAppLocalizations(const Locale('en')));
      // Scheduling needs no permission on Android (only posting does), so
      // the test never raises the system dialog.
      await reminders.schedule(19 * 60, texts);
      expect(await reminders.pendingIds(), [1]);
      await reminders.schedule(8 * 60, texts);
      expect(await reminders.pendingIds(), [1], reason: 'replaced, not added');
      await reminders.cancel();
      expect(await reminders.pendingIds(), isEmpty);
    },
    // iOS may drop a request queued before the user allows notifications,
    // and a test can't answer the permission dialog; covered on Android.
    skip: Platform.isIOS,
  );
}
