// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get settingsLanguage => 'Appspråk';

  @override
  String get languageSearchHint => 'Søk etter språk';

  @override
  String get languageSystemDefault => 'Systemspråk';

  @override
  String languageFollowsDevice(String language) {
    return 'Følger enheten din · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz kunne ikke starte.\n\n$error';
  }

  @override
  String get navWords => 'Ord';

  @override
  String get navPractice => 'Øving';

  @override
  String get navSettings => 'Innstillinger';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Rekke: $count dager på rad',
      one: 'Rekke: $count dag på rad',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Poeng';

  @override
  String get homeToPractise => 'Skal øves';

  @override
  String get homeVocabulary => 'Ordforråd';

  @override
  String homeLevel(int level) {
    return 'Nivå $level';
  }

  @override
  String get homeLevelCaps => 'NIVÅ';

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
    return 'Nivå $level: $learned av $total ord lært';
  }

  @override
  String get homeStartHere => 'Start her';

  @override
  String get homeStartHereBody =>
      'Lær de første 10 ordene dine med lyd, og bruk dem så i spillene.';

  @override
  String get homeLearn10 => 'LÆR 10 ORD';

  @override
  String get homeGoal => 'Dagens mål';

  @override
  String get homeGoalReached => 'Dagens mål er nådd!';

  @override
  String get homeGoalReachedBody =>
      'Vi ses i morgen, eller spill videre for poeng.';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$done av $goal ord lært eller besvart riktig';
  }

  @override
  String get adsOutOfHints => 'Ingen flere hint';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se en kort reklame for $count hint til?',
      one: 'Se en kort reklame for $count hint til?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Ikke nå';

  @override
  String get adsWatchAd => 'Se reklame';

  @override
  String adsDoublePoints(int points) {
    return 'Doble poeng (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Gjenopprett rekken din på $days dager',
      one: 'Gjenopprett rekken din på $days dag',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Mer tysk fra Pratiyush';

  @override
  String get rulePluralOnly =>
      'Substantiv som bare finnes i flertall: flertall har alltid die.';

  @override
  String ruleCompound(String head) {
    return 'Sammensatte ord får artikkelen til siste ledd: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'De fleste substantiv som slutter på -$suffix, har $article.';
  }

  @override
  String get levelBeginner => 'Nybegynner';

  @override
  String get levelElementary => 'Grunnleggende';

  @override
  String get levelIntermediate => 'Middels';

  @override
  String get levelUpperIntermediate => 'Øvre middels';

  @override
  String get levelAllInSequence => 'Alle nivåer i rekkefølge';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · anbefalt';

  @override
  String get levelOrChoose => 'Eller velg ett eller flere nivåer';

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
    return 'Nivå $level';
  }

  @override
  String get levelsKeepProgress =>
      'Fremgangen din lagres for hvert nivå, så du mister aldri et lært ord når du bytter.';

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
      other: '$count hint',
      one: '$count hint',
      zero: 'ingen hint',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Dagens brett, likt for alle';

  @override
  String practiceDailyDone(String stars) {
    return 'Fullført i dag: $stars. Trykk for å dele';
  }

  @override
  String get dddPerfect => 'Perfekt! Alle artikler riktige.';

  @override
  String get dddTip =>
      'Fargen hjelper hukommelsen: der svart, die rød, das gull.';

  @override
  String dddItsArticle(String article) {
    return 'Det er $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Lynraskt.';

  @override
  String get falleeKeepGoing =>
      'Fortsett: jo mer du spiller, desto raskere leser du.';

  @override
  String hiveRound(int round) {
    return 'Runde $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Ord $n av $total';
  }

  @override
  String get hiveCoach =>
      'Trykk eller dra over nabobokstaver for å stave det tyske ordet';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bokstaver igjen',
      one: '$count bokstav igjen',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Hint';

  @override
  String get hiveBoardCleared => 'Brettet er ryddet!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count poeng',
      one: '+$count poeng',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'DEL RESULTAT';

  @override
  String get commonDone => 'Ferdig';

  @override
  String get hiveNextRound => 'NESTE RUNDE';

  @override
  String get commonLearn => 'Lær';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Du har lært $count nye ord. De kommer tilbake til øving i morgen.',
      one:
          'Du har lært $count nytt ord. Det kommer tilbake til øving i morgen.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'SENERE';

  @override
  String get learnKnowIt => 'KAN DET';

  @override
  String get learnFlip => 'SNU';

  @override
  String get learnPluralOnly => 'bare flertall · alltid die';

  @override
  String learnPlural(String plural) {
    return 'fl. $plural';
  }

  @override
  String get onboardingIntro =>
      'Lær tyske ord mens du spiller. Hvilket nivå er du på?';

  @override
  String get onboardingStart => 'START';

  @override
  String get onboardingNotSure => 'Usikker? Start på A1';

  @override
  String get onboardingChangeLater =>
      'Du kan endre dette når som helst i Innstillinger.';

  @override
  String get practiceTitle => 'ØVING';

  @override
  String get practiceSpellDue => 'Stav ordene som skal øves';

  @override
  String get practiceLearnFirst => 'Lær noen ord først';

  @override
  String get practiceCaughtUp => 'Alt er gjort. Kom tilbake i morgen!';

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
  String get practiceGames => 'SPILL';

  @override
  String get practiceHiveSub => 'Sveip over bikaken for å stave hvert ord';

  @override
  String get practiceDddSub => 'Velg riktig artikkel';

  @override
  String get practiceFalleeSub => 'Velg betydningen før ordet lander';

  @override
  String get settingsTitle => 'INNSTILLINGER';

  @override
  String get settingsMadeBy => 'Laget med ❤️ av Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Nivåer';

  @override
  String get settingsAutoSpeak => 'Les opp ord automatisk';

  @override
  String get settingsAutoSpeakSub => 'På kort og etter svar';

  @override
  String get settingsGamesAsPractice => 'Tell spill som øving';

  @override
  String get settingsGamesAsPracticeSub =>
      'Svar i spill flytter lærte ord opp eller ned';

  @override
  String get settingsSounds => 'Lyd og vibrasjon';

  @override
  String get settingsSoundsSub => 'I spill og øving';

  @override
  String get settingsReset => 'Tilbakestill fremgang';

  @override
  String get settingsResetTitle => 'Tilbakestille fremgangen?';

  @override
  String get settingsResetBody =>
      'Da glemmes alle lærte ord, poengene dine og rekken din.';

  @override
  String get commonCancel => 'Avbryt';

  @override
  String get settingsResetConfirm => 'Tilbakestill';

  @override
  String get settingsPrivacyChoices => 'Personvern og annonsevalg';

  @override
  String get settingsPrivacyPolicy => 'Personvernerklæring';

  @override
  String get settingsContact => 'Kontakt kundestøtte';

  @override
  String get settingsLicences => 'Lisenser for åpen kildekode';

  @override
  String settingsAbout(int count) {
    return '$count vanlige tyske ord med engelske oversettelser og innspilt uttale. Ingen betalingsmur: alle ord og spill er gratis.';
  }

  @override
  String get settingsMailLastError =>
      'Siste feil på denne enheten (slett den hvis du vil):';

  @override
  String get spellingTitle => 'Øving';

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
      other: '$points poeng',
      one: '$points poeng',
    );
    return 'Du har øvd på $_temp0 og samlet $_temp1.';
  }

  @override
  String get spellingNounHint => 'substantiv – ta med der, die eller das';

  @override
  String get spellingAnswerIs => 'Svaret er';

  @override
  String get commonNext => 'NESTE';

  @override
  String get spellingSkip => 'Hopp over';

  @override
  String get spellingDelete => 'Slett';

  @override
  String get spellingCheck => 'Sjekk';

  @override
  String get wordListAllLearned => 'Du har lært alle ordene i denne listen.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Det er $count ord igjen i denne listen.',
      one: 'Det er $count ord igjen i denne listen.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'ORDFORRÅD ($count)';
  }

  @override
  String get reminderBody =>
      'Dagens Daily Hive er klar. Fem minutter med tysk?';

  @override
  String get reminderChannel => 'Daglig påminnelse';

  @override
  String get reminderChannelDesc =>
      'Én påminnelse om dagen, på tidspunktet du velger.';

  @override
  String get reminderSwitch => 'Daglig påminnelse';

  @override
  String reminderOnAt(String time) {
    return 'Et lite dytt om dagen kl. $time';
  }

  @override
  String get reminderOff => 'Et lite dytt om dagen, når det passer deg';

  @override
  String get reminderBlocked =>
      'Tillat varsler for Wortschatz i telefoninnstillingene for å få en påminnelse.';

  @override
  String get reminderTime => 'Tidspunkt for påminnelse';

  @override
  String commonMastery(int level, int max) {
    return 'Mestring $level av $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent % lært';
  }

  @override
  String get commonListen => 'Lytt';

  @override
  String get commonNoVoice =>
      'Ingen tysk stemme er installert. Legg til en i innstillingene for tekst til tale på enheten.';

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
    return 'Nye orddata er klare. Oppdater ($size)';
  }

  @override
  String get contentUpdating => 'Oppdaterer ord…';

  @override
  String get contentUpdatedBanner =>
      'Ordene er oppdatert. De vises neste gang du åpner appen; opptakene virker allerede.';

  @override
  String get contentChecking => 'Sjekker…';

  @override
  String get contentDownloading => 'Laster ned og sjekker filer…';

  @override
  String contentAvailable(int version, String size) {
    return 'Versjon $version er klar, $size';
  }

  @override
  String get contentUpdate => 'Oppdater';

  @override
  String get contentUpdated =>
      'Oppdatert. Nye ord vises neste gang du åpner appen.';

  @override
  String get contentUpToDate => 'Nyeste versjon';

  @override
  String get contentCheck => 'Sjekk';

  @override
  String get contentAppTooOld => 'Oppdater appen for å få nytt innhold';

  @override
  String get contentStore => 'Butikk';

  @override
  String get contentFailed => 'Kunne ikke oppdatere. Ordene dine er uendret.';

  @override
  String get contentRetry => 'Prøv igjen';

  @override
  String contentTitle(int version) {
    return 'Ordinnhold · versjon $version';
  }

  @override
  String get contentAutoWifi => 'Oppdater automatisk på wifi';

  @override
  String get contentAutoWifiSub => 'Aldri på mobildata';

  @override
  String summaryCombo(int count) {
    return 'Kombo: $count på rad';
  }

  @override
  String get summaryNewBest => 'NY REKORD!';

  @override
  String summaryBestCombo(int count) {
    return 'Beste kombo: $count på rad';
  }

  @override
  String get summaryPlayAgain => 'SPILL IGJEN';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count av 3 stjerner',
      one: '$count av 3 stjerner',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'Les ekte tyske historier, ord for ord';

  @override
  String get siblingWordbit => 'Et tysk ord hver gang du låser opp';

  @override
  String get siblingLeben => 'Bestå statsborgerprøven';

  @override
  String get siblingAudiobookName => 'Tysk lydbok';

  @override
  String get siblingAudiobook => 'Lytt til historier etter nivå';
}
