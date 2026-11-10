// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get settingsLanguage => 'Alkalmazás nyelve';

  @override
  String get languageSearchHint => 'Nyelv keresése';

  @override
  String get languageSystemDefault => 'Rendszer nyelve';

  @override
  String languageFollowsDevice(String language) {
    return 'Az eszköz szerint · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'A Wortschatz nem tudott elindulni.\n\n$error';
  }

  @override
  String get navWords => 'Szavak';

  @override
  String get navPractice => 'Gyakorlás';

  @override
  String get navSettings => 'Beállítások';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sorozat: $count nap',
      one: 'Sorozat: $count nap',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Pontok';

  @override
  String get homeToPractise => 'Gyakorlandó';

  @override
  String get homeVocabulary => 'Szókincs';

  @override
  String homeLevel(int level) {
    return '$level. szint';
  }

  @override
  String get homeLevelCaps => 'SZINT';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count szó',
      one: '$count szó',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return '$level szint: $total szóból $learned megtanulva';
  }

  @override
  String get homeStartHere => 'Kezdd itt';

  @override
  String get homeStartHereBody =>
      'Tanuld meg az első 10 szavadat hanggal, aztán játssz velük a játékokban.';

  @override
  String get homeLearn10 => 'TANULJ 10 SZÓT';

  @override
  String get homeGoal => 'Mai cél';

  @override
  String get homeGoalReached => 'Mai cél teljesítve!';

  @override
  String get homeGoalReachedBody =>
      'Holnap találkozunk, vagy játssz tovább a pontokért.';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$goal szóból $done megtanulva vagy jól megválaszolva';
  }

  @override
  String get adsOutOfHints => 'Elfogytak a tippek';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Megnézel egy rövid reklámot $count további tippért?',
      one: 'Megnézel egy rövid reklámot $count további tippért?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Most nem';

  @override
  String get adsWatchAd => 'Reklám nézése';

  @override
  String adsDoublePoints(int points) {
    return 'Dupla pont (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Sorozat visszaállítása ($days nap)',
      one: 'Sorozat visszaállítása ($days nap)',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Még több német Pratiyushtól';

  @override
  String get rulePluralOnly =>
      'Csak többes számú főnév: a többes szám mindig die.';

  @override
  String ruleCompound(String head) {
    return 'Az összetett szavak az utolsó tag névelőjét kapják: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'A legtöbb -$suffix végű főnév névelője $article.';
  }

  @override
  String get levelBeginner => 'Kezdő szint';

  @override
  String get levelElementary => 'Alapszint';

  @override
  String get levelIntermediate => 'Középszint';

  @override
  String get levelUpperIntermediate => 'Felső középszint';

  @override
  String get levelAllInSequence => 'Minden szint sorban';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · ajánlott';

  @override
  String get levelOrChoose => 'Vagy válassz egy vagy több szintet';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count szó',
      one: '$count szó',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return '$level szint';
  }

  @override
  String get levelsKeepProgress =>
      'A haladásod minden szinten megmarad, így váltáskor sosem veszítesz el megtanult szót.';

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
      other: '$count tipp',
      one: '$count tipp',
      zero: 'tipp nélkül',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'A mai tábla, mindenkinek ugyanaz';

  @override
  String practiceDailyDone(String stars) {
    return 'Mára kész: $stars. Koppints a megosztáshoz';
  }

  @override
  String get dddPerfect => 'Perfekt! Minden névelő helyes.';

  @override
  String get dddTip =>
      'A szín segít emlékezni: der fekete, die piros, das arany.';

  @override
  String dddItsArticle(String article) {
    return 'A helyes: $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Villámgyors.';

  @override
  String get falleeKeepGoing =>
      'Csak így tovább: minél többet játszol, annál gyorsabban olvasol.';

  @override
  String hiveRound(int round) {
    return '$round. kör';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Szó: $n/$total';
  }

  @override
  String get hiveCoach =>
      'Koppints vagy húzd az ujjad a szomszédos betűkön, és rakd ki a német szót';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Még $count betű',
      one: 'Még $count betű',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Tipp';

  @override
  String get hiveBoardCleared => 'Tábla kész!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count pont',
      one: '+$count pont',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'MEGOSZTÁS';

  @override
  String get commonDone => 'Kész';

  @override
  String get hiveNextRound => 'KÖVETKEZŐ KÖR';

  @override
  String get commonLearn => 'Tanulás';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Megtanultál $count új szót. Holnap újra előkerülnek gyakorlásra.',
      one: 'Megtanultál $count új szót. Holnap újra előkerül gyakorlásra.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'KÉSŐBB';

  @override
  String get learnKnowIt => 'TUDOM';

  @override
  String get learnFlip => 'MEGFORDÍT';

  @override
  String get learnPluralOnly => 'csak többes szám · mindig die';

  @override
  String learnPlural(String plural) {
    return 'tsz. $plural';
  }

  @override
  String get onboardingIntro =>
      'Tanulj német szavakat játszva. Milyen szinten vagy?';

  @override
  String get onboardingStart => 'KEZDÉS';

  @override
  String get onboardingNotSure => 'Nem tudod? Kezdd A1-gyel';

  @override
  String get onboardingChangeLater =>
      'Ezt bármikor módosíthatod a Beállításokban.';

  @override
  String get practiceTitle => 'GYAKORLÁS';

  @override
  String get practiceSpellDue => 'Írd le az esedékes szavakat';

  @override
  String get practiceLearnFirst => 'Előbb tanulj meg néhány szót';

  @override
  String get practiceCaughtUp => 'Minden kész. Gyere vissza holnap!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count szó',
      one: '$count szó',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'JÁTÉKOK';

  @override
  String get practiceHiveSub =>
      'Húzd az ujjad a méhsejteken át, és rakd ki a szavakat';

  @override
  String get practiceDddSub => 'Válaszd ki a helyes névelőt';

  @override
  String get practiceFalleeSub => 'Válaszd ki a jelentést, mielőtt a szó leér';

  @override
  String get settingsTitle => 'BEÁLLÍTÁSOK';

  @override
  String get settingsMadeBy =>
      'Szeretettel ❤️ készítette: Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Szintek';

  @override
  String get settingsAutoSpeak => 'Szavak automatikus felolvasása';

  @override
  String get settingsAutoSpeakSub => 'Kártyákon és válaszok után';

  @override
  String get settingsGamesAsPractice => 'A játék is gyakorlásnak számít';

  @override
  String get settingsGamesAsPracticeSub =>
      'A játékbeli válaszok feljebb vagy lejjebb viszik a megtanult szavakat';

  @override
  String get settingsSounds => 'Hangok és rezgés';

  @override
  String get settingsSoundsSub => 'Játékokban és gyakorlásnál';

  @override
  String get settingsReset => 'Haladás törlése';

  @override
  String get settingsResetTitle => 'Törlöd a haladást?';

  @override
  String get settingsResetBody =>
      'Ezzel törlődik minden megtanult szó, a pontjaid és a sorozatod.';

  @override
  String get commonCancel => 'Mégse';

  @override
  String get settingsResetConfirm => 'Törlés';

  @override
  String get settingsPrivacyChoices => 'Adatvédelem és hirdetések';

  @override
  String get settingsPrivacyPolicy => 'Adatvédelmi irányelvek';

  @override
  String get settingsContact => 'Írj az ügyfélszolgálatnak';

  @override
  String get settingsLicences => 'Nyílt forráskódú licencek';

  @override
  String settingsAbout(int count) {
    return '$count gyakori német szó angol fordítással és felvett kiejtéssel. Nincs fizetős tartalom: minden szó és játék ingyenes.';
  }

  @override
  String get settingsMailLastError =>
      'Utolsó hiba ezen az eszközön (nyugodtan töröld):';

  @override
  String get spellingTitle => 'Gyakorlás';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count szót',
      one: '$count szót',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points pontot',
      one: '$points pontot',
    );
    return '$_temp0 gyakoroltál, és $_temp1 gyűjtöttél.';
  }

  @override
  String get spellingNounHint => 'főnév — der, die vagy das névelővel';

  @override
  String get spellingAnswerIs => 'A helyes válasz';

  @override
  String get commonNext => 'TOVÁBB';

  @override
  String get spellingSkip => 'Kihagyás';

  @override
  String get spellingDelete => 'Törlés';

  @override
  String get spellingCheck => 'Ellenőrzés';

  @override
  String get wordListAllLearned => 'Ebből a listából minden szót megtanultál.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Még $count szó van hátra ebből a listából.',
      one: 'Még $count szó van hátra ebből a listából.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'SZÓKINCS ($count)';
  }

  @override
  String get reminderBody => 'Kész a mai Daily Hive. Öt perc német?';

  @override
  String get reminderChannel => 'Napi emlékeztető';

  @override
  String get reminderChannelDesc =>
      'Napi egy emlékeztető, az általad választott időben.';

  @override
  String get reminderSwitch => 'Napi emlékeztető';

  @override
  String reminderOnAt(String time) {
    return 'Napi egy kis emlékeztető $time-kor';
  }

  @override
  String get reminderOff => 'Napi egy kis emlékeztető, amikor neked jó';

  @override
  String get reminderBlocked =>
      'Engedélyezd a Wortschatz értesítéseit a telefon beállításaiban, hogy emlékeztetőt kapj.';

  @override
  String get reminderTime => 'Emlékeztető ideje';

  @override
  String commonMastery(int level, int max) {
    return 'Elsajátítás: $level/$max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent% megtanulva';
  }

  @override
  String get commonListen => 'Meghallgatás';

  @override
  String get commonNoVoice =>
      'Nincs telepítve német hang. Adj hozzá egyet az eszköz szövegfelolvasó beállításaiban.';

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
    return 'Új szóadatok érhetők el. Frissítés ($size)';
  }

  @override
  String get contentUpdating => 'Szavak frissítése…';

  @override
  String get contentUpdatedBanner =>
      'A szavak frissültek. Az app következő megnyitásakor jelennek meg; a felvételek már működnek.';

  @override
  String get contentChecking => 'Ellenőrzés…';

  @override
  String get contentDownloading => 'Fájlok letöltése és ellenőrzése…';

  @override
  String contentAvailable(int version, String size) {
    return '$version. verzió elérhető, $size';
  }

  @override
  String get contentUpdate => 'Frissítés';

  @override
  String get contentUpdated =>
      'Frissítve. Az új szavak az app következő megnyitásakor jelennek meg.';

  @override
  String get contentUpToDate => 'Naprakész';

  @override
  String get contentCheck => 'Ellenőrzés';

  @override
  String get contentAppTooOld => 'Frissítsd az appot az új tartalomhoz';

  @override
  String get contentStore => 'Áruház';

  @override
  String get contentFailed =>
      'Nem sikerült frissíteni. A szavaid nem változtak.';

  @override
  String get contentRetry => 'Próbáld újra';

  @override
  String contentTitle(int version) {
    return 'Szótartalom · $version. verzió';
  }

  @override
  String get contentAutoWifi => 'Automatikus frissítés wifin';

  @override
  String get contentAutoWifiSub => 'Mobilneten soha';

  @override
  String summaryCombo(int count) {
    return 'Kombó: $count egymás után';
  }

  @override
  String get summaryNewBest => 'ÚJ REKORD!';

  @override
  String summaryBestCombo(int count) {
    return 'Legjobb kombó: $count egymás után';
  }

  @override
  String get summaryPlayAgain => 'JÁTSSZ ÚJRA';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '3-ból $count csillag',
      one: '3-ból $count csillag',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'Olvass valódi német történeteket, szóról szóra';

  @override
  String get siblingWordbit => 'Egy német szó minden feloldáskor';

  @override
  String get siblingLeben => 'Tedd le az állampolgársági tesztet';

  @override
  String get siblingAudiobookName => 'Német hangoskönyv';

  @override
  String get siblingAudiobook => 'Hallgass szintenkénti történeteket';
}
