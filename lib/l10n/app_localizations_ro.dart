// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get settingsLanguage => 'Limba aplicației';

  @override
  String get languageSearchHint => 'Caută limbi';

  @override
  String get languageSystemDefault => 'Limba sistemului';

  @override
  String languageFollowsDevice(String language) {
    return 'Ca pe dispozitiv · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz nu a putut porni.\n\n$error';
  }

  @override
  String get navWords => 'Cuvinte';

  @override
  String get navPractice => 'Exersare';

  @override
  String get navSettings => 'Setări';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Serie: $count de zile',
      few: 'Serie: $count zile',
      one: 'Serie: $count zi',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Puncte';

  @override
  String get homeToPractise => 'De exersat';

  @override
  String get homeVocabulary => 'Vocabular';

  @override
  String homeLevel(int level) {
    return 'Nivelul $level';
  }

  @override
  String get homeLevelCaps => 'NIVEL';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de cuvinte',
      few: '$count cuvinte',
      one: '$count cuvânt',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Nivelul $level: cuvinte învățate $learned din $total';
  }

  @override
  String get homeStartHere => 'Începe aici';

  @override
  String get homeStartHereBody =>
      'Învață primele tale 10 cuvinte cu sunet, apoi joacă-te cu ele în jocuri.';

  @override
  String get homeLearn10 => 'ÎNVAȚĂ 10 CUVINTE';

  @override
  String get homeGoal => 'Obiectivul de azi';

  @override
  String get homeGoalReached => 'Obiectivul de azi, atins!';

  @override
  String get homeGoalReachedBody =>
      'Ne vedem mâine sau joacă mai departe pentru puncte.';

  @override
  String homeGoalProgress(int done, int goal) {
    return 'Cuvinte învățate sau cu răspuns corect: $done din $goal';
  }

  @override
  String get adsOutOfHints => 'Nu mai ai indicii';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Te uiți la o reclamă scurtă pentru încă $count de indicii?',
      few: 'Te uiți la o reclamă scurtă pentru încă $count indicii?',
      one: 'Te uiți la o reclamă scurtă pentru încă $count indiciu?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Nu acum';

  @override
  String get adsWatchAd => 'Vezi reclama';

  @override
  String adsDoublePoints(int points) {
    return 'Puncte duble (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Recuperează seria de $days de zile',
      few: 'Recuperează seria de $days zile',
      one: 'Recuperează seria de $days zi',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Mai multă germană de la Pratiyush';

  @override
  String get rulePluralOnly =>
      'Substantiv doar la plural: pluralul are mereu die.';

  @override
  String ruleCompound(String head) {
    return 'Cuvintele compuse iau articolul ultimei părți: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'Majoritatea substantivelor terminate în -$suffix au $article.';
  }

  @override
  String get levelBeginner => 'Începător';

  @override
  String get levelElementary => 'Elementar';

  @override
  String get levelIntermediate => 'Intermediar';

  @override
  String get levelUpperIntermediate => 'Intermediar avansat';

  @override
  String get levelAllInSequence => 'Toate nivelurile pe rând';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · recomandat';

  @override
  String get levelOrChoose => 'Sau alege unul sau mai multe niveluri';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de cuvinte',
      few: '$count cuvinte',
      one: '$count cuvânt',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Nivelul $level';
  }

  @override
  String get levelsKeepProgress =>
      'Progresul tău se păstrează pentru fiecare nivel, așa că schimbarea nu șterge niciun cuvânt învățat.';

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
      other: '$count de indicii',
      few: '$count indicii',
      one: '$count indiciu',
      zero: 'fără indicii',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Tabla de azi, aceeași pentru toți';

  @override
  String practiceDailyDone(String stars) {
    return 'Gata pentru azi: $stars. Atinge ca să distribui';
  }

  @override
  String get dddPerfect => 'Perfekt! Toate articolele corecte.';

  @override
  String get dddTip =>
      'Culoarea te ajută să ții minte: der negru, die roșu, das auriu.';

  @override
  String dddItsArticle(String article) {
    return 'Corect este $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Rapid ca fulgerul.';

  @override
  String get falleeKeepGoing =>
      'Continuă: cu cât joci mai mult, cu atât citești mai repede.';

  @override
  String hiveRound(int round) {
    return 'Runda $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Cuvântul $n din $total';
  }

  @override
  String get hiveCoach =>
      'Atinge sau trage peste literele vecine ca să scrii cuvântul german';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mai ai $count de litere',
      few: 'Mai ai $count litere',
      one: 'Mai ai $count literă',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Indiciu';

  @override
  String get hiveBoardCleared => 'Tablă rezolvată!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count de puncte',
      few: '+$count puncte',
      one: '+$count punct',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'DISTRIBUIE';

  @override
  String get commonDone => 'Gata';

  @override
  String get hiveNextRound => 'RUNDA URMĂTOARE';

  @override
  String get commonLearn => 'Învață';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ai învățat $count de cuvinte noi. Revin mâine la exersare.',
      few: 'Ai învățat $count cuvinte noi. Revin mâine la exersare.',
      one: 'Ai învățat $count cuvânt nou. Revine mâine la exersare.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'MAI TÂRZIU';

  @override
  String get learnKnowIt => 'ȘTIU';

  @override
  String get learnFlip => 'ÎNTOARCE';

  @override
  String get learnPluralOnly => 'doar plural · mereu die';

  @override
  String learnPlural(String plural) {
    return 'pl. $plural';
  }

  @override
  String get onboardingIntro =>
      'Învață cuvinte germane jucându-te. Ce nivel ai?';

  @override
  String get onboardingStart => 'START';

  @override
  String get onboardingNotSure => 'Nu știi sigur? Începe cu A1';

  @override
  String get onboardingChangeLater => 'Poți schimba asta oricând din Setări.';

  @override
  String get practiceTitle => 'EXERSARE';

  @override
  String get practiceSpellDue => 'Scrie cuvintele de repetat';

  @override
  String get practiceLearnFirst => 'Învață mai întâi câteva cuvinte';

  @override
  String get practiceCaughtUp => 'Ai terminat tot. Revino mâine!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de cuvinte',
      few: '$count cuvinte',
      one: '$count cuvânt',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'JOCURI';

  @override
  String get practiceHiveSub => 'Glisează pe fagure ca să scrii fiecare cuvânt';

  @override
  String get practiceDddSub => 'Alege articolul corect';

  @override
  String get practiceFalleeSub => 'Alege sensul înainte să cadă cuvântul';

  @override
  String get settingsTitle => 'SETĂRI';

  @override
  String get settingsMadeBy => 'Creat cu ❤️ de Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Niveluri';

  @override
  String get settingsAutoSpeak => 'Pronunță automat cuvintele';

  @override
  String get settingsAutoSpeakSub => 'Pe cartonașe și după răspunsuri';

  @override
  String get settingsGamesAsPractice => 'Jocurile contează ca exersare';

  @override
  String get settingsGamesAsPracticeSub =>
      'Răspunsurile din jocuri mută cuvintele învățate în sus sau în jos';

  @override
  String get settingsSounds => 'Sunete și vibrații';

  @override
  String get settingsSoundsSub => 'În jocuri și la exersare';

  @override
  String get settingsReset => 'Resetează progresul';

  @override
  String get settingsResetTitle => 'Resetezi progresul?';

  @override
  String get settingsResetBody =>
      'Se vor șterge toate cuvintele învățate, punctele și seria ta.';

  @override
  String get commonCancel => 'Anulează';

  @override
  String get settingsResetConfirm => 'Resetează';

  @override
  String get settingsPrivacyChoices => 'Confidențialitate și reclame';

  @override
  String get settingsPrivacyPolicy => 'Politica de confidențialitate';

  @override
  String get settingsContact => 'Contactează asistența';

  @override
  String get settingsLicences => 'Licențe open source';

  @override
  String settingsAbout(int count) {
    return 'Cuvinte germane uzuale ($count) cu traduceri în engleză și pronunție înregistrată. Nu plătești nimic: toate cuvintele și jocurile sunt gratuite.';
  }

  @override
  String get settingsMailLastError =>
      'Ultima eroare pe acest dispozitiv (șterge-o dacă vrei):';

  @override
  String get spellingTitle => 'Exersare';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de cuvinte',
      few: '$count cuvinte',
      one: '$count cuvânt',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points de puncte',
      few: '$points puncte',
      one: '$points punct',
    );
    return 'Ai exersat $_temp0 și ai adunat $_temp1.';
  }

  @override
  String get spellingNounHint => 'substantiv — cu der, die sau das';

  @override
  String get spellingAnswerIs => 'Răspunsul corect este';

  @override
  String get commonNext => 'URMĂTORUL';

  @override
  String get spellingSkip => 'Sari peste';

  @override
  String get spellingDelete => 'Șterge';

  @override
  String get spellingCheck => 'Verifică';

  @override
  String get wordListAllLearned =>
      'Ai învățat toate cuvintele din această listă.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mai ai $count de cuvinte în această listă.',
      few: 'Mai ai $count cuvinte în această listă.',
      one: 'Mai ai $count cuvânt în această listă.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'VOCABULAR ($count)';
  }

  @override
  String get reminderBody =>
      'Daily Hive de azi te așteaptă. Cinci minute de germană?';

  @override
  String get reminderChannel => 'Memento zilnic';

  @override
  String get reminderChannelDesc => 'Un memento pe zi, la ora pe care o alegi.';

  @override
  String get reminderSwitch => 'Memento zilnic';

  @override
  String reminderOnAt(String time) {
    return 'Un mic imbold pe zi, la $time';
  }

  @override
  String get reminderOff => 'Un mic imbold pe zi, la ce oră vrei';

  @override
  String get reminderBlocked =>
      'Permite notificările pentru Wortschatz în setările telefonului ca să primești un memento.';

  @override
  String get reminderTime => 'Ora memento-ului';

  @override
  String commonMastery(int level, int max) {
    return 'Stăpânire $level din $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent% învățat';
  }

  @override
  String get commonListen => 'Ascultă';

  @override
  String get commonNoVoice =>
      'Nu e instalată nicio voce germană. Adaug-o din setările Text în vorbire ale dispozitivului.';

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
    return 'Date noi pentru cuvinte. Actualizează ($size)';
  }

  @override
  String get contentUpdating => 'Se actualizează cuvintele…';

  @override
  String get contentUpdatedBanner =>
      'Cuvinte actualizate. Apar data viitoare când deschizi aplicația; înregistrările merg deja.';

  @override
  String get contentChecking => 'Se verifică…';

  @override
  String get contentDownloading => 'Se descarcă și se verifică fișierele…';

  @override
  String contentAvailable(int version, String size) {
    return 'Versiunea $version e disponibilă, $size';
  }

  @override
  String get contentUpdate => 'Actualizează';

  @override
  String get contentUpdated =>
      'Actualizat. Cuvintele noi apar data viitoare când deschizi aplicația.';

  @override
  String get contentUpToDate => 'La zi';

  @override
  String get contentCheck => 'Verifică';

  @override
  String get contentAppTooOld =>
      'Actualizează aplicația ca să primești conținut nou';

  @override
  String get contentStore => 'Magazin';

  @override
  String get contentFailed =>
      'Actualizarea a eșuat. Cuvintele tale au rămas la fel.';

  @override
  String get contentRetry => 'Reîncearcă';

  @override
  String contentTitle(int version) {
    return 'Conținut cuvinte · versiunea $version';
  }

  @override
  String get contentAutoWifi => 'Actualizare automată prin Wi-Fi';

  @override
  String get contentAutoWifiSub => 'Niciodată pe date mobile';

  @override
  String summaryCombo(int count) {
    return 'Combo: $count la rând';
  }

  @override
  String get summaryNewBest => 'RECORD NOU!';

  @override
  String summaryBestCombo(int count) {
    return 'Cel mai bun combo: $count la rând';
  }

  @override
  String get summaryPlayAgain => 'JOACĂ DIN NOU';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count din 3 stele',
      few: '$count din 3 stele',
      one: '$count din 3 stele',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'Citește povești germane reale, cuvânt cu cuvânt';

  @override
  String get siblingWordbit => 'Un cuvânt german la fiecare deblocare';

  @override
  String get siblingLeben => 'Treci testul de cetățenie';

  @override
  String get siblingAudiobookName => 'Carte audio în germană';

  @override
  String get siblingAudiobook => 'Ascultă povești pe niveluri';
}
