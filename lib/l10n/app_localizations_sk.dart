// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get settingsLanguage => 'Jazyk aplikácie';

  @override
  String get languageSearchHint => 'Hľadať jazyky';

  @override
  String get languageSystemDefault => 'Jazyk systému';

  @override
  String languageFollowsDevice(String language) {
    return 'Podľa zariadenia · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Aplikáciu Wortschatz sa nepodarilo spustiť.\n\n$error';
  }

  @override
  String get navWords => 'Slová';

  @override
  String get navPractice => 'Cvičenie';

  @override
  String get navSettings => 'Nastavenia';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Séria: $count dní',
      many: 'Séria: $count dní',
      few: 'Séria: $count dni',
      one: 'Séria: $count deň',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Body';

  @override
  String get homeToPractise => 'Na cvičenie';

  @override
  String get homeVocabulary => 'Slovná zásoba';

  @override
  String homeLevel(int level) {
    return 'Úroveň $level';
  }

  @override
  String get homeLevelCaps => 'ÚROVEŇ';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slov',
      many: '$count slov',
      few: '$count slová',
      one: '$count slovo',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Úroveň $level: naučené slová $learned z $total';
  }

  @override
  String get homeStartHere => 'Začni tu';

  @override
  String get homeStartHereBody =>
      'Nauč sa prvých 10 slov so zvukom a potom si ich zahraj v hrách.';

  @override
  String get homeLearn10 => 'NAUČ SA 10 SLOV';

  @override
  String get homeGoal => 'Dnešný cieľ';

  @override
  String get homeGoalReached => 'Dnešný cieľ splnený!';

  @override
  String get homeGoalReachedBody =>
      'Uvidíme sa zajtra, alebo hraj ďalej a zbieraj body.';

  @override
  String homeGoalProgress(int done, int goal) {
    return 'Slová naučené alebo správne zodpovedané: $done z $goal';
  }

  @override
  String get adsOutOfHints => 'Došli ti nápovedy';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pozrieš si krátku reklamu za $count nápovied navyše?',
      many: 'Pozrieš si krátku reklamu za $count nápovied navyše?',
      few: 'Pozrieš si krátku reklamu za $count nápovedy navyše?',
      one: 'Pozrieš si krátku reklamu za $count nápovedu navyše?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Teraz nie';

  @override
  String get adsWatchAd => 'Pustiť reklamu';

  @override
  String adsDoublePoints(int points) {
    return 'Dvojité body (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Obnov si sériu: $days dní',
      many: 'Obnov si sériu: $days dní',
      few: 'Obnov si sériu: $days dni',
      one: 'Obnov si sériu: $days deň',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Viac nemčiny od Pratiyusha';

  @override
  String get rulePluralOnly =>
      'Podstatné meno len v množnom čísle: množné číslo má vždy die.';

  @override
  String ruleCompound(String head) {
    return 'Zložené slová majú člen svojej poslednej časti: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'Väčšina podstatných mien na -$suffix má $article.';
  }

  @override
  String get levelBeginner => 'Začiatočník';

  @override
  String get levelElementary => 'Mierne pokročilý';

  @override
  String get levelIntermediate => 'Stredne pokročilý';

  @override
  String get levelUpperIntermediate => 'Vyššie stredne pokročilý';

  @override
  String get levelAllInSequence => 'Všetky úrovne postupne';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · odporúčané';

  @override
  String get levelOrChoose => 'Alebo vyber jednu či viac úrovní';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slov',
      many: '$count slov',
      few: '$count slová',
      one: '$count slovo',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Úroveň $level';
  }

  @override
  String get levelsKeepProgress =>
      'Pokrok sa ukladá pre každú úroveň, takže prepnutím nikdy neprídeš o naučené slovo.';

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
      other: '$count nápovied',
      many: '$count nápovied',
      few: '$count nápovedy',
      one: '$count nápoveda',
      zero: 'bez nápovied',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Dnešná hracia plocha, pre všetkých rovnaká';

  @override
  String practiceDailyDone(String stars) {
    return 'Dnes hotovo: $stars. Ťukni a zdieľaj';
  }

  @override
  String get dddPerfect => 'Perfekt! Všetky členy správne.';

  @override
  String get dddTip =>
      'Farba pomáha pamäti: der čierna, die červená, das zlatá.';

  @override
  String dddItsArticle(String article) {
    return 'Správne je $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Bleskovo rýchlo.';

  @override
  String get falleeKeepGoing =>
      'Len tak ďalej: čím viac hráš, tým rýchlejšie čítaš.';

  @override
  String hiveRound(int round) {
    return 'Kolo $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Slovo $n z $total';
  }

  @override
  String get hiveCoach =>
      'Ťukni na susedné písmená alebo nimi potiahni a zlož nemecké slovo';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zostáva $count písmen',
      many: 'Zostáva $count písmen',
      few: 'Zostávajú $count písmená',
      one: 'Zostáva $count písmeno',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Nápoveda';

  @override
  String get hiveBoardCleared => 'Plocha vyčistená!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count bodov',
      many: '+$count bodov',
      few: '+$count body',
      one: '+$count bod',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'ZDIEĽAŤ VÝSLEDOK';

  @override
  String get commonDone => 'Hotovo';

  @override
  String get hiveNextRound => 'ĎALŠIE KOLO';

  @override
  String get commonLearn => 'Učiť sa';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vieš $count nových slov. Zajtra sa vrátia na precvičenie.',
      many: 'Vieš $count nových slov. Zajtra sa vrátia na precvičenie.',
      few: 'Vieš $count nové slová. Zajtra sa vrátia na precvičenie.',
      one: 'Vieš $count nové slovo. Zajtra sa vráti na precvičenie.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'NESKÔR';

  @override
  String get learnKnowIt => 'VIEM';

  @override
  String get learnFlip => 'OTOČIŤ';

  @override
  String get learnPluralOnly => 'len množné číslo · vždy die';

  @override
  String learnPlural(String plural) {
    return 'mn. č. $plural';
  }

  @override
  String get onboardingIntro => 'Uč sa nemecké slová hrou. Akú máš úroveň?';

  @override
  String get onboardingStart => 'ZAČAŤ';

  @override
  String get onboardingNotSure => 'Nevieš? Začni na A1';

  @override
  String get onboardingChangeLater =>
      'Kedykoľvek to môžeš zmeniť v Nastaveniach.';

  @override
  String get practiceTitle => 'CVIČENIE';

  @override
  String get practiceSpellDue => 'Napíš slová, ktoré sú na rade';

  @override
  String get practiceLearnFirst => 'Najprv sa nauč pár slov';

  @override
  String get practiceCaughtUp => 'Všetko hotové. Príď zas zajtra!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slov',
      many: '$count slov',
      few: '$count slová',
      one: '$count slovo',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'HRY';

  @override
  String get practiceHiveSub => 'Potiahni po pláste a zlož každé slovo';

  @override
  String get practiceDddSub => 'Vyber správny člen';

  @override
  String get practiceFalleeSub => 'Vyber význam skôr, ako slovo dopadne';

  @override
  String get settingsTitle => 'NASTAVENIA';

  @override
  String get settingsMadeBy => 'S ❤️ vytvoril Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Úrovne';

  @override
  String get settingsAutoSpeak => 'Automaticky vyslovovať slová';

  @override
  String get settingsAutoSpeakSub => 'Na kartičkách a po odpovediach';

  @override
  String get settingsGamesAsPractice => 'Počítať hry ako cvičenie';

  @override
  String get settingsGamesAsPracticeSub =>
      'Odpovede v hrách posúvajú naučené slová hore alebo dole';

  @override
  String get settingsSounds => 'Zvuky a vibrácie';

  @override
  String get settingsSoundsSub => 'V hrách a cvičení';

  @override
  String get settingsReset => 'Resetovať pokrok';

  @override
  String get settingsResetTitle => 'Resetovať pokrok?';

  @override
  String get settingsResetBody =>
      'Zabudnú sa všetky naučené slová, tvoje body aj séria.';

  @override
  String get commonCancel => 'Zrušiť';

  @override
  String get settingsResetConfirm => 'Resetovať';

  @override
  String get settingsPrivacyChoices => 'Súkromie a voľby reklám';

  @override
  String get settingsPrivacyPolicy => 'Zásady ochrany súkromia';

  @override
  String get settingsContact => 'Kontaktovať podporu';

  @override
  String get settingsLicences => 'Licencie open source';

  @override
  String settingsAbout(int count) {
    return 'Bežné nemecké slová ($count) s anglickými prekladmi a nahratou výslovnosťou. Nič sa neplatí: všetky slová aj hry sú zadarmo.';
  }

  @override
  String get settingsMailLastError =>
      'Posledná chyba na tomto zariadení (pokojne ju vymaž):';

  @override
  String get spellingTitle => 'Cvičenie';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slov',
      many: '$count slov',
      few: '$count slová',
      one: '$count slovo',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points bodov',
      many: '$points bodov',
      few: '$points body',
      one: '$points bod',
    );
    return 'Precvičené: $_temp0, nazbierané: $_temp1.';
  }

  @override
  String get spellingNounHint =>
      'podstatné meno — so členom der, die alebo das';

  @override
  String get spellingAnswerIs => 'Správna odpoveď je';

  @override
  String get commonNext => 'ĎALEJ';

  @override
  String get spellingSkip => 'Preskočiť';

  @override
  String get spellingDelete => 'Vymazať';

  @override
  String get spellingCheck => 'Skontrolovať';

  @override
  String get wordListAllLearned => 'Už vieš každé slovo z tohto zoznamu.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'V tomto zozname zostáva $count slov.',
      many: 'V tomto zozname zostáva $count slov.',
      few: 'V tomto zozname zostávajú $count slová.',
      one: 'V tomto zozname zostáva $count slovo.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'SLOVNÁ ZÁSOBA ($count)';
  }

  @override
  String get reminderBody =>
      'Dnešný Daily Hive je pripravený. Päť minút nemčiny?';

  @override
  String get reminderChannel => 'Denná pripomienka';

  @override
  String get reminderChannelDesc =>
      'Jedna pripomienka denne v čase, ktorý si vyberieš.';

  @override
  String get reminderSwitch => 'Denná pripomienka';

  @override
  String reminderOnAt(String time) {
    return 'Jedno štuchnutie denne o $time';
  }

  @override
  String get reminderOff => 'Jedno štuchnutie denne v čase, ktorý si vyberieš';

  @override
  String get reminderBlocked =>
      'Povoľ upozornenia pre Wortschatz v nastaveniach telefónu a dostaneš pripomienku.';

  @override
  String get reminderTime => 'Čas pripomienky';

  @override
  String commonMastery(int level, int max) {
    return 'Zvládnutie $level z $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return 'Naučené $percent %';
  }

  @override
  String get commonListen => 'Vypočuť';

  @override
  String get commonNoVoice =>
      'Nie je nainštalovaný nemecký hlas. Pridaj ho v nastaveniach prevodu textu na reč v zariadení.';

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
    return 'Nové údaje slov sú k dispozícii. Aktualizovať ($size)';
  }

  @override
  String get contentUpdating => 'Aktualizujú sa slová…';

  @override
  String get contentUpdatedBanner =>
      'Slová sú aktualizované. Zobrazia sa pri ďalšom otvorení aplikácie; nahrávky už fungujú.';

  @override
  String get contentChecking => 'Kontroluje sa…';

  @override
  String get contentDownloading => 'Sťahujú a kontrolujú sa súbory…';

  @override
  String contentAvailable(int version, String size) {
    return 'K dispozícii je verzia $version, $size';
  }

  @override
  String get contentUpdate => 'Aktualizovať';

  @override
  String get contentUpdated =>
      'Aktualizované. Nové slová sa zobrazia pri ďalšom otvorení aplikácie.';

  @override
  String get contentUpToDate => 'Aktuálne';

  @override
  String get contentCheck => 'Skontrolovať';

  @override
  String get contentAppTooOld => 'Aktualizuj aplikáciu a získaj nový obsah';

  @override
  String get contentStore => 'Obchod';

  @override
  String get contentFailed => 'Aktualizácia zlyhala. Tvoje slová sa nezmenili.';

  @override
  String get contentRetry => 'Skúsiť znova';

  @override
  String contentTitle(int version) {
    return 'Obsah slov · verzia $version';
  }

  @override
  String get contentAutoWifi => 'Aktualizovať automaticky cez Wi-Fi';

  @override
  String get contentAutoWifiSub => 'Nikdy cez mobilné dáta';

  @override
  String summaryCombo(int count) {
    return 'Kombo: $count za sebou';
  }

  @override
  String get summaryNewBest => 'NOVÝ REKORD!';

  @override
  String summaryBestCombo(int count) {
    return 'Najlepšie kombo: $count za sebou';
  }

  @override
  String get summaryPlayAgain => 'HRAŤ ZNOVA';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count z 3 hviezdičiek',
      many: '$count z 3 hviezdičiek',
      few: '$count z 3 hviezdičiek',
      one: '$count z 3 hviezdičiek',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'Čítaj skutočné nemecké príbehy slovo po slove';

  @override
  String get siblingWordbit => 'Nemecké slovo pri každom odomknutí';

  @override
  String get siblingLeben => 'Zvládni test na občianstvo';

  @override
  String get siblingAudiobookName => 'Nemecká audiokniha';

  @override
  String get siblingAudiobook => 'Počúvaj príbehy podľa úrovne';
}
