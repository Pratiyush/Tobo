// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get settingsLanguage => 'App-taal';

  @override
  String get languageSearchHint => 'Talen zoeken';

  @override
  String get languageSystemDefault => 'Systeemtaal';

  @override
  String languageFollowsDevice(String language) {
    return 'Volgt je apparaat · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz kon niet starten.\n\n$error';
  }

  @override
  String get navWords => 'Woorden';

  @override
  String get navPractice => 'Oefenen';

  @override
  String get navSettings => 'Instellingen';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Reeks: $count dagen',
      one: 'Reeks: $count dag',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Punten';

  @override
  String get homeToPractise => 'Te oefenen';

  @override
  String get homeVocabulary => 'Woordenschat';

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
      other: '$count woorden',
      one: '$count woord',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Niveau $level: $learned van $total woorden geleerd';
  }

  @override
  String get homeStartHere => 'Begin hier';

  @override
  String get homeStartHereBody =>
      'Leer je eerste 10 woorden met geluid en speel er daarna mee in de spellen.';

  @override
  String get homeLearn10 => 'LEER 10 WOORDEN';

  @override
  String get homeGoal => 'Dagdoel';

  @override
  String get homeGoalReached => 'Dagdoel gehaald!';

  @override
  String get homeGoalReachedBody => 'Tot morgen, of speel door voor punten.';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$done van $goal woorden geleerd of goed beantwoord';
  }

  @override
  String get adsOutOfHints => 'Geen hints meer';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Korte advertentie kijken voor nog $count hints?',
      one: 'Korte advertentie kijken voor nog $count hint?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Niet nu';

  @override
  String get adsWatchAd => 'Reclame kijken';

  @override
  String adsDoublePoints(int points) {
    return 'Dubbele punten (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Herstel je reeks van $days dagen',
      one: 'Herstel je reeks van $days dag',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Meer Duits van Pratiyush';

  @override
  String get rulePluralOnly =>
      'Alleen-meervoudwoord: het meervoud krijgt altijd die.';

  @override
  String ruleCompound(String head) {
    return 'Samengestelde woorden krijgen het lidwoord van hun laatste deel: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'De meeste zelfstandige naamwoorden op -$suffix krijgen $article.';
  }

  @override
  String get levelBeginner => 'Beginner';

  @override
  String get levelElementary => 'Basis';

  @override
  String get levelIntermediate => 'Halfgevorderd';

  @override
  String get levelUpperIntermediate => 'Hoger halfgevorderd';

  @override
  String get levelAllInSequence => 'Alle niveaus op volgorde';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · aanbevolen';

  @override
  String get levelOrChoose => 'Of kies een of meer niveaus';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count woorden',
      one: '$count woord',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Niveau $level';
  }

  @override
  String get levelsKeepProgress =>
      'Je voortgang blijft per niveau bewaard, dus wisselen kost je nooit een geleerd woord.';

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
      zero: 'geen hints',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Het bord van vandaag, voor iedereen gelijk';

  @override
  String practiceDailyDone(String stars) {
    return 'Vandaag gedaan: $stars. Tik om te delen';
  }

  @override
  String get dddPerfect => 'Perfekt! Elk lidwoord goed.';

  @override
  String get dddTip =>
      'Kleur helpt je onthouden: der zwart, die rood, das goud.';

  @override
  String dddItsArticle(String article) {
    return 'Het is $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Bliksemsnel.';

  @override
  String get falleeKeepGoing =>
      'Ga door: hoe meer je speelt, hoe sneller je leest.';

  @override
  String hiveRound(int round) {
    return 'Ronde $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Woord $n van $total';
  }

  @override
  String get hiveCoach =>
      'Tik of veeg over aangrenzende letters om het Duitse woord te spellen';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nog $count letters',
      one: 'Nog $count letter',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Hint';

  @override
  String get hiveBoardCleared => 'Bord voltooid!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count punten',
      one: '+$count punt',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'DEEL RESULTAAT';

  @override
  String get commonDone => 'Klaar';

  @override
  String get hiveNextRound => 'VOLGENDE RONDE';

  @override
  String get commonLearn => 'Leren';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Je hebt $count nieuwe woorden geleerd. Morgen komen ze terug om te oefenen.',
      one:
          'Je hebt $count nieuw woord geleerd. Morgen komt het terug om te oefenen.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'LATER';

  @override
  String get learnKnowIt => 'KEN IK';

  @override
  String get learnFlip => 'OMDRAAIEN';

  @override
  String get learnPluralOnly => 'alleen meervoud · altijd die';

  @override
  String learnPlural(String plural) {
    return 'mv. $plural';
  }

  @override
  String get onboardingIntro =>
      'Leer Duitse woorden door te spelen. Wat is je niveau?';

  @override
  String get onboardingStart => 'START';

  @override
  String get onboardingNotSure => 'Twijfel je? Begin bij A1';

  @override
  String get onboardingChangeLater =>
      'Je kunt dit altijd wijzigen in Instellingen.';

  @override
  String get practiceTitle => 'OEFENEN';

  @override
  String get practiceSpellDue => 'Spel de woorden die aan de beurt zijn';

  @override
  String get practiceLearnFirst => 'Leer eerst een paar woorden';

  @override
  String get practiceCaughtUp => 'Je bent helemaal bij. Kom morgen terug!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count woorden',
      one: '$count woord',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'SPELLEN';

  @override
  String get practiceHiveSub =>
      'Veeg over de honingraat om elk woord te spellen';

  @override
  String get practiceDddSub => 'Kies het juiste lidwoord';

  @override
  String get practiceFalleeSub => 'Kies de betekenis voordat het woord landt';

  @override
  String get settingsTitle => 'INSTELLINGEN';

  @override
  String get settingsMadeBy => 'Gemaakt met ❤️ door Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Niveaus';

  @override
  String get settingsAutoSpeak => 'Woorden automatisch uitspreken';

  @override
  String get settingsAutoSpeakSub => 'Op flashcards en na antwoorden';

  @override
  String get settingsGamesAsPractice => 'Spellen tellen als oefening';

  @override
  String get settingsGamesAsPracticeSub =>
      'Antwoorden in spellen zetten geleerde woorden hoger of lager';

  @override
  String get settingsSounds => 'Geluid en trillen';

  @override
  String get settingsSoundsSub => 'In spellen en bij het oefenen';

  @override
  String get settingsReset => 'Voortgang wissen';

  @override
  String get settingsResetTitle => 'Voortgang wissen?';

  @override
  String get settingsResetBody =>
      'Hiermee verdwijnen alle geleerde woorden, je punten en je reeks.';

  @override
  String get commonCancel => 'Annuleren';

  @override
  String get settingsResetConfirm => 'Wissen';

  @override
  String get settingsPrivacyChoices => 'Privacy en advertenties';

  @override
  String get settingsPrivacyPolicy => 'Privacybeleid';

  @override
  String get settingsContact => 'Contact met support';

  @override
  String get settingsLicences => 'Opensourcelicenties';

  @override
  String settingsAbout(int count) {
    return '$count veelgebruikte Duitse woorden met Engelse vertalingen en opgenomen uitspraak. Geen betaalmuur: elk woord en elk spel is gratis.';
  }

  @override
  String get settingsMailLastError =>
      'Laatste fout op dit apparaat (verwijder dit gerust):';

  @override
  String get spellingTitle => 'Oefenen';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count woorden',
      one: '$count woord',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points punten',
      one: '$points punt',
    );
    return 'Je hebt $_temp0 geoefend en $_temp1 verdiend.';
  }

  @override
  String get spellingNounHint => 'zelfstandig naamwoord: met der, die of das';

  @override
  String get spellingAnswerIs => 'Het antwoord is';

  @override
  String get commonNext => 'VOLGENDE';

  @override
  String get spellingSkip => 'Overslaan';

  @override
  String get spellingDelete => 'Wissen';

  @override
  String get spellingCheck => 'Controleer';

  @override
  String get wordListAllLearned => 'Je hebt elk woord in deze lijst geleerd.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Er zijn nog $count woorden over in deze lijst.',
      one: 'Er is nog $count woord over in deze lijst.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'WOORDENSCHAT ($count)';
  }

  @override
  String get reminderBody =>
      'De Daily Hive van vandaag staat klaar. Vijf minuten Duits?';

  @override
  String get reminderChannel => 'Dagelijkse herinnering';

  @override
  String get reminderChannelDesc =>
      'Eén herinnering per dag, op het tijdstip dat jij kiest.';

  @override
  String get reminderSwitch => 'Dagelijkse herinnering';

  @override
  String reminderOnAt(String time) {
    return 'Eén seintje per dag om $time';
  }

  @override
  String get reminderOff => 'Eén seintje per dag, op een tijd die jij kiest';

  @override
  String get reminderBlocked =>
      'Sta meldingen voor Wortschatz toe in de instellingen van je telefoon om een herinnering te krijgen.';

  @override
  String get reminderTime => 'Tijdstip herinnering';

  @override
  String commonMastery(int level, int max) {
    return 'Beheersing $level van $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent% geleerd';
  }

  @override
  String get commonListen => 'Luisteren';

  @override
  String get commonNoVoice =>
      'Geen Duitse stem geïnstalleerd. Voeg er een toe in de instellingen voor tekst-naar-spraak van je apparaat.';

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
    return 'Nieuwe woorddata beschikbaar. Bijwerken ($size)';
  }

  @override
  String get contentUpdating => 'Woorden bijwerken…';

  @override
  String get contentUpdatedBanner =>
      'Woorden bijgewerkt. Ze verschijnen de volgende keer dat je de app opent; opnames werken al.';

  @override
  String get contentChecking => 'Controleren…';

  @override
  String get contentDownloading => 'Bestanden downloaden en controleren…';

  @override
  String contentAvailable(int version, String size) {
    return 'Versie $version beschikbaar, $size';
  }

  @override
  String get contentUpdate => 'Bijwerken';

  @override
  String get contentUpdated =>
      'Bijgewerkt. Nieuwe woorden verschijnen de volgende keer dat je de app opent.';

  @override
  String get contentUpToDate => 'Up-to-date';

  @override
  String get contentCheck => 'Controleer';

  @override
  String get contentAppTooOld => 'Werk de app bij voor nieuwe inhoud';

  @override
  String get contentStore => 'Store';

  @override
  String get contentFailed =>
      'Bijwerken mislukt. Je woorden zijn niet veranderd.';

  @override
  String get contentRetry => 'Opnieuw';

  @override
  String contentTitle(int version) {
    return 'Woordinhoud · versie $version';
  }

  @override
  String get contentAutoWifi => 'Automatisch bijwerken via wifi';

  @override
  String get contentAutoWifiSub => 'Nooit via mobiele data';

  @override
  String summaryCombo(int count) {
    return 'Combo: $count op rij';
  }

  @override
  String get summaryNewBest => 'RECORD!';

  @override
  String summaryBestCombo(int count) {
    return 'Beste combo: $count op rij';
  }

  @override
  String get summaryPlayAgain => 'NOG EEN KEER';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count van 3 sterren',
      one: '$count van 3 sterren',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'Lees echte Duitse verhalen, woord voor woord';

  @override
  String get siblingWordbit => 'Een Duits woord elke keer dat je ontgrendelt';

  @override
  String get siblingLeben => 'Slaag voor de naturalisatietest';

  @override
  String get siblingAudiobookName => 'Duits luisterboek';

  @override
  String get siblingAudiobook => 'Luister naar verhalen per niveau';
}
