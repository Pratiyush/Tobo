// BUG-39: every rewarded-ad entry point must say, before the tap, that it
// plays an ad — in every UI language. "Double points (+20)" and "Restore
// your 3-day streak" only showed a video icon.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/ads/ad_widgets.dart';
import 'package:german_words/ads/ads_service.dart';
import 'package:german_words/l10n/l10n_ext.dart';
import 'package:german_words/l10n/languages.dart';
import 'package:german_words/providers/language_provider.dart';
import 'package:german_words/providers/stats_provider.dart';

import 'ads_test.dart' show FakeAdsService;
import 'helpers.dart';

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    final language = languageFor(locale)!;
    final l = lookupAppLocalizations(locale);

    testWidgets('${language.tag}: rewarded-ad buttons say "ad" first', (
      tester,
    ) async {
      final c = await createContainer(
        ads: FakeAdsService(),
        prefs: {appLanguageKey: language.tag},
        overrides: [restorableStreakProvider.overrideWithValue(3)],
      );
      await tester.pumpWidget(buildApp(c)); // locale + delegates from the app
      await tester.pumpAndSettle();
      final nav = tester.state<NavigatorState>(find.byType(Navigator).first);
      nav.push(
        MaterialPageRoute<void>(
          builder: (_) => const Scaffold(
            body: Column(
              children: [DoublePointsButton(points: 20), StreakRestoreCard()],
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final button = find.byType(DoublePointsButton);
      expect(
        find.descendant(
          of: button,
          matching: find.textContaining(l.adsWatchAd),
        ),
        findsOneWidget,
        reason: 'double points must say it plays an ad',
      );
      final card = find.byType(StreakRestoreCard);
      expect(
        find.descendant(of: card, matching: find.textContaining(l.adsWatchAd)),
        findsOneWidget,
        reason: 'streak restore must say it plays an ad',
      );
      expect(tester.takeException(), isNull);
    });
  }

  test('FakeAdsService is enabled, so the buttons render', () {
    expect(FakeAdsService().enabled, isTrue);
    expect(FakeAdsService(), isA<AdsService>());
  });
}
