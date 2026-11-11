// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get settingsLanguage => 'Език на приложението';

  @override
  String get languageSearchHint => 'Търси език';

  @override
  String get languageSystemDefault => 'Системен език';

  @override
  String languageFollowsDevice(String language) {
    return 'Като на устройството · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz не успя да стартира.\n\n$error';
  }

  @override
  String get navWords => 'Думи';

  @override
  String get navPractice => 'Упражнения';

  @override
  String get navSettings => 'Настройки';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Серия: $count дни',
      one: 'Серия: $count ден',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Точки';

  @override
  String get homeToPractise => 'За преговор';

  @override
  String get homeVocabulary => 'Речник';

  @override
  String homeLevel(int level) {
    return 'Ниво $level';
  }

  @override
  String get homeLevelCaps => 'НИВО';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count думи',
      one: '$count дума',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Ниво $level: научени $learned от $total думи';
  }

  @override
  String get homeStartHere => 'Започни оттук';

  @override
  String get homeStartHereBody =>
      'Научи първите си 10 думи със звук, после играй с тях в игрите.';

  @override
  String get homeLearn10 => 'НАУЧИ 10 ДУМИ';

  @override
  String get homeGoal => 'Целта за днес';

  @override
  String get homeGoalReached => 'Целта за днес: готово!';

  @override
  String get homeGoalReachedBody => 'До утре! Или играй още и събирай точки.';

  @override
  String homeGoalProgress(int done, int goal) {
    return 'Научени думи или верни отговори: $done от $goal';
  }

  @override
  String get adsOutOfHints => 'Подсказките свършиха';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ще гледаш ли кратка реклама за още $count подсказки?',
      one: 'Ще гледаш ли кратка реклама за още $count подсказка?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Не сега';

  @override
  String get adsWatchAd => 'Гледай реклама';

  @override
  String adsDoublePoints(int points) {
    return 'Двойни точки (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Върни серията си от $days дни',
      one: 'Върни серията си от $days ден',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Още немски от Pratiyush';

  @override
  String get rulePluralOnly => 'Само в множествено число: членът винаги е die.';

  @override
  String ruleCompound(String head) {
    return 'Сложните думи вземат члена на последната си част: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'Повечето съществителни на -$suffix са с $article.';
  }

  @override
  String get levelBeginner => 'Начално';

  @override
  String get levelElementary => 'Елементарно';

  @override
  String get levelIntermediate => 'Средно';

  @override
  String get levelUpperIntermediate => 'Средно напреднало';

  @override
  String get levelAllInSequence => 'Всички нива поред';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · препоръчително';

  @override
  String get levelOrChoose => 'Или избери едно или няколко нива';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count думи',
      one: '$count дума',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Ниво $level';
  }

  @override
  String get levelsKeepProgress =>
      'Напредъкът се пази за всяко ниво, така че при смяна не губиш нито една научена дума.';

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
      other: '$count подсказки',
      one: '$count подсказка',
      zero: 'без подсказки',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Днешното поле, еднакво за всички';

  @override
  String practiceDailyDone(String stars) {
    return 'Днес е готово: $stars. Докосни, за да споделиш';
  }

  @override
  String get dddPerfect => 'Perfekt! Всички членове са верни.';

  @override
  String get dddTip =>
      'Цветът помага да запомниш: der черно, die червено, das златно.';

  @override
  String dddItsArticle(String article) {
    return 'Членът е $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Светкавично бързо.';

  @override
  String get falleeKeepGoing =>
      'Продължавай: колкото повече играеш, толкова по-бързо четеш.';

  @override
  String hiveRound(int round) {
    return 'Рунд $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Дума $n от $total';
  }

  @override
  String get hiveCoach =>
      'Докосвай или плъзгай по съседни букви, за да напишеш немската дума';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Остават $count букви',
      one: 'Остава $count буква',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Подсказка';

  @override
  String get hiveBoardCleared => 'Полето е изчистено!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count точки',
      one: '+$count точка',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'СПОДЕЛИ';

  @override
  String get commonDone => 'Готово';

  @override
  String get hiveNextRound => 'СЛЕДВАЩ РУНД';

  @override
  String get commonLearn => 'Учи';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Вече знаеш $count нови думи. Утре те ще се върнат за преговор.',
      one: 'Вече знаеш $count нова дума. Утре тя ще се върне за преговор.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'ПО-КЪСНО';

  @override
  String get learnKnowIt => 'ЗНАМ Я';

  @override
  String get learnFlip => 'ОБЪРНИ';

  @override
  String get learnPluralOnly => 'само мн. ч. · винаги die';

  @override
  String learnPlural(String plural) {
    return 'мн. ч. $plural';
  }

  @override
  String get onboardingIntro =>
      'Учи немски думи, като играеш. Какво е нивото ти?';

  @override
  String get onboardingStart => 'ЗАПОЧНИ';

  @override
  String get onboardingNotSure => 'Не знаеш? Започни от A1';

  @override
  String get onboardingChangeLater =>
      'Можеш да промениш това по всяко време в Настройки.';

  @override
  String get practiceTitle => 'УПРАЖНЕНИЯ';

  @override
  String get practiceSpellDue => 'Напиши думите, които са за преговор';

  @override
  String get practiceLearnFirst => 'Първо научи няколко думи';

  @override
  String get practiceCaughtUp => 'Всичко е готово. Ела пак утре!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count думи',
      one: '$count дума',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'ИГРИ';

  @override
  String get practiceHiveSub =>
      'Плъзгай по пчелната пита, за да напишеш всяка дума';

  @override
  String get practiceDddSub => 'Избери правилния член';

  @override
  String get practiceFalleeSub => 'Избери значението, преди думата да падне';

  @override
  String get settingsTitle => 'НАСТРОЙКИ';

  @override
  String get settingsMadeBy => 'Направено с ❤️ от Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Нива';

  @override
  String get settingsAutoSpeak => 'Автоматично произнасяне на думите';

  @override
  String get settingsAutoSpeakSub => 'На картичките и след отговор';

  @override
  String get settingsGamesAsPractice => 'Игрите се броят за упражнение';

  @override
  String get settingsGamesAsPracticeSub =>
      'Отговорите в игрите местят научените думи нагоре или надолу';

  @override
  String get settingsSounds => 'Звуци и вибрация';

  @override
  String get settingsSoundsSub => 'В игрите и упражненията';

  @override
  String get settingsReset => 'Нулирай напредъка';

  @override
  String get settingsResetTitle => 'Да нулираме ли напредъка?';

  @override
  String get settingsResetBody =>
      'Това изтрива всички научени думи, точките и серията ти.';

  @override
  String get commonCancel => 'Отказ';

  @override
  String get settingsResetConfirm => 'Нулирай';

  @override
  String get settingsPrivacyChoices => 'Поверителност и реклами';

  @override
  String get settingsPrivacyPolicy => 'Политика за поверителност';

  @override
  String get settingsContact => 'Пиши на поддръжката';

  @override
  String get settingsLicences => 'Лицензи с отворен код';

  @override
  String settingsAbout(int count) {
    return 'Често срещани немски думи ($count) с превод на английски и записано произношение. Без платено съдържание: всички думи и игри са безплатни.';
  }

  @override
  String get settingsMailLastError =>
      'Последна грешка на това устройство (можеш да я изтриеш):';

  @override
  String get spellingTitle => 'Упражнения';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count думи',
      one: '$count дума',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points точки',
      one: '$points точка',
    );
    return 'Упражнени: $_temp0, събрани: $_temp1.';
  }

  @override
  String get spellingNounHint => 'съществително — с der, die или das';

  @override
  String get spellingAnswerIs => 'Отговорът е';

  @override
  String get commonNext => 'НАПРЕД';

  @override
  String get spellingSkip => 'Пропусни';

  @override
  String get spellingDelete => 'Изтрий';

  @override
  String get spellingCheck => 'Провери';

  @override
  String get wordListAllLearned => 'Знаеш всички думи в този списък.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'В този списък остават $count думи.',
      one: 'В този списък остава $count дума.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'РЕЧНИК ($count)';
  }

  @override
  String get reminderBody => 'Днешният Daily Hive е готов. Пет минути немски?';

  @override
  String get reminderChannel => 'Дневно напомняне';

  @override
  String get reminderChannelDesc =>
      'Едно напомняне на ден, в избран от теб час.';

  @override
  String get reminderSwitch => 'Дневно напомняне';

  @override
  String reminderOnAt(String time) {
    return 'Едно напомняне на ден в $time';
  }

  @override
  String get reminderOff => 'Едно напомняне на ден, в удобен за теб час';

  @override
  String get reminderBlocked =>
      'Разреши известията за Wortschatz в настройките на телефона, за да получаваш напомняне.';

  @override
  String get reminderTime => 'Час на напомнянето';

  @override
  String commonMastery(int level, int max) {
    return 'Усвояване: $level от $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return 'Научени $percent%';
  }

  @override
  String get commonListen => 'Слушай';

  @override
  String get commonNoVoice =>
      'Няма инсталиран немски глас. Добави го в настройките за синтез на реч на устройството.';

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
    return 'Има нови данни за думите. Обнови ($size)';
  }

  @override
  String get contentUpdating => 'Думите се обновяват…';

  @override
  String get contentUpdatedBanner =>
      'Думите са обновени. Ще се появят при следващото отваряне на приложението; записите вече работят.';

  @override
  String get contentChecking => 'Проверка…';

  @override
  String get contentDownloading => 'Изтегляне и проверка на файловете…';

  @override
  String contentAvailable(int version, String size) {
    return 'Налична е версия $version, $size';
  }

  @override
  String get contentUpdate => 'Обнови';

  @override
  String get contentUpdated =>
      'Обновено. Новите думи ще се появят при следващото отваряне на приложението.';

  @override
  String get contentUpToDate => 'Всичко е актуално';

  @override
  String get contentCheck => 'Провери';

  @override
  String get contentAppTooOld =>
      'Обнови приложението, за да получиш ново съдържание';

  @override
  String get contentStore => 'Магазин';

  @override
  String get contentFailed => 'Обновяването не успя. Думите ти са непроменени.';

  @override
  String get contentRetry => 'Опитай пак';

  @override
  String contentTitle(int version) {
    return 'Набор думи · версия $version';
  }

  @override
  String get contentAutoWifi => 'Автоматично обновяване през Wi-Fi';

  @override
  String get contentAutoWifiSub => 'Никога през мобилни данни';

  @override
  String summaryCombo(int count) {
    return 'Комбо: $count поред';
  }

  @override
  String get summaryNewBest => 'РЕКОРД!';

  @override
  String summaryBestCombo(int count) {
    return 'Най-добро комбо: $count поред';
  }

  @override
  String get summaryPlayAgain => 'ИГРАЙ ПАК';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count звезди от 3',
      one: '$count звезда от 3',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'Чети истински немски истории дума по дума';

  @override
  String get siblingWordbit => 'Немска дума при всяко отключване';

  @override
  String get siblingLeben => 'Издържи теста за гражданство';

  @override
  String get siblingAudiobookName => 'Немска аудиокнига';

  @override
  String get siblingAudiobook => 'Слушай истории по нива';
}
