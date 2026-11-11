import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_it.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ar'),
    Locale('bg'),
    Locale('bn'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('es'),
    Locale('fa'),
    Locale('fi'),
    Locale('fr'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('it'),
    Locale('nb'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'PT'),
    Locale('ro'),
    Locale('ru'),
    Locale('sk'),
    Locale('sv'),
    Locale('ta'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('ur'),
  ];

  /// Settings row and screen title for choosing the UI language. Max ~20 chars.
  ///
  /// In en, this message translates to:
  /// **'App language'**
  String get settingsLanguage;

  /// Hint text in the search box on the language list. Max ~24 chars.
  ///
  /// In en, this message translates to:
  /// **'Search languages'**
  String get languageSearchHint;

  /// First option in the language list: follow the phone's language. Max ~20 chars.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get languageSystemDefault;

  /// Subtitle under 'System default'; {language} is a flag + language name like '🇩🇪 Deutsch'.
  ///
  /// In en, this message translates to:
  /// **'Follows your device · {language}'**
  String languageFollowsDevice(String language);

  /// Shown if the app fails to start; {error} is a technical message.
  ///
  /// In en, this message translates to:
  /// **'Wortschatz couldn’t start.\n\n{error}'**
  String appStartFailed(String error);

  /// Bottom navigation tab: word lists. Max ~10 chars.
  ///
  /// In en, this message translates to:
  /// **'Words'**
  String get navWords;

  /// Bottom navigation tab: practice and games. Max ~10 chars.
  ///
  /// In en, this message translates to:
  /// **'Practice'**
  String get navPractice;

  /// Bottom navigation tab. Max ~10 chars.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// Screen-reader label for the 🔥 streak counter.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Streak: 1 day} other{Streak: {count} days}}'**
  String homeStreak(int count);

  /// Stat label under a number on Home. Max ~12 chars.
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get homePoints;

  /// Stat label: number of words due for practice. Max ~12 chars.
  ///
  /// In en, this message translates to:
  /// **'To practise'**
  String get homeToPractise;

  /// Stat label: number of words learned. Max ~12 chars.
  ///
  /// In en, this message translates to:
  /// **'Vocabulary'**
  String get homeVocabulary;

  /// Screen-reader label for the player's level badge (a number, not a CEFR level).
  ///
  /// In en, this message translates to:
  /// **'Level {level}'**
  String homeLevel(int level);

  /// Small caption under the level number in a circle. Max ~8 chars.
  ///
  /// In en, this message translates to:
  /// **'LEVEL'**
  String get homeLevelCaps;

  /// One line under a word list's name: how many words, then its first and last German word (never translate {first}/{last}).
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 word} other{{count} words}} · {first} … {last}'**
  String homeListSummary(int count, String first, String last);

  /// Screen-reader label; {level} is a CEFR level like A1.
  ///
  /// In en, this message translates to:
  /// **'Level {level}: {learned} of {total} words learned'**
  String homeLevelProgress(String level, int learned, int total);

  /// Title of the first-run card on Home. Max ~20 chars.
  ///
  /// In en, this message translates to:
  /// **'Start here'**
  String get homeStartHere;

  /// Body of the first-run card. Two lines max.
  ///
  /// In en, this message translates to:
  /// **'Learn your first 10 words with sound, then play them in the games.'**
  String get homeStartHereBody;

  /// Button on the first-run card, capitals. Max ~18 chars.
  ///
  /// In en, this message translates to:
  /// **'LEARN 10 WORDS'**
  String get homeLearn10;

  /// Daily goal card title. Max ~22 chars.
  ///
  /// In en, this message translates to:
  /// **'Today\'s goal'**
  String get homeGoal;

  /// Daily goal card title once done. Max ~24 chars.
  ///
  /// In en, this message translates to:
  /// **'Today\'s goal reached!'**
  String get homeGoalReached;

  /// Under the reached goal. One or two lines.
  ///
  /// In en, this message translates to:
  /// **'See you tomorrow, or keep playing for points.'**
  String get homeGoalReachedBody;

  /// Under the daily goal title.
  ///
  /// In en, this message translates to:
  /// **'{done} of {goal} words learned or answered right'**
  String homeGoalProgress(int done, int goal);

  /// Dialog title. Max ~24 chars.
  ///
  /// In en, this message translates to:
  /// **'Out of hints'**
  String get adsOutOfHints;

  /// Dialog body offering a video ad for extra hints.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Watch a short ad for 1 more hint?} other{Watch a short ad for {count} more hints?}}'**
  String adsWatchForHints(int count);

  /// Dialog button that declines. Max ~12 chars.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get commonNotNow;

  /// Dialog button that plays a video ad. Must say it is an ad. Max ~14 chars.
  ///
  /// In en, this message translates to:
  /// **'Watch ad'**
  String get adsWatchAd;

  /// Button after a round: watch an ad to double the points. Max ~26 chars.
  ///
  /// In en, this message translates to:
  /// **'Double points (+{points})'**
  String adsDoublePoints(int points);

  /// Button: watch an ad to restore a lost streak of {days} days. Rephrase freely.
  ///
  /// In en, this message translates to:
  /// **'{days, plural, =1{Restore your 1-day streak} other{Restore your {days}-day streak}}'**
  String adsRestoreStreak(int days);

  /// Label above a link to the developer's other German-learning apps. Keep the name Pratiyush.
  ///
  /// In en, this message translates to:
  /// **'More German from Pratiyush'**
  String get adsMoreGerman;

  /// Grammar tip after an answer. Keep the German article 'die' as is.
  ///
  /// In en, this message translates to:
  /// **'Plural-only noun: plurals always take die.'**
  String get rulePluralOnly;

  /// Grammar tip; {head} is a German noun with its article, e.g. 'die Miete'.
  ///
  /// In en, this message translates to:
  /// **'Compound words take the article of their last part: {head}.'**
  String ruleCompound(String head);

  /// Grammar tip; {suffix} is a German ending like 'ung', {article} is der, die or das (German, unchanged).
  ///
  /// In en, this message translates to:
  /// **'Most nouns ending in -{suffix} take {article}.'**
  String ruleSuffix(String suffix, String article);

  /// CEFR level A1 description. Max ~22 chars.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get levelBeginner;

  /// CEFR level A2 description. Max ~22 chars.
  ///
  /// In en, this message translates to:
  /// **'Elementary'**
  String get levelElementary;

  /// CEFR level B1 description. Max ~22 chars.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get levelIntermediate;

  /// CEFR level B2 description. Max ~22 chars.
  ///
  /// In en, this message translates to:
  /// **'Upper intermediate'**
  String get levelUpperIntermediate;

  /// Level option: learn A1, then A2, B1, B2. Max ~28 chars.
  ///
  /// In en, this message translates to:
  /// **'All levels in sequence'**
  String get levelAllInSequence;

  /// Subtitle of that option; keep the level codes.
  ///
  /// In en, this message translates to:
  /// **'A1 → A2 → B1 → B2 · recommended'**
  String get levelSequenceSub;

  /// Section caption above the level checkboxes.
  ///
  /// In en, this message translates to:
  /// **'Or choose one or more levels'**
  String get levelOrChoose;

  /// Under a level name: how many words it has.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 word} other{{count} words}}'**
  String levelWordCount(int count);

  /// Screen-reader label for a CEFR badge; {level} is like A1.
  ///
  /// In en, this message translates to:
  /// **'Level {level}'**
  String levelBadge(String level);

  /// Note on the Levels screen.
  ///
  /// In en, this message translates to:
  /// **'Your progress is kept for every level, so switching never loses a learned word.'**
  String get levelsKeepProgress;

  /// Title of the daily shared board; keep 'Daily Hive' as the game name if you like, {level} is like A1.
  ///
  /// In en, this message translates to:
  /// **'Daily Hive · {level}'**
  String dailyHiveTitle(String level);

  /// Text shared to friends; {date} is a short date, {stars} like ★★☆, {hints} from dailyHints. Keep 'Wortschatz'.
  ///
  /// In en, this message translates to:
  /// **'Wortschatz Daily Hive · {date} · {level} · {stars} · {hints}'**
  String dailyShare(DateTime date, String level, String stars, String hints);

  /// Part of the shared result: how many hints were used.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{no hints} =1{1 hint} other{{count} hints}}'**
  String dailyHints(int count);

  /// Subtitle of the Daily Hive row. One line on a phone if possible.
  ///
  /// In en, this message translates to:
  /// **'Today\'s board, the same for every learner'**
  String get practiceDailySub;

  /// Subtitle once today's board is done; {stars} like ★★☆.
  ///
  /// In en, this message translates to:
  /// **'Done today: {stars}. Tap to share'**
  String practiceDailyDone(String stars);

  /// Round-end line when all answers were right. Keep the German 'Perfekt!' and translate the rest.
  ///
  /// In en, this message translates to:
  /// **'Perfekt! Every article right.'**
  String get dddPerfect;

  /// Tip; keep der/die/das in German.
  ///
  /// In en, this message translates to:
  /// **'Colour is the memory hook: der black, die red, das gold.'**
  String get dddTip;

  /// Feedback after a wrong answer; {article} is der, die or das.
  ///
  /// In en, this message translates to:
  /// **'It’s {article}'**
  String dddItsArticle(String article);

  /// Round-end line. Keep the German 'Blitzschnell!' and translate 'Lightning fast.'
  ///
  /// In en, this message translates to:
  /// **'Blitzschnell! Lightning fast.'**
  String get falleePerfect;

  /// Round-end line.
  ///
  /// In en, this message translates to:
  /// **'Keep going: the more you play, the faster you’ll read.'**
  String get falleeKeepGoing;

  /// Hive title suffix. Max ~10 chars.
  ///
  /// In en, this message translates to:
  /// **'Round {round}'**
  String hiveRound(int round);

  /// Progress in a Hive round.
  ///
  /// In en, this message translates to:
  /// **'Word {n} of {total}'**
  String hiveWordOf(int n, int total);

  /// One-line how-to for first-time players. Two lines max.
  ///
  /// In en, this message translates to:
  /// **'Tap or drag through touching letters to spell the German word'**
  String get hiveCoach;

  /// Under the honeycomb.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 letter left} other{{count} letters left}}'**
  String hiveLettersLeft(int count);

  /// Button/tooltip that reveals a letter. Max ~10 chars.
  ///
  /// In en, this message translates to:
  /// **'Hint'**
  String get commonHint;

  /// Round-end title. Max ~20 chars.
  ///
  /// In en, this message translates to:
  /// **'Board cleared!'**
  String get hiveBoardCleared;

  /// Points earned, shown big.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{+1 point} other{+{count} points}}'**
  String commonPlusPoints(int count);

  /// Button, capitals. Max ~16 chars.
  ///
  /// In en, this message translates to:
  /// **'SHARE RESULT'**
  String get hiveShareResult;

  /// Button that closes a result. Max ~10 chars.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get commonDone;

  /// Button, capitals. Max ~16 chars.
  ///
  /// In en, this message translates to:
  /// **'NEXT ROUND'**
  String get hiveNextRound;

  /// Screen title and button: learn new words with flashcards. Max ~12 chars.
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get commonLearn;

  /// End of a flashcard session.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{You learned 1 new word. It’ll come back for practice tomorrow.} other{You learned {count} new words. They’ll come back for practice tomorrow.}}'**
  String learnDone(int count);

  /// Flashcard button: not yet known. Capitals. Max ~10 chars.
  ///
  /// In en, this message translates to:
  /// **'LATER'**
  String get learnLater;

  /// Flashcard button: I know this word. Capitals. Max ~10 chars.
  ///
  /// In en, this message translates to:
  /// **'KNOW IT'**
  String get learnKnowIt;

  /// Flashcard button: turn the card. Capitals. Max ~10 chars.
  ///
  /// In en, this message translates to:
  /// **'FLIP'**
  String get learnFlip;

  /// Under a plural-only noun; keep the German 'die'.
  ///
  /// In en, this message translates to:
  /// **'plural only · always die'**
  String get learnPluralOnly;

  /// Plural of a noun; {plural} is German. Use your language's short word for plural.
  ///
  /// In en, this message translates to:
  /// **'pl. {plural}'**
  String learnPlural(String plural);

  /// Under the German 'Willkommen!' on first launch.
  ///
  /// In en, this message translates to:
  /// **'Learn German words by playing. What’s your level?'**
  String get onboardingIntro;

  /// First-launch button, capitals. Max ~12 chars.
  ///
  /// In en, this message translates to:
  /// **'START'**
  String get onboardingStart;

  /// Text button under START.
  ///
  /// In en, this message translates to:
  /// **'Not sure? Start at A1'**
  String get onboardingNotSure;

  /// Note under the level list.
  ///
  /// In en, this message translates to:
  /// **'You can change this any time in Settings.'**
  String get onboardingChangeLater;

  /// Screen heading, capitals. Max ~14 chars.
  ///
  /// In en, this message translates to:
  /// **'PRACTICE'**
  String get practiceTitle;

  /// Row that starts spelling practice.
  ///
  /// In en, this message translates to:
  /// **'Spell the words that are due'**
  String get practiceSpellDue;

  /// Subtitle when nothing is learned yet.
  ///
  /// In en, this message translates to:
  /// **'Learn some words first'**
  String get practiceLearnFirst;

  /// Subtitle when nothing is due.
  ///
  /// In en, this message translates to:
  /// **'All caught up. Come back tomorrow!'**
  String get practiceCaughtUp;

  /// How many words are due or in a list.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 item} other{{count} items}}'**
  String commonItems(int count);

  /// Section heading, capitals. Max ~12 chars.
  ///
  /// In en, this message translates to:
  /// **'GAMES'**
  String get practiceGames;

  /// Subtitle of the Hive game row.
  ///
  /// In en, this message translates to:
  /// **'Swipe across the honeycomb to spell each word'**
  String get practiceHiveSub;

  /// Subtitle of the Der Die Das game row.
  ///
  /// In en, this message translates to:
  /// **'Pick the right article'**
  String get practiceDddSub;

  /// Subtitle of the Fallee game row.
  ///
  /// In en, this message translates to:
  /// **'Choose the meaning before the word lands'**
  String get practiceFalleeSub;

  /// Screen heading, capitals. Max ~14 chars.
  ///
  /// In en, this message translates to:
  /// **'SETTINGS'**
  String get settingsTitle;

  /// Footer; keep the name and the emoji.
  ///
  /// In en, this message translates to:
  /// **'Made with ❤️ by Pratiyush Kumar Singh'**
  String get settingsMadeBy;

  /// Settings row and screen title. Max ~16 chars.
  ///
  /// In en, this message translates to:
  /// **'Levels'**
  String get settingsLevels;

  /// Switch title.
  ///
  /// In en, this message translates to:
  /// **'Speak words automatically'**
  String get settingsAutoSpeak;

  /// Switch subtitle.
  ///
  /// In en, this message translates to:
  /// **'On flashcards and after answers'**
  String get settingsAutoSpeakSub;

  /// Switch title.
  ///
  /// In en, this message translates to:
  /// **'Count games as practice'**
  String get settingsGamesAsPractice;

  /// Switch subtitle: answers in games change when a word is due again.
  ///
  /// In en, this message translates to:
  /// **'Game answers move learned words up or down'**
  String get settingsGamesAsPracticeSub;

  /// Switch title.
  ///
  /// In en, this message translates to:
  /// **'Sounds & vibration'**
  String get settingsSounds;

  /// Switch subtitle.
  ///
  /// In en, this message translates to:
  /// **'In games and practice'**
  String get settingsSoundsSub;

  /// Settings row that deletes progress.
  ///
  /// In en, this message translates to:
  /// **'Reset progress'**
  String get settingsReset;

  /// Confirmation dialog title.
  ///
  /// In en, this message translates to:
  /// **'Reset progress?'**
  String get settingsResetTitle;

  /// Confirmation dialog body.
  ///
  /// In en, this message translates to:
  /// **'This forgets every learned word, your points and your streak.'**
  String get settingsResetBody;

  /// Dialog button. Max ~12 chars.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// Destructive dialog button. Max ~12 chars.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get settingsResetConfirm;

  /// Row that reopens the ad consent form.
  ///
  /// In en, this message translates to:
  /// **'Privacy & ad choices'**
  String get settingsPrivacyChoices;

  /// Link row.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get settingsPrivacyPolicy;

  /// Row that opens an email to the developer.
  ///
  /// In en, this message translates to:
  /// **'Contact support'**
  String get settingsContact;

  /// Row that lists software licences.
  ///
  /// In en, this message translates to:
  /// **'Open-source licences'**
  String get settingsLicences;

  /// About text; word meanings are in English, say so.
  ///
  /// In en, this message translates to:
  /// **'{count} common German words with English translations and recorded pronunciations. No paywall: every word and game is free.'**
  String settingsAbout(int count);

  /// Line in the support email above a technical error log.
  ///
  /// In en, this message translates to:
  /// **'Last error on this device (delete if you prefer):'**
  String get settingsMailLastError;

  /// Spelling practice screen title. Max ~14 chars.
  ///
  /// In en, this message translates to:
  /// **'Practice'**
  String get spellingTitle;

  /// End of a spelling session.
  ///
  /// In en, this message translates to:
  /// **'You practised {count, plural, =1{1 word} other{{count} words}} and earned {points, plural, =1{1 point} other{{points} points}}.'**
  String spellingDone(int count, int points);

  /// Hint under the meaning; keep der/die/das in German.
  ///
  /// In en, this message translates to:
  /// **'noun — include der, die or das'**
  String get spellingNounHint;

  /// Shown before the correct German answer (on its own line).
  ///
  /// In en, this message translates to:
  /// **'The answer is'**
  String get spellingAnswerIs;

  /// Button, capitals. Max ~10 chars.
  ///
  /// In en, this message translates to:
  /// **'NEXT'**
  String get commonNext;

  /// Tooltip. Max ~10 chars.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get spellingSkip;

  /// Tooltip: delete the last letter. Max ~10 chars.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get spellingDelete;

  /// Tooltip: check the answer. Max ~10 chars.
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get spellingCheck;

  /// Note above the buttons.
  ///
  /// In en, this message translates to:
  /// **'You’ve learned every word in this list.'**
  String get wordListAllLearned;

  /// Note above the buttons.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{There is 1 word left in this list.} other{There are {count} words left in this list.}}'**
  String wordListWordsLeft(int count);

  /// Section heading, capitals.
  ///
  /// In en, this message translates to:
  /// **'VOCABULARY ({count})'**
  String wordListVocabulary(int count);

  /// Daily notification text under the German title 'Zeit für Wörter'. Warm, never a warning.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Daily Hive is ready. Five minutes of German?'**
  String get reminderBody;

  /// Name of the notification channel in the phone's settings.
  ///
  /// In en, this message translates to:
  /// **'Daily reminder'**
  String get reminderChannel;

  /// Description of that channel.
  ///
  /// In en, this message translates to:
  /// **'One reminder a day, at the time you choose.'**
  String get reminderChannelDesc;

  /// Settings switch title.
  ///
  /// In en, this message translates to:
  /// **'Daily reminder'**
  String get reminderSwitch;

  /// Switch subtitle when on; {time} like 19:00.
  ///
  /// In en, this message translates to:
  /// **'One nudge a day at {time}'**
  String reminderOnAt(String time);

  /// Switch subtitle when off.
  ///
  /// In en, this message translates to:
  /// **'One nudge a day, at a time you choose'**
  String get reminderOff;

  /// Snackbar when notifications are blocked.
  ///
  /// In en, this message translates to:
  /// **'Allow notifications for Wortschatz in your phone settings to get a reminder.'**
  String get reminderBlocked;

  /// Row that opens a time picker.
  ///
  /// In en, this message translates to:
  /// **'Reminder time'**
  String get reminderTime;

  /// Screen-reader label for a word's mastery dots.
  ///
  /// In en, this message translates to:
  /// **'Mastery {level} of {max}'**
  String commonMastery(int level, int max);

  /// Under a progress bar.
  ///
  /// In en, this message translates to:
  /// **'{percent}% learned'**
  String commonPercentLearned(int percent);

  /// Tooltip of the speaker button.
  ///
  /// In en, this message translates to:
  /// **'Listen'**
  String get commonListen;

  /// Snackbar when the phone has no German voice.
  ///
  /// In en, this message translates to:
  /// **'No German voice installed. Add one in your device’s text-to-speech settings.'**
  String get commonNoVoice;

  /// A download size.
  ///
  /// In en, this message translates to:
  /// **'{size} MB'**
  String contentMb(double size);

  /// Home card; {size} like '1.2 MB'.
  ///
  /// In en, this message translates to:
  /// **'New word data available. Update ({size})'**
  String contentBanner(String size);

  /// Progress text.
  ///
  /// In en, this message translates to:
  /// **'Updating words…'**
  String get contentUpdating;

  /// Home card after an update.
  ///
  /// In en, this message translates to:
  /// **'Words updated. They appear next time you open the app; recordings already play.'**
  String get contentUpdatedBanner;

  /// Settings row subtitle.
  ///
  /// In en, this message translates to:
  /// **'Checking…'**
  String get contentChecking;

  /// Settings row subtitle.
  ///
  /// In en, this message translates to:
  /// **'Downloading and checking files…'**
  String get contentDownloading;

  /// Settings row subtitle; {size} like '1.2 MB'.
  ///
  /// In en, this message translates to:
  /// **'Version {version} available, {size}'**
  String contentAvailable(int version, String size);

  /// Button. Max ~12 chars.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get contentUpdate;

  /// Settings row subtitle.
  ///
  /// In en, this message translates to:
  /// **'Updated. New words appear next time you open the app.'**
  String get contentUpdated;

  /// Settings row subtitle.
  ///
  /// In en, this message translates to:
  /// **'Up to date'**
  String get contentUpToDate;

  /// Button: check for new content. Max ~12 chars.
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get contentCheck;

  /// Settings row subtitle.
  ///
  /// In en, this message translates to:
  /// **'Update the app to get new content'**
  String get contentAppTooOld;

  /// Button that opens the app store. Max ~10 chars.
  ///
  /// In en, this message translates to:
  /// **'Store'**
  String get contentStore;

  /// Settings row subtitle.
  ///
  /// In en, this message translates to:
  /// **'Couldn’t update. Your words are unchanged.'**
  String get contentFailed;

  /// Button. Max ~10 chars.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get contentRetry;

  /// Settings row title.
  ///
  /// In en, this message translates to:
  /// **'Word content · version {version}'**
  String contentTitle(int version);

  /// Switch title.
  ///
  /// In en, this message translates to:
  /// **'Update automatically on Wi-Fi'**
  String get contentAutoWifi;

  /// Switch subtitle.
  ///
  /// In en, this message translates to:
  /// **'Never on mobile data'**
  String get contentAutoWifiSub;

  /// Shown during a game streak of right answers.
  ///
  /// In en, this message translates to:
  /// **'Combo: {count} in a row'**
  String summaryCombo(int count);

  /// Round-end badge, capitals. Max ~12 chars.
  ///
  /// In en, this message translates to:
  /// **'NEW BEST!'**
  String get summaryNewBest;

  /// Round-end line.
  ///
  /// In en, this message translates to:
  /// **'Best combo: {count} in a row'**
  String summaryBestCombo(int count);

  /// Button, capitals. Max ~14 chars.
  ///
  /// In en, this message translates to:
  /// **'PLAY AGAIN'**
  String get summaryPlayAgain;

  /// Screen-reader label for the star rating.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 of 3 stars} other{{count} of 3 stars}}'**
  String summaryStars(int count);

  /// House ad: one line about the Lernle app (a German story reader).
  ///
  /// In en, this message translates to:
  /// **'Read real German stories, word by word'**
  String get siblingLernle;

  /// House ad: one line about the WordBit app (a German word on the lock screen).
  ///
  /// In en, this message translates to:
  /// **'A German word every time you unlock'**
  String get siblingWordbit;

  /// House ad: one line about the 'Leben in Deutschland' app (prep for Germany's citizenship test). Keep the app name out of it.
  ///
  /// In en, this message translates to:
  /// **'Pass the citizenship test'**
  String get siblingLeben;

  /// House ad: the name of a German audiobook app, as a plain description.
  ///
  /// In en, this message translates to:
  /// **'German audiobook'**
  String get siblingAudiobookName;

  /// House ad: one line about the audiobook app (German stories by level).
  ///
  /// In en, this message translates to:
  /// **'Listen to graded stories'**
  String get siblingAudiobook;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bg',
    'bn',
    'cs',
    'da',
    'de',
    'el',
    'en',
    'es',
    'fa',
    'fi',
    'fr',
    'he',
    'hi',
    'hr',
    'hu',
    'it',
    'nb',
    'nl',
    'pl',
    'pt',
    'ro',
    'ru',
    'sk',
    'sv',
    'ta',
    'th',
    'tr',
    'uk',
    'ur',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'PT':
            return AppLocalizationsPtPt();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bg':
      return AppLocalizationsBg();
    case 'bn':
      return AppLocalizationsBn();
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'it':
      return AppLocalizationsIt();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sk':
      return AppLocalizationsSk();
    case 'sv':
      return AppLocalizationsSv();
    case 'ta':
      return AppLocalizationsTa();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
