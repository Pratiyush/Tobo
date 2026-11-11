// Every translation on every screen: for each language with an ARB file
// (new ones join automatically), open each screen and the round-end
// summaries on a small 360 dp phone with large text, and scroll each to the
// end. A RenderFlex overflow or any exception fails the test and names the
// language. RTL languages must lay out right to left.
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:german_words/l10n/l10n_ext.dart';
import 'package:german_words/l10n/languages.dart';
import 'package:german_words/providers/language_provider.dart';
import 'package:german_words/providers/reminder_provider.dart';
import 'package:german_words/screens/der_die_das_screen.dart';
import 'package:german_words/screens/fallee_screen.dart';
import 'package:german_words/screens/hive_screen.dart';
import 'package:german_words/screens/language_screen.dart';
import 'package:german_words/screens/learn_screen.dart';
import 'package:german_words/screens/onboarding_screen.dart';
import 'package:german_words/screens/practice_screen.dart';
import 'package:german_words/screens/settings_screen.dart';
import 'package:german_words/screens/spelling_screen.dart';
import 'package:german_words/screens/word_list_screen.dart';
import 'package:german_words/widgets/session_summary.dart';

import 'helpers.dart';

/// This language's fixed UI strings (no placeholders): the texts that must
/// never be cut off on screen.
Set<String> _fixedStrings(Language language) {
  final arb = jsonDecode(
    File('lib/l10n/${language.arbFile}').readAsStringSync(),
  ) as Map<String, dynamic>;
  return {
    for (final MapEntry(:key, :value) in arb.entries)
      if (!key.startsWith('@') && value is String && !value.contains('{'))
        value,
  };
}

/// Fails if a fixed UI string on screen is truncated (ellipsis or clipped
/// past maxLines), or a single short word is broken across lines.
void _expectNoCutText(WidgetTester tester, Set<String> fixed, String where) {
  for (final element in find.byType(RichText).evaluate()) {
    final box = element.renderObject;
    if (box is! RenderParagraph || !box.hasSize) continue;
    final text = box.text.toPlainText();
    if (!fixed.contains(text)) continue;
    expect(
      box.didExceedMaxLines,
      isFalse,
      reason: '"$text" is cut off on $where',
    );
    final singleWord = !text.contains(RegExp(r'\s')) && text.length <= 20;
    final spaced = RegExp(r'[A-Za-zÀ-ɏͰ-ϿЀ-ӿ]').hasMatch(text);
    if (singleWord && spaced) {
      final lines = {
        for (final b in box.getBoxesForSelection(
          TextSelection(baseOffset: 0, extentOffset: text.length),
        ))
          b.top.round(),
      };
      expect(lines.length, 1, reason: '"$text" breaks mid-word on $where');
    }
  }
}

/// The SDK's Roboto, so Latin text is measured as on a phone; the default
/// test font draws every glyph as a 1 em square, about twice as wide.
/// Scripts Roboto lacks keep the square glyphs: a conservative stand-in.
Future<void> _loadRoboto() async {
  Directory? dir = File(Platform.resolvedExecutable).parent;
  while (dir != null && dir.path != dir.parent.path) {
    final fonts = Directory('${dir.path}/bin/cache/artifacts/material_fonts');
    if (fonts.existsSync()) {
      final loader = FontLoader('Roboto');
      for (final w in ['Regular', 'Medium', 'Bold', 'Black']) {
        final bytes = File('${fonts.path}/Roboto-$w.ttf').readAsBytesSync();
        loader.addFont(Future.value(ByteData.sublistView(bytes)));
      }
      await loader.load();
      return;
    }
    dir = dir.parent;
  }
  fail('Roboto not found next to ${Platform.resolvedExecutable}');
}

/// Scripts Roboto has no glyphs for: the test draws them as 1 em squares,
/// about twice their real width, so "cut off" can't be judged there and
/// would push translators into clipped wording. Overflow and RTL checks
/// still run for them; real rendering is checked on a device
/// (tools/verify-device.sh screenshots in ar, hi, ta, th, ja).
const _squareGlyphScripts = {
  'ar', 'fa', 'ur', 'he', 'hi', 'bn', 'ta', 'th', 'ja', 'ko', 'zh', //
};

void main() {
  setUpAll(_loadRoboto);

  test('the picker lists exactly the translated languages', () {
    expect({
      for (final l in availableLanguages) l.locale,
    }, AppLocalizations.supportedLocales.toSet());
  });

  for (final locale in AppLocalizations.supportedLocales) {
    final language = languageFor(locale);

    test('$locale has its row in the language table', () {
      expect(language, isNotNull, reason: 'add $locale to languages.dart');
    });
    if (language == null) continue;

    testWidgets('${language.tag}: every screen fits a 360 dp phone', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2280);
      tester.view.devicePixelRatio = 3;
      tester.platformDispatcher.textScaleFactorTestValue = 1.15;
      addTearDown(tester.view.reset);
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

      final c = await createContainer(
        prefs: {
          appLanguageKey: language.tag,
          // Rows that only show when on.
          reminderOnKey: true,
          'stats_points': 12345,
        },
      );
      addTearDown(c.dispose);
      await tester.pumpWidget(buildApp(c));
      await tester.pumpAndSettle();
      final home = tester.element(find.byType(Scaffold).first);
      expect(
        Directionality.of(home),
        language.rtl ? TextDirection.rtl : TextDirection.ltr,
      );
      expect(AppLocalizations.of(home).localeName, locale.toString());
      final l = AppLocalizations.of(home);
      final fixed = _squareGlyphScripts.contains(locale.languageCode)
          ? const <String>{}
          : _fixedStrings(language);
      var where = 'Home';
      final navigator = tester.state<NavigatorState>(
        find.byType(Navigator).first,
      );

      Future<void> scrollToEnd() async {
        final scrollables = find.byType(Scrollable);
        _expectNoCutText(tester, fixed, where);
        if (scrollables.evaluate().isEmpty) return;
        for (var i = 0; i < 6; i++) {
          await tester.fling(scrollables.last, const Offset(0, -800), 2000);
          await tester.pumpAndSettle();
          _expectNoCutText(tester, fixed, where);
        }
      }

      Future<void> visit(Widget screen, {bool settles = true}) async {
        where = '${screen.runtimeType}';
        navigator.push(MaterialPageRoute<void>(builder: (_) => screen));
        if (settles) {
          await tester.pumpAndSettle();
          await scrollToEnd();
        } else {
          await tester.pump(const Duration(seconds: 1));
          _expectNoCutText(tester, fixed, where);
        }
        navigator.pop();
        await tester.pumpAndSettle();
      }

      Widget summary(String title, String message) => Scaffold(
        body: SessionSummary(
          title: title,
          message: message,
          stars: 3,
          points: 1234,
          bestCombo: 18,
          newBest: true,
          onAgain: () {},
          onDone: () {},
        ),
      );

      final words = deck.take(10).toList();
      await scrollToEnd();
      await visit(const PracticeScreen());
      await visit(const SettingsScreen());
      await visit(const LevelSettingsScreen());
      await visit(const LanguageScreen());
      await visit(const OnboardingScreen());
      await visit(const WordListScreen(number: 1));
      await visit(LearnScreen(words: words));
      where = 'LearnScreen (back)';
      navigator.push(
        MaterialPageRoute<void>(builder: (_) => LearnScreen(words: words)),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text(l.learnFlip));
      await tester.pumpAndSettle();
      _expectNoCutText(tester, fixed, where);
      navigator.pop();
      await tester.pumpAndSettle();
      await visit(SpellingScreen(words: words, random: Random(1)));
      await visit(HiveScreen(random: Random(1)));
      await visit(DerDieDasScreen(random: Random(1)));
      await visit(FalleeScreen(random: Random(1)), settles: false);
      // The longest round-end lines, with big numbers.
      await visit(summary('Wunderbar!', l.learnDone(10)));
      await visit(summary('Gut gemacht!', l.spellingDone(20, 260)));
      await visit(summary('20 / 20', l.dddTip));
      await visit(summary('15 / 15', l.falleeKeepGoing));
    });
  }
}
