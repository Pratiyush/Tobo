// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get settingsLanguage => 'Appspråk';

  @override
  String get languageSearchHint => 'Sök språk';

  @override
  String get languageSystemDefault => 'Systemets språk';

  @override
  String languageFollowsDevice(String language) {
    return 'Följer din enhet · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz kunde inte starta.\n\n$error';
  }

  @override
  String get navWords => 'Ord';

  @override
  String get navPractice => 'Öva';

  @override
  String get navSettings => 'Inställningar';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Svit: $count dagar i rad',
      one: 'Svit: $count dag i rad',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Poäng';

  @override
  String get homeToPractise => 'Att öva på';

  @override
  String get homeVocabulary => 'Ordförråd';

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
    return 'Nivå $level: $learned av $total ord inlärda';
  }

  @override
  String get homeStartHere => 'Börja här';

  @override
  String get homeStartHereBody =>
      'Lär dig dina första 10 ord med ljud och använd dem sedan i spelen.';

  @override
  String get homeLearn10 => 'LÄR DIG 10 ORD';

  @override
  String get homeGoal => 'Dagens mål';

  @override
  String get homeGoalReached => 'Dagens mål uppnått!';

  @override
  String get homeGoalReachedBody =>
      'Vi ses i morgon, eller fortsätt spela för poäng.';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$done av $goal ord inlärda eller rätt besvarade';
  }

  @override
  String get adsOutOfHints => 'Slut på ledtrådar';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se en kort annons för $count ledtrådar till?',
      one: 'Se en kort annons för $count ledtråd till?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Inte nu';

  @override
  String get adsWatchAd => 'Se annons';

  @override
  String adsDoublePoints(int points) {
    return 'Dubbla poäng (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Återställ din svit på $days dagar',
      one: 'Återställ din svit på $days dag',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Mer tyska från Pratiyush';

  @override
  String get rulePluralOnly =>
      'Substantiv som bara finns i plural: plural har alltid die.';

  @override
  String ruleCompound(String head) {
    return 'Sammansatta ord får artikeln från sin sista del: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'De flesta substantiv som slutar på -$suffix har $article.';
  }

  @override
  String get levelBeginner => 'Nybörjare';

  @override
  String get levelElementary => 'Grundläggande';

  @override
  String get levelIntermediate => 'Mellannivå';

  @override
  String get levelUpperIntermediate => 'Övre mellannivå';

  @override
  String get levelAllInSequence => 'Alla nivåer i ordning';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · rekommenderas';

  @override
  String get levelOrChoose => 'Eller välj en eller flera nivåer';

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
      'Dina framsteg sparas för varje nivå, så du tappar aldrig ett inlärt ord när du byter.';

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
      other: '$count ledtrådar',
      one: '$count ledtråd',
      zero: 'inga ledtrådar',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Dagens bräde, samma för alla';

  @override
  String practiceDailyDone(String stars) {
    return 'Klart i dag: $stars. Tryck för att dela';
  }

  @override
  String get dddPerfect => 'Perfekt! Alla artiklar rätt.';

  @override
  String get dddTip => 'Färgen hjälper minnet: der svart, die röd, das guld.';

  @override
  String dddItsArticle(String article) {
    return 'Det är $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Blixtsnabbt.';

  @override
  String get falleeKeepGoing =>
      'Fortsätt: ju mer du spelar, desto snabbare läser du.';

  @override
  String hiveRound(int round) {
    return 'Runda $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Ord $n av $total';
  }

  @override
  String get hiveCoach =>
      'Tryck eller dra över intilliggande bokstäver för att stava det tyska ordet';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bokstäver kvar',
      one: '$count bokstav kvar',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Ledtråd';

  @override
  String get hiveBoardCleared => 'Brädet klart!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count poäng',
      one: '+$count poäng',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'DELA RESULTAT';

  @override
  String get commonDone => 'Klar';

  @override
  String get hiveNextRound => 'NÄSTA RUNDA';

  @override
  String get commonLearn => 'Lär dig';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Du lärde dig $count nya ord. De kommer tillbaka för övning i morgon.',
      one:
          'Du lärde dig $count nytt ord. Det kommer tillbaka för övning i morgon.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'SENARE';

  @override
  String get learnKnowIt => 'KAN DET';

  @override
  String get learnFlip => 'VÄND';

  @override
  String get learnPluralOnly => 'bara plural · alltid die';

  @override
  String learnPlural(String plural) {
    return 'pl. $plural';
  }

  @override
  String get onboardingIntro =>
      'Lär dig tyska ord genom att spela. Vilken nivå har du?';

  @override
  String get onboardingStart => 'STARTA';

  @override
  String get onboardingNotSure => 'Osäker? Börja på A1';

  @override
  String get onboardingChangeLater =>
      'Du kan ändra det när som helst i Inställningar.';

  @override
  String get practiceTitle => 'ÖVA';

  @override
  String get practiceSpellDue => 'Stava orden som ska repeteras';

  @override
  String get practiceLearnFirst => 'Lär dig några ord först';

  @override
  String get practiceCaughtUp => 'Allt klart. Kom tillbaka i morgon!';

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
  String get practiceGames => 'SPEL';

  @override
  String get practiceHiveSub => 'Svep över bikakan för att stava varje ord';

  @override
  String get practiceDddSub => 'Välj rätt artikel';

  @override
  String get practiceFalleeSub => 'Välj betydelsen innan ordet landar';

  @override
  String get settingsTitle => 'INSTÄLLNINGAR';

  @override
  String get settingsMadeBy => 'Gjord med ❤️ av Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Nivåer';

  @override
  String get settingsAutoSpeak => 'Läs upp ord automatiskt';

  @override
  String get settingsAutoSpeakSub => 'På kort och efter svar';

  @override
  String get settingsGamesAsPractice => 'Räkna spel som övning';

  @override
  String get settingsGamesAsPracticeSub =>
      'Svar i spel flyttar inlärda ord upp eller ner';

  @override
  String get settingsSounds => 'Ljud och vibration';

  @override
  String get settingsSoundsSub => 'I spel och övning';

  @override
  String get settingsReset => 'Återställ framsteg';

  @override
  String get settingsResetTitle => 'Återställa framsteg?';

  @override
  String get settingsResetBody =>
      'Då glöms alla inlärda ord, dina poäng och din svit bort.';

  @override
  String get commonCancel => 'Avbryt';

  @override
  String get settingsResetConfirm => 'Återställ';

  @override
  String get settingsPrivacyChoices => 'Integritet och annonsval';

  @override
  String get settingsPrivacyPolicy => 'Integritetspolicy';

  @override
  String get settingsContact => 'Kontakta support';

  @override
  String get settingsLicences => 'Licenser för öppen källkod';

  @override
  String settingsAbout(int count) {
    return '$count vanliga tyska ord med engelska översättningar och inspelat uttal. Ingen betalvägg: alla ord och spel är gratis.';
  }

  @override
  String get settingsMailLastError =>
      'Senaste felet på den här enheten (radera om du vill):';

  @override
  String get spellingTitle => 'Öva';

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
      other: '$points poäng',
      one: '$points poäng',
    );
    return 'Du övade på $_temp0 och fick $_temp1.';
  }

  @override
  String get spellingNounHint => 'substantiv – ta med der, die eller das';

  @override
  String get spellingAnswerIs => 'Rätt svar är';

  @override
  String get commonNext => 'NÄSTA';

  @override
  String get spellingSkip => 'Hoppa över';

  @override
  String get spellingDelete => 'Radera';

  @override
  String get spellingCheck => 'Kontrollera';

  @override
  String get wordListAllLearned => 'Du har lärt dig alla ord i den här listan.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Det finns $count ord kvar i den här listan.',
      one: 'Det finns $count ord kvar i den här listan.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'ORDFÖRRÅD ($count)';
  }

  @override
  String get reminderBody => 'Dagens Daily Hive är klar. Fem minuter tyska?';

  @override
  String get reminderChannel => 'Daglig påminnelse';

  @override
  String get reminderChannelDesc =>
      'En påminnelse om dagen, vid den tid du väljer.';

  @override
  String get reminderSwitch => 'Daglig påminnelse';

  @override
  String reminderOnAt(String time) {
    return 'En knuff om dagen kl. $time';
  }

  @override
  String get reminderOff => 'En knuff om dagen, vid en tid du väljer';

  @override
  String get reminderBlocked =>
      'Tillåt aviseringar för Wortschatz i telefonens inställningar för att få en påminnelse.';

  @override
  String get reminderTime => 'Tid för påminnelse';

  @override
  String commonMastery(int level, int max) {
    return 'Behärskning $level av $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent % inlärt';
  }

  @override
  String get commonListen => 'Lyssna';

  @override
  String get commonNoVoice =>
      'Ingen tysk röst installerad. Lägg till en i enhetens inställningar för text till tal.';

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
    return 'Ny orddata finns. Uppdatera ($size)';
  }

  @override
  String get contentUpdating => 'Uppdaterar ord…';

  @override
  String get contentUpdatedBanner =>
      'Orden är uppdaterade. De syns nästa gång du öppnar appen; inspelningarna fungerar redan.';

  @override
  String get contentChecking => 'Kontrollerar…';

  @override
  String get contentDownloading => 'Laddar ner och kontrollerar filer…';

  @override
  String contentAvailable(int version, String size) {
    return 'Version $version finns, $size';
  }

  @override
  String get contentUpdate => 'Uppdatera';

  @override
  String get contentUpdated =>
      'Uppdaterat. Nya ord syns nästa gång du öppnar appen.';

  @override
  String get contentUpToDate => 'Aktuellt';

  @override
  String get contentCheck => 'Kontrollera';

  @override
  String get contentAppTooOld => 'Uppdatera appen för att få nytt innehåll';

  @override
  String get contentStore => 'Butik';

  @override
  String get contentFailed => 'Kunde inte uppdatera. Dina ord är oförändrade.';

  @override
  String get contentRetry => 'Försök igen';

  @override
  String contentTitle(int version) {
    return 'Ordinnehåll · version $version';
  }

  @override
  String get contentAutoWifi => 'Uppdatera automatiskt via wifi';

  @override
  String get contentAutoWifiSub => 'Aldrig via mobildata';

  @override
  String summaryCombo(int count) {
    return 'Kombo: $count i rad';
  }

  @override
  String get summaryNewBest => 'NYTT REKORD!';

  @override
  String summaryBestCombo(int count) {
    return 'Bästa kombo: $count i rad';
  }

  @override
  String get summaryPlayAgain => 'SPELA IGEN';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count av 3 stjärnor',
      one: '$count av 3 stjärnor',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'Läs riktiga tyska berättelser, ord för ord';

  @override
  String get siblingWordbit => 'Ett tyskt ord varje gång du låser upp';

  @override
  String get siblingLeben => 'Klara medborgarskapsprovet';

  @override
  String get siblingAudiobookName => 'Tysk ljudbok';

  @override
  String get siblingAudiobook => 'Lyssna på berättelser efter nivå';
}
