// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get settingsLanguage => 'Appsprog';

  @override
  String get languageSearchHint => 'Søg efter sprog';

  @override
  String get languageSystemDefault => 'Systemets sprog';

  @override
  String languageFollowsDevice(String language) {
    return 'Følger din enhed · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz kunne ikke starte.\n\n$error';
  }

  @override
  String get navWords => 'Ord';

  @override
  String get navPractice => 'Øvelse';

  @override
  String get navSettings => 'Indstillinger';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Stribe: $count dage i træk',
      one: 'Stribe: $count dag i træk',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Point';

  @override
  String get homeToPractise => 'Skal øves';

  @override
  String get homeVocabulary => 'Ordforråd';

  @override
  String homeLevel(int level) {
    return 'Niveau $level';
  }

  @override
  String get homeLevelCaps => 'NIVEAU';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ord',
      one: '$count ord',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Niveau $level: $learned af $total ord lært';
  }

  @override
  String get homeStartHere => 'Start her';

  @override
  String get homeStartHereBody =>
      'Lær dine første 10 ord med lyd, og brug dem så i spillene.';

  @override
  String get homeLearn10 => 'LÆR 10 ORD';

  @override
  String get homeGoal => 'Dagens mål';

  @override
  String get homeGoalReached => 'Dagens mål er nået!';

  @override
  String get homeGoalReachedBody =>
      'Vi ses i morgen, eller spil videre for point.';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$done af $goal ord lært eller besvaret rigtigt';
  }

  @override
  String get adsOutOfHints => 'Ikke flere hints';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se en kort reklame for $count hints mere?',
      one: 'Se en kort reklame for $count hint mere?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Ikke nu';

  @override
  String get adsWatchAd => 'Se reklame';

  @override
  String adsDoublePoints(int points) {
    return 'Dobbelt point (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Gendan din stribe på $days dage',
      one: 'Gendan din stribe på $days dag',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Mere tysk fra Pratiyush';

  @override
  String get rulePluralOnly => 'Navneord kun i flertal: flertal har altid die.';

  @override
  String ruleCompound(String head) {
    return 'Sammensatte ord får artiklen fra sidste del: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'De fleste navneord, der ender på -$suffix, har $article.';
  }

  @override
  String get levelBeginner => 'Begynder';

  @override
  String get levelElementary => 'Grundlæggende';

  @override
  String get levelIntermediate => 'Mellemniveau';

  @override
  String get levelUpperIntermediate => 'Øvre mellemniveau';

  @override
  String get levelAllInSequence => 'Alle niveauer i rækkefølge';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · anbefales';

  @override
  String get levelOrChoose => 'Eller vælg et eller flere niveauer';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ord',
      one: '$count ord',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Niveau $level';
  }

  @override
  String get levelsKeepProgress =>
      'Dine fremskridt gemmes for hvert niveau, så du mister aldrig et lært ord, når du skifter.';

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
      one: '$count hint',
      zero: 'ingen hints',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Dagens bræt, det samme for alle';

  @override
  String practiceDailyDone(String stars) {
    return 'Klaret i dag: $stars. Tryk for at dele';
  }

  @override
  String get dddPerfect => 'Perfekt! Alle artikler rigtige.';

  @override
  String get dddTip =>
      'Farven hjælper hukommelsen: der sort, die rød, das guld.';

  @override
  String dddItsArticle(String article) {
    return 'Det er $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Lynhurtigt.';

  @override
  String get falleeKeepGoing =>
      'Bliv ved: jo mere du spiller, jo hurtigere læser du.';

  @override
  String hiveRound(int round) {
    return 'Runde $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Ord $n af $total';
  }

  @override
  String get hiveCoach =>
      'Tryk eller træk hen over nabobogstaver for at stave det tyske ord';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bogstaver tilbage',
      one: '$count bogstav tilbage',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Hint';

  @override
  String get hiveBoardCleared => 'Brættet er klaret!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count point',
      one: '+$count point',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'DEL RESULTAT';

  @override
  String get commonDone => 'Færdig';

  @override
  String get hiveNextRound => 'NÆSTE RUNDE';

  @override
  String get commonLearn => 'Lær';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Du har lært $count nye ord. De kommer igen til øvelse i morgen.',
      one: 'Du har lært $count nyt ord. Det kommer igen til øvelse i morgen.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'SENERE';

  @override
  String get learnKnowIt => 'KAN DET';

  @override
  String get learnFlip => 'VEND';

  @override
  String get learnPluralOnly => 'kun flertal · altid die';

  @override
  String learnPlural(String plural) {
    return 'flt. $plural';
  }

  @override
  String get onboardingIntro =>
      'Lær tyske ord ved at spille. Hvilket niveau er du på?';

  @override
  String get onboardingStart => 'START';

  @override
  String get onboardingNotSure => 'I tvivl? Start på A1';

  @override
  String get onboardingChangeLater => 'Du kan altid ændre det i Indstillinger.';

  @override
  String get practiceTitle => 'ØVELSE';

  @override
  String get practiceSpellDue => 'Stav de ord, der skal øves';

  @override
  String get practiceLearnFirst => 'Lær nogle ord først';

  @override
  String get practiceCaughtUp => 'Alt er klaret. Kom igen i morgen!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ord',
      one: '$count ord',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'SPIL';

  @override
  String get practiceHiveSub => 'Stryg hen over bikagen for at stave hvert ord';

  @override
  String get practiceDddSub => 'Vælg den rigtige artikel';

  @override
  String get practiceFalleeSub => 'Vælg betydningen, før ordet lander';

  @override
  String get settingsTitle => 'INDSTILLINGER';

  @override
  String get settingsMadeBy => 'Lavet med ❤️ af Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Niveauer';

  @override
  String get settingsAutoSpeak => 'Læs ord op automatisk';

  @override
  String get settingsAutoSpeakSub => 'På kort og efter svar';

  @override
  String get settingsGamesAsPractice => 'Tæl spil som øvelse';

  @override
  String get settingsGamesAsPracticeSub =>
      'Svar i spil flytter lærte ord op eller ned';

  @override
  String get settingsSounds => 'Lyd og vibration';

  @override
  String get settingsSoundsSub => 'I spil og øvelser';

  @override
  String get settingsReset => 'Nulstil fremskridt';

  @override
  String get settingsResetTitle => 'Nulstil fremskridt?';

  @override
  String get settingsResetBody =>
      'Så glemmes alle lærte ord, dine point og din stribe.';

  @override
  String get commonCancel => 'Annuller';

  @override
  String get settingsResetConfirm => 'Nulstil';

  @override
  String get settingsPrivacyChoices => 'Privatliv og annoncevalg';

  @override
  String get settingsPrivacyPolicy => 'Privatlivspolitik';

  @override
  String get settingsContact => 'Kontakt support';

  @override
  String get settingsLicences => 'Open source-licenser';

  @override
  String settingsAbout(int count) {
    return '$count almindelige tyske ord med engelske oversættelser og indtalt udtale. Ingen betalingsmur: alle ord og spil er gratis.';
  }

  @override
  String get settingsMailLastError =>
      'Seneste fejl på denne enhed (slet den, hvis du vil):';

  @override
  String get spellingTitle => 'Øvelse';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ord',
      one: '$count ord',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points point',
      one: '$points point',
    );
    return 'Du har øvet $_temp0 og samlet $_temp1.';
  }

  @override
  String get spellingNounHint => 'navneord – med der, die eller das';

  @override
  String get spellingAnswerIs => 'Svaret er';

  @override
  String get commonNext => 'NÆSTE';

  @override
  String get spellingSkip => 'Spring over';

  @override
  String get spellingDelete => 'Slet';

  @override
  String get spellingCheck => 'Tjek';

  @override
  String get wordListAllLearned => 'Du har lært alle ord på denne liste.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Der er $count ord tilbage på denne liste.',
      one: 'Der er $count ord tilbage på denne liste.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'ORDFORRÅD ($count)';
  }

  @override
  String get reminderBody => 'Dagens Daily Hive er klar. Fem minutters tysk?';

  @override
  String get reminderChannel => 'Daglig påmindelse';

  @override
  String get reminderChannelDesc =>
      'Én påmindelse om dagen, på det tidspunkt du vælger.';

  @override
  String get reminderSwitch => 'Daglig påmindelse';

  @override
  String reminderOnAt(String time) {
    return 'Et lille skub om dagen kl. $time';
  }

  @override
  String get reminderOff => 'Et lille skub om dagen, når det passer dig';

  @override
  String get reminderBlocked =>
      'Tillad notifikationer for Wortschatz i telefonens indstillinger for at få en påmindelse.';

  @override
  String get reminderTime => 'Tidspunkt for påmindelse';

  @override
  String commonMastery(int level, int max) {
    return 'Beherskelse $level af $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent % lært';
  }

  @override
  String get commonListen => 'Lyt';

  @override
  String get commonNoVoice =>
      'Ingen tysk stemme installeret. Tilføj en i enhedens indstillinger for tekst til tale.';

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
    return 'Nye orddata er klar. Opdater ($size)';
  }

  @override
  String get contentUpdating => 'Opdaterer ord…';

  @override
  String get contentUpdatedBanner =>
      'Ordene er opdateret. De vises næste gang, du åbner appen; optagelserne virker allerede.';

  @override
  String get contentChecking => 'Tjekker…';

  @override
  String get contentDownloading => 'Henter og tjekker filer…';

  @override
  String contentAvailable(int version, String size) {
    return 'Version $version er klar, $size';
  }

  @override
  String get contentUpdate => 'Opdater';

  @override
  String get contentUpdated =>
      'Opdateret. Nye ord vises næste gang, du åbner appen.';

  @override
  String get contentUpToDate => 'Nyeste version';

  @override
  String get contentCheck => 'Tjek';

  @override
  String get contentAppTooOld => 'Opdater appen for at få nyt indhold';

  @override
  String get contentStore => 'Butik';

  @override
  String get contentFailed => 'Kunne ikke opdatere. Dine ord er uændrede.';

  @override
  String get contentRetry => 'Prøv igen';

  @override
  String contentTitle(int version) {
    return 'Ordindhold · version $version';
  }

  @override
  String get contentAutoWifi => 'Opdater automatisk på wi-fi';

  @override
  String get contentAutoWifiSub => 'Aldrig på mobildata';

  @override
  String summaryCombo(int count) {
    return 'Kombo: $count i træk';
  }

  @override
  String get summaryNewBest => 'NY REKORD!';

  @override
  String summaryBestCombo(int count) {
    return 'Bedste kombo: $count i træk';
  }

  @override
  String get summaryPlayAgain => 'SPIL IGEN';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count af 3 stjerner',
      one: '$count af 3 stjerner',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'Læs ægte tyske historier, ord for ord';

  @override
  String get siblingWordbit => 'Et tysk ord, hver gang du låser op';

  @override
  String get siblingLeben => 'Bestå statsborgerskabsprøven';

  @override
  String get siblingAudiobookName => 'Tysk lydbog';

  @override
  String get siblingAudiobook => 'Lyt til historier efter niveau';
}
