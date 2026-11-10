// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get settingsLanguage => 'Мова застосунку';

  @override
  String get languageSearchHint => 'Пошук мови';

  @override
  String get languageSystemDefault => 'Мова системи';

  @override
  String languageFollowsDevice(String language) {
    return 'Як на пристрої · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Не вдалося запустити Wortschatz.\n\n$error';
  }

  @override
  String get navWords => 'Слова';

  @override
  String get navPractice => 'Тренування';

  @override
  String get navSettings => 'Налаштування';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Серія: $count днів',
      many: 'Серія: $count днів',
      few: 'Серія: $count дні',
      one: 'Серія: $count день',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Бали';

  @override
  String get homeToPractise => 'Повторити';

  @override
  String get homeVocabulary => 'Словник';

  @override
  String homeLevel(int level) {
    return 'Рівень $level';
  }

  @override
  String get homeLevelCaps => 'РІВЕНЬ';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count слів',
      many: '$count слів',
      few: '$count слова',
      one: '$count слово',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Рівень $level: вивчено слів: $learned з $total';
  }

  @override
  String get homeStartHere => 'Почни тут';

  @override
  String get homeStartHereBody =>
      'Вивчи перші 10 слів зі звуком, а потім зіграй з ними в іграх.';

  @override
  String get homeLearn10 => 'ВИВЧИ 10 СЛІВ';

  @override
  String get homeGoal => 'Мета на сьогодні';

  @override
  String get homeGoalReached => 'Мету дня виконано!';

  @override
  String get homeGoalReachedBody => 'До завтра! Або грай далі й збирай бали.';

  @override
  String homeGoalProgress(int done, int goal) {
    return 'Вивчено слів або правильних відповідей: $done з $goal';
  }

  @override
  String get adsOutOfHints => 'Підказки закінчилися';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Переглянеш коротку рекламу? Отримаєш ще $count підказок.',
      many: 'Переглянеш коротку рекламу? Отримаєш ще $count підказок.',
      few: 'Переглянеш коротку рекламу? Отримаєш ще $count підказки.',
      one: 'Переглянеш коротку рекламу? Отримаєш ще $count підказку.',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Не зараз';

  @override
  String get adsWatchAd => 'Дивитися рекламу';

  @override
  String adsDoublePoints(int points) {
    return 'Подвійні бали (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Віднови серію: $days днів',
      many: 'Віднови серію: $days днів',
      few: 'Віднови серію: $days дні',
      one: 'Віднови серію: $days день',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Більше німецької від Pratiyush';

  @override
  String get rulePluralOnly => 'Іменник лише в множині: у множині завжди die.';

  @override
  String ruleCompound(String head) {
    return 'Складні слова мають артикль своєї останньої частини: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'Більшість іменників на -$suffix мають артикль $article.';
  }

  @override
  String get levelBeginner => 'Початковий';

  @override
  String get levelElementary => 'Елементарний';

  @override
  String get levelIntermediate => 'Середній';

  @override
  String get levelUpperIntermediate => 'Вище середнього';

  @override
  String get levelAllInSequence => 'Усі рівні по черзі';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · радимо';

  @override
  String get levelOrChoose => 'Або вибери один чи кілька рівнів';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count слів',
      many: '$count слів',
      few: '$count слова',
      one: '$count слово',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Рівень $level';
  }

  @override
  String get levelsKeepProgress =>
      'Прогрес зберігається для кожного рівня, тож під час перемикання жодне вивчене слово не губиться.';

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
      other: '$count підказок',
      many: '$count підказок',
      few: '$count підказки',
      one: '$count підказка',
      zero: 'без підказок',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Поле дня, однакове для всіх';

  @override
  String practiceDailyDone(String stars) {
    return 'Сьогодні готово: $stars. Торкнись, щоб поділитися';
  }

  @override
  String get dddPerfect => 'Perfekt! Усі артиклі правильні.';

  @override
  String get dddTip =>
      'Колір допомагає запам’ятати: der чорний, die червоний, das золотий.';

  @override
  String dddItsArticle(String article) {
    return 'Правильно: $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Блискавично.';

  @override
  String get falleeKeepGoing =>
      'Так тримати: що більше граєш, то швидше читаєш.';

  @override
  String hiveRound(int round) {
    return 'Раунд $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Слово $n з $total';
  }

  @override
  String get hiveCoach =>
      'Торкайся або веди по сусідніх літерах, щоб скласти німецьке слово';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Залишилося $count літер',
      many: 'Залишилося $count літер',
      few: 'Залишилося $count літери',
      one: 'Залишилася $count літера',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Підказка';

  @override
  String get hiveBoardCleared => 'Поле пройдено!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count балів',
      many: '+$count балів',
      few: '+$count бали',
      one: '+$count бал',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'ПОДІЛИТИСЯ';

  @override
  String get commonDone => 'Готово';

  @override
  String get hiveNextRound => 'НАСТУПНИЙ РАУНД';

  @override
  String get commonLearn => 'Вчити';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Тепер ти знаєш $count нових слів. Завтра вони повернуться на повторення.',
      many:
          'Тепер ти знаєш $count нових слів. Завтра вони повернуться на повторення.',
      few:
          'Тепер ти знаєш $count нові слова. Завтра вони повернуться на повторення.',
      one:
          'Тепер ти знаєш $count нове слово. Завтра воно повернеться на повторення.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'ПІЗНІШЕ';

  @override
  String get learnKnowIt => 'ЗНАЮ';

  @override
  String get learnFlip => 'ПЕРЕВЕРНИ';

  @override
  String get learnPluralOnly => 'лише мн. · завжди die';

  @override
  String learnPlural(String plural) {
    return 'мн. $plural';
  }

  @override
  String get onboardingIntro =>
      'Вчи німецькі слова, граючи. Який у тебе рівень?';

  @override
  String get onboardingStart => 'ПОЧАТИ';

  @override
  String get onboardingNotSure => 'Не знаєш? Почни з A1';

  @override
  String get onboardingChangeLater =>
      'Це можна змінити будь-коли в Налаштуваннях.';

  @override
  String get practiceTitle => 'ТРЕНУВАННЯ';

  @override
  String get practiceSpellDue => 'Напиши слова, які час повторити';

  @override
  String get practiceLearnFirst => 'Спершу вивчи кілька слів';

  @override
  String get practiceCaughtUp => 'Усе зроблено. Повертайся завтра!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count слів',
      many: '$count слів',
      few: '$count слова',
      one: '$count слово',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'ІГРИ';

  @override
  String get practiceHiveSub => 'Веди по стільниках, щоб скласти кожне слово';

  @override
  String get practiceDddSub => 'Вибери правильний артикль';

  @override
  String get practiceFalleeSub => 'Вибери значення, поки слово не впало';

  @override
  String get settingsTitle => 'НАЛАШТУВАННЯ';

  @override
  String get settingsMadeBy => 'З ❤️ створив Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Рівні';

  @override
  String get settingsAutoSpeak => 'Автоматично озвучувати слова';

  @override
  String get settingsAutoSpeakSub => 'На картках і після відповідей';

  @override
  String get settingsGamesAsPractice => 'Зараховувати ігри як тренування';

  @override
  String get settingsGamesAsPracticeSub =>
      'Відповіді в іграх рухають вивчені слова вгору або вниз';

  @override
  String get settingsSounds => 'Звуки та вібрація';

  @override
  String get settingsSoundsSub => 'В іграх і тренуваннях';

  @override
  String get settingsReset => 'Скинути прогрес';

  @override
  String get settingsResetTitle => 'Скинути прогрес?';

  @override
  String get settingsResetBody =>
      'Буде забуто всі вивчені слова, твої бали й серію.';

  @override
  String get commonCancel => 'Скасувати';

  @override
  String get settingsResetConfirm => 'Скинути';

  @override
  String get settingsPrivacyChoices => 'Приватність і реклама';

  @override
  String get settingsPrivacyPolicy => 'Політика конфіденційності';

  @override
  String get settingsContact => 'Написати в підтримку';

  @override
  String get settingsLicences => 'Ліцензії відкритого ПЗ';

  @override
  String settingsAbout(int count) {
    return 'Поширені німецькі слова ($count) з перекладом англійською та записаною вимовою. Нічого платного: усі слова й ігри безкоштовні.';
  }

  @override
  String get settingsMailLastError =>
      'Остання помилка на цьому пристрої (можеш видалити):';

  @override
  String get spellingTitle => 'Тренування';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count слів',
      many: '$count слів',
      few: '$count слова',
      one: '$count слово',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points балів',
      many: '$points балів',
      few: '$points бали',
      one: '$points бал',
    );
    return 'Відпрацьовано: $_temp0, зібрано: $_temp1.';
  }

  @override
  String get spellingNounHint => 'іменник — з der, die або das';

  @override
  String get spellingAnswerIs => 'Правильна відповідь:';

  @override
  String get commonNext => 'ДАЛІ';

  @override
  String get spellingSkip => 'Пропустити';

  @override
  String get spellingDelete => 'Видалити';

  @override
  String get spellingCheck => 'Перевірити';

  @override
  String get wordListAllLearned => 'Ти знаєш усі слова з цього списку.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'У цьому списку залишилося $count слів.',
      many: 'У цьому списку залишилося $count слів.',
      few: 'У цьому списку залишилося $count слова.',
      one: 'У цьому списку залишилося $count слово.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'СЛОВНИК ($count)';
  }

  @override
  String get reminderBody =>
      'Сьогоднішній Daily Hive уже чекає. П’ять хвилин німецької?';

  @override
  String get reminderChannel => 'Щоденне нагадування';

  @override
  String get reminderChannelDesc =>
      'Одне нагадування на день, у час, який ти обереш.';

  @override
  String get reminderSwitch => 'Щоденне нагадування';

  @override
  String reminderOnAt(String time) {
    return 'Одне нагадування на день о $time';
  }

  @override
  String get reminderOff => 'Одне нагадування на день, коли тобі зручно';

  @override
  String get reminderBlocked =>
      'Дозволь сповіщення для Wortschatz у налаштуваннях телефона, щоб отримувати нагадування.';

  @override
  String get reminderTime => 'Час нагадування';

  @override
  String commonMastery(int level, int max) {
    return 'Засвоєння: $level з $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return 'Вивчено $percent%';
  }

  @override
  String get commonListen => 'Прослухати';

  @override
  String get commonNoVoice =>
      'Німецький голос не встановлено. Додай його в налаштуваннях синтезу мовлення на пристрої.';

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
    return 'Доступне оновлення слів. Оновити ($size)';
  }

  @override
  String get contentUpdating => 'Оновлюємо слова…';

  @override
  String get contentUpdatedBanner =>
      'Слова оновлено. Вони з’являться під час наступного запуску застосунку; записи вже працюють.';

  @override
  String get contentChecking => 'Перевіряємо…';

  @override
  String get contentDownloading => 'Завантажуємо й перевіряємо файли…';

  @override
  String contentAvailable(int version, String size) {
    return 'Доступна версія $version, $size';
  }

  @override
  String get contentUpdate => 'Оновити';

  @override
  String get contentUpdated =>
      'Оновлено. Нові слова з’являться під час наступного запуску застосунку.';

  @override
  String get contentUpToDate => 'Усе актуально';

  @override
  String get contentCheck => 'Перевірити';

  @override
  String get contentAppTooOld => 'Онови застосунок, щоб отримати новий вміст';

  @override
  String get contentStore => 'Магазин';

  @override
  String get contentFailed => 'Не вдалося оновити. Твої слова не змінилися.';

  @override
  String get contentRetry => 'Повторити';

  @override
  String contentTitle(int version) {
    return 'Набір слів · версія $version';
  }

  @override
  String get contentAutoWifi => 'Оновлювати автоматично через Wi-Fi';

  @override
  String get contentAutoWifiSub => 'Ніколи через мобільний інтернет';

  @override
  String summaryCombo(int count) {
    return 'Комбо: $count поспіль';
  }

  @override
  String get summaryNewBest => 'РЕКОРД!';

  @override
  String summaryBestCombo(int count) {
    return 'Найкраще комбо: $count поспіль';
  }

  @override
  String get summaryPlayAgain => 'ГРАТИ ЗНОВУ';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count зірок з 3',
      many: '$count зірок з 3',
      few: '$count зірки з 3',
      one: '$count зірка з 3',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'Читай справжні німецькі історії слово за словом';

  @override
  String get siblingWordbit => 'Німецьке слово щоразу, як розблоковуєш телефон';

  @override
  String get siblingLeben => 'Склади тест на громадянство';

  @override
  String get siblingAudiobookName => 'Німецька аудіокнига';

  @override
  String get siblingAudiobook => 'Слухай історії за рівнями';
}
