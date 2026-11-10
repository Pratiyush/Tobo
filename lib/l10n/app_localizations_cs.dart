// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get settingsLanguage => 'Jazyk aplikace';

  @override
  String get languageSearchHint => 'Hledat jazyky';

  @override
  String get languageSystemDefault => 'Jazyk systému';

  @override
  String languageFollowsDevice(String language) {
    return 'Podle zařízení · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Aplikaci Wortschatz se nepodařilo spustit.\n\n$error';
  }

  @override
  String get navWords => 'Slova';

  @override
  String get navPractice => 'Cvičení';

  @override
  String get navSettings => 'Nastavení';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Série: $count dní',
      many: 'Série: $count dní',
      few: 'Série: $count dny',
      one: 'Série: $count den',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Body';

  @override
  String get homeToPractise => 'K procvičení';

  @override
  String get homeVocabulary => 'Slovní zásoba';

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
      few: '$count slova',
      one: '$count slovo',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Úroveň $level: naučená slova $learned z $total';
  }

  @override
  String get homeStartHere => 'Začni tady';

  @override
  String get homeStartHereBody =>
      'Nauč se prvních 10 slov se zvukem a pak si je zahraj ve hrách.';

  @override
  String get homeLearn10 => 'NAUČ SE 10 SLOV';

  @override
  String get homeGoal => 'Dnešní cíl';

  @override
  String get homeGoalReached => 'Dnešní cíl splněn!';

  @override
  String get homeGoalReachedBody =>
      'Uvidíme se zítra, nebo hraj dál a sbírej body.';

  @override
  String homeGoalProgress(int done, int goal) {
    return 'Slova naučená nebo správně zodpovězená: $done z $goal';
  }

  @override
  String get adsOutOfHints => 'Došly ti nápovědy';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Podíváš se na krátkou reklamu za $count nápověd navíc?',
      many: 'Podíváš se na krátkou reklamu za $count nápověd navíc?',
      few: 'Podíváš se na krátkou reklamu za $count nápovědy navíc?',
      one: 'Podíváš se na krátkou reklamu za $count nápovědu navíc?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Teď ne';

  @override
  String get adsWatchAd => 'Pustit reklamu';

  @override
  String adsDoublePoints(int points) {
    return 'Dvojité body (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Obnov si sérii: $days dní',
      many: 'Obnov si sérii: $days dní',
      few: 'Obnov si sérii: $days dny',
      one: 'Obnov si sérii: $days den',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Víc němčiny od Pratiyushe';

  @override
  String get rulePluralOnly =>
      'Podstatné jméno jen v množném čísle: množné číslo má vždy die.';

  @override
  String ruleCompound(String head) {
    return 'Složená slova mají člen své poslední části: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'Většina podstatných jmen zakončených na -$suffix má $article.';
  }

  @override
  String get levelBeginner => 'Začátečník';

  @override
  String get levelElementary => 'Mírně pokročilý';

  @override
  String get levelIntermediate => 'Středně pokročilý';

  @override
  String get levelUpperIntermediate => 'Vyšší středně pokročilý';

  @override
  String get levelAllInSequence => 'Všechny úrovně postupně';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · doporučeno';

  @override
  String get levelOrChoose => 'Nebo vyber jednu či více úrovní';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slov',
      many: '$count slov',
      few: '$count slova',
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
      'Pokrok se ukládá pro každou úroveň, takže přepnutím nikdy nepřijdeš o naučené slovo.';

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
      other: '$count nápověd',
      many: '$count nápověd',
      few: '$count nápovědy',
      one: '$count nápověda',
      zero: 'bez nápověd',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Dnešní hrací plocha, pro všechny stejná';

  @override
  String practiceDailyDone(String stars) {
    return 'Dnes hotovo: $stars. Klepni a sdílej';
  }

  @override
  String get dddPerfect => 'Perfekt! Všechny členy správně.';

  @override
  String get dddTip =>
      'Barva pomáhá paměti: der černá, die červená, das zlatá.';

  @override
  String dddItsArticle(String article) {
    return 'Správně je $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Bleskově rychle.';

  @override
  String get falleeKeepGoing =>
      'Jen tak dál: čím víc hraješ, tím rychleji čteš.';

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
      'Klepni na sousední písmena nebo jimi táhni a slož německé slovo';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zbývá $count písmen',
      many: 'Zbývá $count písmen',
      few: 'Zbývají $count písmena',
      one: 'Zbývá $count písmeno',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Nápověda';

  @override
  String get hiveBoardCleared => 'Plocha vyčištěna!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count bodů',
      many: '+$count bodů',
      few: '+$count body',
      one: '+$count bod',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'SDÍLET VÝSLEDEK';

  @override
  String get commonDone => 'Hotovo';

  @override
  String get hiveNextRound => 'DALŠÍ KOLO';

  @override
  String get commonLearn => 'Učit se';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Umíš $count nových slov. Zítra se vrátí k procvičení.',
      many: 'Umíš $count nových slov. Zítra se vrátí k procvičení.',
      few: 'Umíš $count nová slova. Zítra se vrátí k procvičení.',
      one: 'Umíš $count nové slovo. Zítra se vrátí k procvičení.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'POZDĚJI';

  @override
  String get learnKnowIt => 'UMÍM';

  @override
  String get learnFlip => 'OTOČIT';

  @override
  String get learnPluralOnly => 'jen množné číslo · vždy die';

  @override
  String learnPlural(String plural) {
    return 'mn. č. $plural';
  }

  @override
  String get onboardingIntro => 'Uč se německá slova hrou. Jakou máš úroveň?';

  @override
  String get onboardingStart => 'ZAČÍT';

  @override
  String get onboardingNotSure => 'Nevíš? Začni na A1';

  @override
  String get onboardingChangeLater => 'Kdykoli to můžeš změnit v Nastavení.';

  @override
  String get practiceTitle => 'CVIČENÍ';

  @override
  String get practiceSpellDue => 'Napiš slova, která jsou na řadě';

  @override
  String get practiceLearnFirst => 'Nejdřív se nauč pár slov';

  @override
  String get practiceCaughtUp => 'Vše hotovo. Přijď zase zítra!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slov',
      many: '$count slov',
      few: '$count slova',
      one: '$count slovo',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'HRY';

  @override
  String get practiceHiveSub => 'Táhni po plástvi a slož každé slovo';

  @override
  String get practiceDddSub => 'Vyber správný člen';

  @override
  String get practiceFalleeSub => 'Vyber význam, než slovo dopadne';

  @override
  String get settingsTitle => 'NASTAVENÍ';

  @override
  String get settingsMadeBy => 'S ❤️ vytvořil Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Úrovně';

  @override
  String get settingsAutoSpeak => 'Automaticky vyslovovat slova';

  @override
  String get settingsAutoSpeakSub => 'Na kartičkách a po odpovědích';

  @override
  String get settingsGamesAsPractice => 'Počítat hry jako cvičení';

  @override
  String get settingsGamesAsPracticeSub =>
      'Odpovědi ve hrách posouvají naučená slova nahoru či dolů';

  @override
  String get settingsSounds => 'Zvuky a vibrace';

  @override
  String get settingsSoundsSub => 'Ve hrách a cvičení';

  @override
  String get settingsReset => 'Resetovat pokrok';

  @override
  String get settingsResetTitle => 'Resetovat pokrok?';

  @override
  String get settingsResetBody =>
      'Zapomenou se všechna naučená slova, tvoje body i série.';

  @override
  String get commonCancel => 'Zrušit';

  @override
  String get settingsResetConfirm => 'Resetovat';

  @override
  String get settingsPrivacyChoices => 'Soukromí a volby reklam';

  @override
  String get settingsPrivacyPolicy => 'Zásady ochrany soukromí';

  @override
  String get settingsContact => 'Kontaktovat podporu';

  @override
  String get settingsLicences => 'Licence open source';

  @override
  String settingsAbout(int count) {
    return 'Běžná německá slova ($count) s anglickými překlady a nahranou výslovností. Nic se neplatí: všechna slova i hry jsou zdarma.';
  }

  @override
  String get settingsMailLastError =>
      'Poslední chyba na tomto zařízení (klidně ji smaž):';

  @override
  String get spellingTitle => 'Cvičení';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slov',
      many: '$count slov',
      few: '$count slova',
      one: '$count slovo',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points bodů',
      many: '$points bodů',
      few: '$points body',
      one: '$points bod',
    );
    return 'Procvičeno: $_temp0, nasbíráno: $_temp1.';
  }

  @override
  String get spellingNounHint =>
      'podstatné jméno — se členem der, die nebo das';

  @override
  String get spellingAnswerIs => 'Správná odpověď je';

  @override
  String get commonNext => 'DALŠÍ';

  @override
  String get spellingSkip => 'Přeskočit';

  @override
  String get spellingDelete => 'Smazat';

  @override
  String get spellingCheck => 'Zkontrolovat';

  @override
  String get wordListAllLearned => 'Umíš už každé slovo z tohoto seznamu.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'V tomto seznamu zbývá $count slov.',
      many: 'V tomto seznamu zbývá $count slov.',
      few: 'V tomto seznamu zbývají $count slova.',
      one: 'V tomto seznamu zbývá $count slovo.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'SLOVNÍ ZÁSOBA ($count)';
  }

  @override
  String get reminderBody =>
      'Dnešní Daily Hive je připravený. Pět minut němčiny?';

  @override
  String get reminderChannel => 'Denní připomínka';

  @override
  String get reminderChannelDesc =>
      'Jedna připomínka denně v čase, který si vybereš.';

  @override
  String get reminderSwitch => 'Denní připomínka';

  @override
  String reminderOnAt(String time) {
    return 'Jedno šťouchnutí denně v $time';
  }

  @override
  String get reminderOff => 'Jedno šťouchnutí denně v čase, který si vybereš';

  @override
  String get reminderBlocked =>
      'Povol oznámení pro Wortschatz v nastavení telefonu a dostaneš připomínku.';

  @override
  String get reminderTime => 'Čas připomínky';

  @override
  String commonMastery(int level, int max) {
    return 'Zvládnutí $level z $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return 'Naučeno $percent %';
  }

  @override
  String get commonListen => 'Poslechnout';

  @override
  String get commonNoVoice =>
      'Není nainstalovaný německý hlas. Přidej ho v nastavení převodu textu na řeč v zařízení.';

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
    return 'Nová data slov k dispozici. Aktualizovat ($size)';
  }

  @override
  String get contentUpdating => 'Aktualizace slov…';

  @override
  String get contentUpdatedBanner =>
      'Slova jsou aktualizovaná. Objeví se při příštím otevření aplikace; nahrávky už fungují.';

  @override
  String get contentChecking => 'Kontrola…';

  @override
  String get contentDownloading => 'Stahování a kontrola souborů…';

  @override
  String contentAvailable(int version, String size) {
    return 'K dispozici verze $version, $size';
  }

  @override
  String get contentUpdate => 'Aktualizovat';

  @override
  String get contentUpdated =>
      'Aktualizováno. Nová slova se objeví při příštím otevření aplikace.';

  @override
  String get contentUpToDate => 'Aktuální';

  @override
  String get contentCheck => 'Zkontrolovat';

  @override
  String get contentAppTooOld => 'Pro nový obsah aktualizuj aplikaci';

  @override
  String get contentStore => 'Obchod';

  @override
  String get contentFailed =>
      'Aktualizace se nezdařila. Tvoje slova se nezměnila.';

  @override
  String get contentRetry => 'Zkusit znovu';

  @override
  String contentTitle(int version) {
    return 'Obsah slov · verze $version';
  }

  @override
  String get contentAutoWifi => 'Aktualizovat automaticky přes Wi-Fi';

  @override
  String get contentAutoWifiSub => 'Nikdy přes mobilní data';

  @override
  String summaryCombo(int count) {
    return 'Kombo: $count v řadě';
  }

  @override
  String get summaryNewBest => 'NOVÝ REKORD!';

  @override
  String summaryBestCombo(int count) {
    return 'Nejlepší kombo: $count v řadě';
  }

  @override
  String get summaryPlayAgain => 'HRÁT ZNOVU';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ze 3 hvězdiček',
      many: '$count ze 3 hvězdiček',
      few: '$count ze 3 hvězdiček',
      one: '$count ze 3 hvězdiček',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'Čti skutečné německé příběhy slovo po slově';

  @override
  String get siblingWordbit => 'Německé slovo při každém odemknutí';

  @override
  String get siblingLeben => 'Zvládni test k občanství';

  @override
  String get siblingAudiobookName => 'Německá audiokniha';

  @override
  String get siblingAudiobook => 'Poslouchej příběhy podle úrovně';
}
