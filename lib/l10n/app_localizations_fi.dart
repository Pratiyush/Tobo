// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get settingsLanguage => 'Sovelluksen kieli';

  @override
  String get languageSearchHint => 'Hae kieliä';

  @override
  String get languageSystemDefault => 'Järjestelmän kieli';

  @override
  String languageFollowsDevice(String language) {
    return 'Laitteen mukaan · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz ei käynnistynyt.\n\n$error';
  }

  @override
  String get navWords => 'Sanat';

  @override
  String get navPractice => 'Harjoitus';

  @override
  String get navSettings => 'Asetukset';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Putki: $count päivää',
      one: 'Putki: $count päivä',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Pisteet';

  @override
  String get homeToPractise => 'Kerrattavat';

  @override
  String get homeVocabulary => 'Sanasto';

  @override
  String homeLevel(int level) {
    return 'Taso $level';
  }

  @override
  String get homeLevelCaps => 'TASO';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sanaa',
      one: '$count sana',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Taso $level: opittu $learned/$total sanaa';
  }

  @override
  String get homeStartHere => 'Aloita tästä';

  @override
  String get homeStartHereBody =>
      'Opi ensimmäiset 10 sanaasi äänen kera ja käytä niitä sitten peleissä.';

  @override
  String get homeLearn10 => 'OPI 10 SANAA';

  @override
  String get homeGoal => 'Päivän tavoite';

  @override
  String get homeGoalReached => 'Päivän tavoite täynnä!';

  @override
  String get homeGoalReachedBody =>
      'Nähdään huomenna, tai jatka pelaamista ja kerää pisteitä.';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$done/$goal sanaa opittu tai vastattu oikein';
  }

  @override
  String get adsOutOfHints => 'Vihjeet loppuivat';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Katsotko lyhyen mainoksen, niin saat $count vihjettä lisää?',
      one: 'Katsotko lyhyen mainoksen, niin saat $count vihjeen lisää?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Ei nyt';

  @override
  String get adsWatchAd => 'Katso mainos';

  @override
  String adsDoublePoints(int points) {
    return 'Tuplapisteet (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Palauta $days päivän putkesi',
      one: 'Palauta $days päivän putkesi',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Lisää saksaa Pratiyushilta';

  @override
  String get rulePluralOnly =>
      'Vain monikossa esiintyvä substantiivi: monikossa on aina die.';

  @override
  String ruleCompound(String head) {
    return 'Yhdyssana saa viimeisen osansa artikkelin: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'Useimmilla -$suffix-päätteisillä substantiiveilla on $article.';
  }

  @override
  String get levelBeginner => 'Alkeistaso';

  @override
  String get levelElementary => 'Perustaso';

  @override
  String get levelIntermediate => 'Keskitaso';

  @override
  String get levelUpperIntermediate => 'Ylempi keskitaso';

  @override
  String get levelAllInSequence => 'Kaikki tasot järjestyksessä';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · suositus';

  @override
  String get levelOrChoose => 'Tai valitse yksi tai useampi taso';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sanaa',
      one: '$count sana',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Taso $level';
  }

  @override
  String get levelsKeepProgress =>
      'Edistymisesi säilyy jokaisella tasolla, joten vaihtaminen ei koskaan hukkaa opittua sanaa.';

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
      other: '$count vihjettä',
      one: '$count vihje',
      zero: 'ei vihjeitä',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Päivän pelilauta, sama kaikille';

  @override
  String practiceDailyDone(String stars) {
    return 'Tehty tänään: $stars. Jaa napauttamalla';
  }

  @override
  String get dddPerfect => 'Perfekt! Kaikki artikkelit oikein.';

  @override
  String get dddTip =>
      'Väri auttaa muistamaan: der musta, die punainen, das kulta.';

  @override
  String dddItsArticle(String article) {
    return 'Se on $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Salamannopea.';

  @override
  String get falleeKeepGoing =>
      'Jatka vain: mitä enemmän pelaat, sitä nopeammin luet.';

  @override
  String hiveRound(int round) {
    return 'Kierros $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Sana $n/$total';
  }

  @override
  String get hiveCoach =>
      'Napauta tai vedä vierekkäisten kirjainten yli ja kirjoita saksan sana';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kirjainta jäljellä',
      one: '$count kirjain jäljellä',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Vihje';

  @override
  String get hiveBoardCleared => 'Lauta tyhjennetty!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count pistettä',
      one: '+$count piste',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'JAA TULOS';

  @override
  String get commonDone => 'Valmis';

  @override
  String get hiveNextRound => 'SEURAAVA KIERROS';

  @override
  String get commonLearn => 'Opi';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Opit $count uutta sanaa. Ne palaavat harjoiteltavaksi huomenna.',
      one: 'Opit $count uuden sanan. Se palaa harjoiteltavaksi huomenna.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'EI VIELÄ';

  @override
  String get learnKnowIt => 'OSAAN';

  @override
  String get learnFlip => 'KÄÄNNÄ';

  @override
  String get learnPluralOnly => 'vain monikko · aina die';

  @override
  String learnPlural(String plural) {
    return 'mon. $plural';
  }

  @override
  String get onboardingIntro => 'Opi saksan sanoja pelaamalla. Mikä on tasosi?';

  @override
  String get onboardingStart => 'ALOITA';

  @override
  String get onboardingNotSure => 'Et ole varma? Aloita tasolta A1';

  @override
  String get onboardingChangeLater =>
      'Voit muuttaa tätä milloin vain Asetuksissa.';

  @override
  String get practiceTitle => 'HARJOITUS';

  @override
  String get practiceSpellDue => 'Kirjoita kerrattavat sanat';

  @override
  String get practiceLearnFirst => 'Opi ensin muutama sana';

  @override
  String get practiceCaughtUp => 'Kaikki tehty. Tule huomenna takaisin!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sanaa',
      one: '$count sana',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'PELIT';

  @override
  String get practiceHiveSub =>
      'Pyyhkäise hunajakennon yli ja kirjoita jokainen sana';

  @override
  String get practiceDddSub => 'Valitse oikea artikkeli';

  @override
  String get practiceFalleeSub => 'Valitse merkitys ennen kuin sana putoaa';

  @override
  String get settingsTitle => 'ASETUKSET';

  @override
  String get settingsMadeBy => 'Rakkaudella ❤️ tehnyt Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Tasot';

  @override
  String get settingsAutoSpeak => 'Lue sanat ääneen automaattisesti';

  @override
  String get settingsAutoSpeakSub => 'Korteissa ja vastausten jälkeen';

  @override
  String get settingsGamesAsPractice => 'Pelit lasketaan harjoitukseksi';

  @override
  String get settingsGamesAsPracticeSub =>
      'Pelivastaukset siirtävät opittuja sanoja ylös tai alas';

  @override
  String get settingsSounds => 'Äänet ja värinä';

  @override
  String get settingsSoundsSub => 'Peleissä ja harjoituksissa';

  @override
  String get settingsReset => 'Nollaa edistyminen';

  @override
  String get settingsResetTitle => 'Nollataanko edistyminen?';

  @override
  String get settingsResetBody =>
      'Kaikki opitut sanat, pisteesi ja putkesi unohtuvat.';

  @override
  String get commonCancel => 'Peruuta';

  @override
  String get settingsResetConfirm => 'Nollaa';

  @override
  String get settingsPrivacyChoices => 'Tietosuoja ja mainosvalinnat';

  @override
  String get settingsPrivacyPolicy => 'Tietosuojaseloste';

  @override
  String get settingsContact => 'Ota yhteyttä tukeen';

  @override
  String get settingsLicences => 'Avoimen lähdekoodin lisenssit';

  @override
  String settingsAbout(int count) {
    return 'Yleisiä saksan sanoja ($count) englanninkielisin käännöksin ja äänitetyin ääntämyksin. Ei maksumuuria: kaikki sanat ja pelit ovat ilmaisia.';
  }

  @override
  String get settingsMailLastError =>
      'Viimeisin virhe tällä laitteella (poista, jos haluat):';

  @override
  String get spellingTitle => 'Harjoitus';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sanaa',
      one: '$count sanan',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points pistettä',
      one: '$points pisteen',
    );
    return 'Kertasit $_temp0 ja keräsit $_temp1.';
  }

  @override
  String get spellingNounHint => 'substantiivi – lisää der, die tai das';

  @override
  String get spellingAnswerIs => 'Oikea vastaus on';

  @override
  String get commonNext => 'SEURAAVA';

  @override
  String get spellingSkip => 'Ohita';

  @override
  String get spellingDelete => 'Poista';

  @override
  String get spellingCheck => 'Tarkista';

  @override
  String get wordListAllLearned => 'Olet oppinut kaikki tämän listan sanat.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tällä listalla on jäljellä $count sanaa.',
      one: 'Tällä listalla on jäljellä $count sana.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'SANASTO ($count)';
  }

  @override
  String get reminderBody =>
      'Päivän Daily Hive on valmis. Viisi minuuttia saksaa?';

  @override
  String get reminderChannel => 'Päivittäinen muistutus';

  @override
  String get reminderChannelDesc =>
      'Yksi muistutus päivässä, valitsemaasi aikaan.';

  @override
  String get reminderSwitch => 'Päivittäinen muistutus';

  @override
  String reminderOnAt(String time) {
    return 'Yksi pieni muistutus päivässä klo $time';
  }

  @override
  String get reminderOff =>
      'Yksi pieni muistutus päivässä, valitsemaasi aikaan';

  @override
  String get reminderBlocked =>
      'Salli Wortschatzin ilmoitukset puhelimen asetuksista, niin saat muistutuksen.';

  @override
  String get reminderTime => 'Muistutuksen aika';

  @override
  String commonMastery(int level, int max) {
    return 'Osaaminen $level/$max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent % opittu';
  }

  @override
  String get commonListen => 'Kuuntele';

  @override
  String get commonNoVoice =>
      'Saksankielistä puheääntä ei ole asennettu. Lisää se laitteen tekstistä puheeksi -asetuksissa.';

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
    return 'Uutta sanadataa saatavilla. Päivitä ($size)';
  }

  @override
  String get contentUpdating => 'Päivitetään sanoja…';

  @override
  String get contentUpdatedBanner =>
      'Sanat päivitetty. Ne näkyvät, kun avaat sovelluksen seuraavan kerran; äänitteet toimivat jo.';

  @override
  String get contentChecking => 'Tarkistetaan…';

  @override
  String get contentDownloading => 'Ladataan ja tarkistetaan tiedostoja…';

  @override
  String contentAvailable(int version, String size) {
    return 'Versio $version saatavilla, $size';
  }

  @override
  String get contentUpdate => 'Päivitä';

  @override
  String get contentUpdated =>
      'Päivitetty. Uudet sanat näkyvät, kun avaat sovelluksen seuraavan kerran.';

  @override
  String get contentUpToDate => 'Ajan tasalla';

  @override
  String get contentCheck => 'Tarkista';

  @override
  String get contentAppTooOld => 'Päivitä sovellus, niin saat uutta sisältöä';

  @override
  String get contentStore => 'Kauppa';

  @override
  String get contentFailed => 'Päivitys epäonnistui. Sanasi ovat ennallaan.';

  @override
  String get contentRetry => 'Yritä uudelleen';

  @override
  String contentTitle(int version) {
    return 'Sanasisältö · versio $version';
  }

  @override
  String get contentAutoWifi => 'Päivitä automaattisesti Wi-Fi-yhteydellä';

  @override
  String get contentAutoWifiSub => 'Ei koskaan mobiilidatalla';

  @override
  String summaryCombo(int count) {
    return 'Kombo: $count peräkkäin';
  }

  @override
  String get summaryNewBest => 'ENNÄTYS!';

  @override
  String summaryBestCombo(int count) {
    return 'Paras kombo: $count peräkkäin';
  }

  @override
  String get summaryPlayAgain => 'PELAA TAAS';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tähteä kolmesta',
      one: '$count tähti kolmesta',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle =>
      'Lue aitoja saksankielisiä tarinoita sana sanalta';

  @override
  String get siblingWordbit => 'Saksan sana aina, kun avaat lukituksen';

  @override
  String get siblingLeben => 'Läpäise kansalaisuuskoe';

  @override
  String get siblingAudiobookName => 'Saksankielinen äänikirja';

  @override
  String get siblingAudiobook => 'Kuuntele tarinoita tasoittain';
}
