// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get settingsLanguage => 'Wika ng app';

  @override
  String get languageSearchHint => 'Maghanap ng wika';

  @override
  String get languageSystemDefault => 'Default ng system';

  @override
  String languageFollowsDevice(String language) {
    return 'Sumusunod sa device mo · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Hindi makapagsimula ang Wortschatz.\n\n$error';
  }

  @override
  String get navWords => 'Mga salita';

  @override
  String get navPractice => 'Magsanay';

  @override
  String get navSettings => 'Setting';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Streak: $count araw',
      one: 'Streak: $count araw',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Puntos';

  @override
  String get homeToPractise => 'Sasanayin';

  @override
  String get homeVocabulary => 'Bokabularyo';

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
      other: '$count salita',
      one: '$count salita',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Level $level: $learned sa $total salita ang natutunan';
  }

  @override
  String get homeStartHere => 'Magsimula rito';

  @override
  String get homeStartHereBody =>
      'Pag-aralan ang unang 10 salita mo na may tunog, saka laruin ang mga ito sa mga laro.';

  @override
  String get homeLearn10 => 'MATUTO NG 10 SALITA';

  @override
  String get homeGoal => 'Layunin ngayong araw';

  @override
  String get homeGoalReached => 'Naabot ang layunin ngayon!';

  @override
  String get homeGoalReachedBody =>
      'Kita tayo bukas, o maglaro pa para makaipon ng puntos.';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$done sa $goal salita ang natutunan o nasagot nang tama';
  }

  @override
  String get adsOutOfHints => 'Ubos na ang hint';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Manood ng maikling ad para sa $count pang hint?',
      one: 'Manood ng maikling ad para sa $count pang hint?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Hindi muna';

  @override
  String get adsWatchAd => 'Manood ng ad';

  @override
  String adsDoublePoints(int points) {
    return 'Dobleng puntos (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Ibalik ang $days-araw na streak mo',
      one: 'Ibalik ang $days-araw na streak mo',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Higit pang Aleman mula kay Pratiyush';

  @override
  String get rulePluralOnly =>
      'Pangngalang laging maramihan: ang maramihan ay laging die.';

  @override
  String ruleCompound(String head) {
    return 'Kinukuha ng tambalang salita ang artikulo ng huling bahagi nito: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'Karamihan sa mga pangngalang nagtatapos sa -$suffix ay $article.';
  }

  @override
  String get levelBeginner => 'Baguhan';

  @override
  String get levelElementary => 'Elementarya';

  @override
  String get levelIntermediate => 'Panggitna';

  @override
  String get levelUpperIntermediate => 'Mataas na panggitna';

  @override
  String get levelAllInSequence => 'Lahat ng level, sunod-sunod';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · inirerekomenda';

  @override
  String get levelOrChoose => 'O pumili ng isa o higit pang level';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count salita',
      one: '$count salita',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Level $level';
  }

  @override
  String get levelsKeepProgress =>
      'Nakatabi ang progreso mo sa bawat level, kaya hindi ka mawawalan ng natutunang salita kapag lumipat ka.';

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
      zero: 'walang hint',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub =>
      'Board ngayong araw, pareho sa lahat ng nag-aaral';

  @override
  String practiceDailyDone(String stars) {
    return 'Tapos na ngayon: $stars. I-tap para ibahagi';
  }

  @override
  String get dddPerfect => 'Perfekt! Tama lahat ng artikulo.';

  @override
  String get dddTip => 'Kulay ang pantanda: der itim, die pula, das ginto.';

  @override
  String dddItsArticle(String article) {
    return 'Ang artikulo ay $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Kasimbilis ng kidlat.';

  @override
  String get falleeKeepGoing =>
      'Tuloy lang: habang mas naglalaro ka, mas bumibilis ang pagbasa mo.';

  @override
  String hiveRound(int round) {
    return 'Round $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Salita $n sa $total';
  }

  @override
  String get hiveCoach =>
      'I-tap o i-drag sa magkakadikit na letra para baybayin ang salitang Aleman';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count letra pa',
      one: '$count letra pa',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Hint';

  @override
  String get hiveBoardCleared => 'Nalinis ang board!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count puntos',
      one: '+$count puntos',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'IBAHAGI ANG RESULTA';

  @override
  String get commonDone => 'Tapos na';

  @override
  String get hiveNextRound => 'SUSUNOD NA ROUND';

  @override
  String get commonLearn => 'Matuto';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Natuto ka ng $count bagong salita. Lalabas ulit bukas para sanayin.',
      one:
          'Natuto ka ng $count bagong salita. Lalabas ulit bukas para sanayin.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'MAMAYA NA';

  @override
  String get learnKnowIt => 'ALAM KO';

  @override
  String get learnFlip => 'BALIKTARIN';

  @override
  String get learnPluralOnly => 'maramihan lang · laging die';

  @override
  String learnPlural(String plural) {
    return 'maramihan: $plural';
  }

  @override
  String get onboardingIntro =>
      'Matuto ng mga salitang Aleman habang naglalaro. Ano ang level mo?';

  @override
  String get onboardingStart => 'SIMULAN';

  @override
  String get onboardingNotSure => 'Hindi sigurado? Magsimula sa A1';

  @override
  String get onboardingChangeLater =>
      'Mababago mo ito anumang oras sa Setting.';

  @override
  String get practiceTitle => 'MAGSANAY';

  @override
  String get practiceSpellDue => 'Baybayin ang mga salitang dapat nang sanayin';

  @override
  String get practiceLearnFirst => 'Matuto muna ng ilang salita';

  @override
  String get practiceCaughtUp => 'Tapos na lahat. Balik ka bukas!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count salita',
      one: '$count salita',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'MGA LARO';

  @override
  String get practiceHiveSub =>
      'Mag-swipe sa bahay-pukyutan para baybayin ang bawat salita';

  @override
  String get practiceDddSub => 'Piliin ang tamang artikulo';

  @override
  String get practiceFalleeSub =>
      'Piliin ang kahulugan bago lumapag ang salita';

  @override
  String get settingsTitle => 'MGA SETTING';

  @override
  String get settingsMadeBy => 'Ginawa nang may ❤️ ni Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Mga level';

  @override
  String get settingsAutoSpeak => 'Awtomatikong bigkas ng mga salita';

  @override
  String get settingsAutoSpeakSub => 'Sa mga flashcard at pagkatapos sumagot';

  @override
  String get settingsGamesAsPractice => 'Ibilang ang laro bilang pagsasanay';

  @override
  String get settingsGamesAsPracticeSub =>
      'Itinataas o ibinababa ng mga sagot sa laro ang natutunang salita';

  @override
  String get settingsSounds => 'Tunog at pag-vibrate';

  @override
  String get settingsSoundsSub => 'Sa mga laro at pagsasanay';

  @override
  String get settingsReset => 'I-reset ang progreso';

  @override
  String get settingsResetTitle => 'I-reset ang progreso?';

  @override
  String get settingsResetBody =>
      'Buburahin nito ang bawat natutunang salita, ang puntos mo, at ang streak mo.';

  @override
  String get commonCancel => 'Kanselahin';

  @override
  String get settingsResetConfirm => 'I-reset';

  @override
  String get settingsPrivacyChoices => 'Privacy at mga pagpipilian sa ad';

  @override
  String get settingsPrivacyPolicy => 'Patakaran sa privacy';

  @override
  String get settingsContact => 'Makipag-ugnayan sa suporta';

  @override
  String get settingsLicences => 'Mga open-source na lisensya';

  @override
  String settingsAbout(int count) {
    return '$count karaniwang salitang Aleman na may salin sa Ingles at nakarekord na pagbigkas. Walang babayaran: libre ang bawat salita at laro.';
  }

  @override
  String get settingsMailLastError =>
      'Huling error sa device na ito (burahin kung gusto mo):';

  @override
  String get spellingTitle => 'Pagsasanay';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count salita',
      one: '$count salita',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points puntos',
      one: '$points puntos',
    );
    return 'Nakapagsanay ka ng $_temp0 at nakaipon ng $_temp1.';
  }

  @override
  String get spellingNounHint => 'pangngalan — isama ang der, die o das';

  @override
  String get spellingAnswerIs => 'Ang sagot ay';

  @override
  String get commonNext => 'SUSUNOD';

  @override
  String get spellingSkip => 'Laktawan';

  @override
  String get spellingDelete => 'Burahin';

  @override
  String get spellingCheck => 'Suriin';

  @override
  String get wordListAllLearned =>
      'Natutunan mo na ang bawat salita sa listahang ito.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'May $count salita pang natitira sa listahang ito.',
      one: 'May $count salita pang natitira sa listahang ito.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'BOKABULARYO ($count)';
  }

  @override
  String get reminderBody =>
      'Handa na ang Daily Hive ngayong araw. Limang minuto ng Aleman?';

  @override
  String get reminderChannel => 'Araw-araw na paalala';

  @override
  String get reminderChannelDesc =>
      'Isang paalala bawat araw, sa oras na pipiliin mo.';

  @override
  String get reminderSwitch => 'Araw-araw na paalala';

  @override
  String reminderOnAt(String time) {
    return 'Isang paalala bawat araw nang $time';
  }

  @override
  String get reminderOff => 'Isang paalala bawat araw, sa oras na pipiliin mo';

  @override
  String get reminderBlocked =>
      'Payagan ang mga notification ng Wortschatz sa setting ng phone mo para makatanggap ng paalala.';

  @override
  String get reminderTime => 'Oras ng paalala';

  @override
  String commonMastery(int level, int max) {
    return 'Kahusayan $level sa $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent% natutunan';
  }

  @override
  String get commonListen => 'Makinig';

  @override
  String get commonNoVoice =>
      'Walang naka-install na boses na Aleman. Magdagdag sa text-to-speech na setting ng device mo.';

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
    return 'May bagong data ng salita. I-update ($size)';
  }

  @override
  String get contentUpdating => 'Ina-update ang mga salita…';

  @override
  String get contentUpdatedBanner =>
      'Na-update ang mga salita. Lalabas ang mga ito sa susunod mong pagbukas ng app; puwede nang i-play ang mga rekording.';

  @override
  String get contentChecking => 'Sinusuri…';

  @override
  String get contentDownloading => 'Dina-download at sinusuri ang mga file…';

  @override
  String contentAvailable(int version, String size) {
    return 'May bersyon $version, $size';
  }

  @override
  String get contentUpdate => 'I-update';

  @override
  String get contentUpdated =>
      'Na-update. Lalabas ang mga bagong salita sa susunod mong pagbukas ng app.';

  @override
  String get contentUpToDate => 'Pinakabago na';

  @override
  String get contentCheck => 'Suriin';

  @override
  String get contentAppTooOld =>
      'I-update ang app para makakuha ng bagong nilalaman';

  @override
  String get contentStore => 'Store';

  @override
  String get contentFailed =>
      'Hindi na-update. Walang nagbago sa mga salita mo.';

  @override
  String get contentRetry => 'Subukan ulit';

  @override
  String contentTitle(int version) {
    return 'Nilalaman ng salita · bersyon $version';
  }

  @override
  String get contentAutoWifi => 'Awtomatikong i-update sa Wi-Fi';

  @override
  String get contentAutoWifiSub => 'Hindi kailanman sa mobile data';

  @override
  String summaryCombo(int count) {
    return 'Combo: $count sunod-sunod';
  }

  @override
  String get summaryNewBest => 'BAGONG REKORD!';

  @override
  String summaryBestCombo(int count) {
    return 'Pinakamahabang combo: $count sunod-sunod';
  }

  @override
  String get summaryPlayAgain => 'MAGLARO ULIT';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sa 3 bituin',
      one: '$count sa 3 bituin',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle =>
      'Magbasa ng tunay na kuwentong Aleman, isa-isang salita';

  @override
  String get siblingWordbit => 'Isang salitang Aleman tuwing ia-unlock mo';

  @override
  String get siblingLeben => 'Pumasa sa pagsusulit sa pagkamamamayan';

  @override
  String get siblingAudiobookName => 'Audiobook sa Aleman';

  @override
  String get siblingAudiobook => 'Makinig sa mga kuwento ayon sa level';
}
