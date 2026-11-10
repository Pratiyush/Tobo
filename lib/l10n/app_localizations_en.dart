// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get settingsLanguage => 'App language';

  @override
  String get languageSearchHint => 'Search languages';

  @override
  String get languageSystemDefault => 'System default';

  @override
  String languageFollowsDevice(String language) {
    return 'Follows your device · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz couldn’t start.\n\n$error';
  }

  @override
  String get navWords => 'Words';

  @override
  String get navPractice => 'Practice';

  @override
  String get navSettings => 'Settings';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Streak: $count days',
      one: 'Streak: 1 day',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Points';

  @override
  String get homeToPractise => 'To practise';

  @override
  String get homeVocabulary => 'Vocabulary';

  @override
  String homeLevel(int level) {
    return 'Level $level';
  }

  @override
  String get homeLevelCaps => 'LEVEL';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count words',
      one: '1 word',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Level $level: $learned of $total words learned';
  }

  @override
  String get homeStartHere => 'Start here';

  @override
  String get homeStartHereBody =>
      'Learn your first 10 words with sound, then play them in the games.';

  @override
  String get homeLearn10 => 'LEARN 10 WORDS';

  @override
  String get homeGoal => 'Today\'s goal';

  @override
  String get homeGoalReached => 'Today\'s goal reached!';

  @override
  String get homeGoalReachedBody =>
      'See you tomorrow, or keep playing for points.';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$done of $goal words learned or answered right';
  }

  @override
  String get adsOutOfHints => 'Out of hints';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Watch a short ad for $count more hints?',
      one: 'Watch a short ad for 1 more hint?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Not now';

  @override
  String get adsWatchAd => 'Watch ad';

  @override
  String adsDoublePoints(int points) {
    return 'Double points (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Restore your $days-day streak',
      one: 'Restore your 1-day streak',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'More German from Pratiyush';

  @override
  String get rulePluralOnly => 'Plural-only noun: plurals always take die.';

  @override
  String ruleCompound(String head) {
    return 'Compound words take the article of their last part: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'Most nouns ending in -$suffix take $article.';
  }

  @override
  String get levelBeginner => 'Beginner';

  @override
  String get levelElementary => 'Elementary';

  @override
  String get levelIntermediate => 'Intermediate';

  @override
  String get levelUpperIntermediate => 'Upper intermediate';

  @override
  String get levelAllInSequence => 'All levels in sequence';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · recommended';

  @override
  String get levelOrChoose => 'Or choose one or more levels';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count words',
      one: '1 word',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Level $level';
  }

  @override
  String get levelsKeepProgress =>
      'Your progress is kept for every level, so switching never loses a learned word.';

  @override
  String dailyHiveTitle(String level) {
    return 'Daily Hive · $level';
  }

  @override
  String dailyShare(DateTime date, String level, String stars, String hints) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.MMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Wortschatz Daily Hive · $dateString · $level · $stars · $hints';
  }

  @override
  String dailyHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hints',
      one: '1 hint',
      zero: 'no hints',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Today\'s board, the same for every learner';

  @override
  String practiceDailyDone(String stars) {
    return 'Done today: $stars. Tap to share';
  }

  @override
  String get dddPerfect => 'Perfekt! Every article right.';

  @override
  String get dddTip =>
      'Colour is the memory hook: der black, die red, das gold.';

  @override
  String dddItsArticle(String article) {
    return 'It’s $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Lightning fast.';

  @override
  String get falleeKeepGoing =>
      'Keep going: the more you play, the faster you’ll read.';

  @override
  String hiveRound(int round) {
    return 'Round $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Word $n of $total';
  }

  @override
  String get hiveCoach =>
      'Tap or drag through touching letters to spell the German word';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count letters left',
      one: '1 letter left',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Hint';

  @override
  String get hiveBoardCleared => 'Board cleared!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count points',
      one: '+1 point',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'SHARE RESULT';

  @override
  String get commonDone => 'Done';

  @override
  String get hiveNextRound => 'NEXT ROUND';

  @override
  String get commonLearn => 'Learn';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'You learned $count new words. They’ll come back for practice tomorrow.',
      one: 'You learned 1 new word. It’ll come back for practice tomorrow.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'LATER';

  @override
  String get learnKnowIt => 'KNOW IT';

  @override
  String get learnFlip => 'FLIP';

  @override
  String get learnPluralOnly => 'plural only · always die';

  @override
  String learnPlural(String plural) {
    return 'pl. $plural';
  }

  @override
  String get onboardingIntro =>
      'Learn German words by playing. What’s your level?';

  @override
  String get onboardingStart => 'START';

  @override
  String get onboardingNotSure => 'Not sure? Start at A1';

  @override
  String get onboardingChangeLater =>
      'You can change this any time in Settings.';

  @override
  String get practiceTitle => 'PRACTICE';

  @override
  String get practiceSpellDue => 'Spell the words that are due';

  @override
  String get practiceLearnFirst => 'Learn some words first';

  @override
  String get practiceCaughtUp => 'All caught up. Come back tomorrow!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'GAMES';

  @override
  String get practiceHiveSub => 'Swipe across the honeycomb to spell each word';

  @override
  String get practiceDddSub => 'Pick the right article';

  @override
  String get practiceFalleeSub => 'Choose the meaning before the word lands';

  @override
  String get settingsTitle => 'SETTINGS';

  @override
  String get settingsMadeBy => 'Made with ❤️ by Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Levels';

  @override
  String get settingsAutoSpeak => 'Speak words automatically';

  @override
  String get settingsAutoSpeakSub => 'On flashcards and after answers';

  @override
  String get settingsGamesAsPractice => 'Count games as practice';

  @override
  String get settingsGamesAsPracticeSub =>
      'Game answers move learned words up or down';

  @override
  String get settingsSounds => 'Sounds & vibration';

  @override
  String get settingsSoundsSub => 'In games and practice';

  @override
  String get settingsReset => 'Reset progress';

  @override
  String get settingsResetTitle => 'Reset progress?';

  @override
  String get settingsResetBody =>
      'This forgets every learned word, your points and your streak.';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get settingsResetConfirm => 'Reset';

  @override
  String get settingsPrivacyChoices => 'Privacy & ad choices';

  @override
  String get settingsPrivacyPolicy => 'Privacy policy';

  @override
  String get settingsContact => 'Contact support';

  @override
  String get settingsLicences => 'Open-source licences';

  @override
  String settingsAbout(int count) {
    return '$count common German words with English translations and recorded pronunciations. No paywall: every word and game is free.';
  }

  @override
  String get settingsMailLastError =>
      'Last error on this device (delete if you prefer):';

  @override
  String get spellingTitle => 'Practice';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count words',
      one: '1 word',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points points',
      one: '1 point',
    );
    return 'You practised $_temp0 and earned $_temp1.';
  }

  @override
  String get spellingNounHint => 'noun — include der, die or das';

  @override
  String get spellingAnswerIs => 'The answer is';

  @override
  String get commonNext => 'NEXT';

  @override
  String get spellingSkip => 'Skip';

  @override
  String get spellingDelete => 'Delete';

  @override
  String get spellingCheck => 'Check';

  @override
  String get wordListAllLearned => 'You’ve learned every word in this list.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'There are $count words left in this list.',
      one: 'There is 1 word left in this list.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'VOCABULARY ($count)';
  }

  @override
  String get reminderBody =>
      'Today\'s Daily Hive is ready. Five minutes of German?';

  @override
  String get reminderChannel => 'Daily reminder';

  @override
  String get reminderChannelDesc =>
      'One reminder a day, at the time you choose.';

  @override
  String get reminderSwitch => 'Daily reminder';

  @override
  String reminderOnAt(String time) {
    return 'One nudge a day at $time';
  }

  @override
  String get reminderOff => 'One nudge a day, at a time you choose';

  @override
  String get reminderBlocked =>
      'Allow notifications for Wortschatz in your phone settings to get a reminder.';

  @override
  String get reminderTime => 'Reminder time';

  @override
  String commonMastery(int level, int max) {
    return 'Mastery $level of $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent% learned';
  }

  @override
  String get commonListen => 'Listen';

  @override
  String get commonNoVoice =>
      'No German voice installed. Add one in your device’s text-to-speech settings.';

  @override
  String contentMb(double size) {
    final intl.NumberFormat sizeNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String sizeString = sizeNumberFormat.format(size);

    return '$sizeString MB';
  }

  @override
  String contentBanner(String size) {
    return 'New word data available. Update ($size)';
  }

  @override
  String get contentUpdating => 'Updating words…';

  @override
  String get contentUpdatedBanner =>
      'Words updated. They appear next time you open the app; recordings already play.';

  @override
  String get contentChecking => 'Checking…';

  @override
  String get contentDownloading => 'Downloading and checking files…';

  @override
  String contentAvailable(int version, String size) {
    return 'Version $version available, $size';
  }

  @override
  String get contentUpdate => 'Update';

  @override
  String get contentUpdated =>
      'Updated. New words appear next time you open the app.';

  @override
  String get contentUpToDate => 'Up to date';

  @override
  String get contentCheck => 'Check';

  @override
  String get contentAppTooOld => 'Update the app to get new content';

  @override
  String get contentStore => 'Store';

  @override
  String get contentFailed => 'Couldn’t update. Your words are unchanged.';

  @override
  String get contentRetry => 'Retry';

  @override
  String contentTitle(int version) {
    return 'Word content · version $version';
  }

  @override
  String get contentAutoWifi => 'Update automatically on Wi-Fi';

  @override
  String get contentAutoWifiSub => 'Never on mobile data';

  @override
  String summaryCombo(int count) {
    return 'Combo: $count in a row';
  }

  @override
  String get summaryNewBest => 'NEW BEST!';

  @override
  String summaryBestCombo(int count) {
    return 'Best combo: $count in a row';
  }

  @override
  String get summaryPlayAgain => 'PLAY AGAIN';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count of 3 stars',
      one: '1 of 3 stars',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'Read real German stories, word by word';

  @override
  String get siblingWordbit => 'A German word every time you unlock';

  @override
  String get siblingLeben => 'Pass the citizenship test';

  @override
  String get siblingAudiobookName => 'German audiobook';

  @override
  String get siblingAudiobook => 'Listen to graded stories';
}
