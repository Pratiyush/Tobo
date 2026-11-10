// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get settingsLanguage => 'Язык приложения';

  @override
  String get languageSearchHint => 'Поиск языка';

  @override
  String get languageSystemDefault => 'Язык системы';

  @override
  String languageFollowsDevice(String language) {
    return 'Как на устройстве · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Не удалось запустить Wortschatz.\n\n$error';
  }

  @override
  String get navWords => 'Слова';

  @override
  String get navPractice => 'Тренировка';

  @override
  String get navSettings => 'Настройки';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Серия: $count дней',
      many: 'Серия: $count дней',
      few: 'Серия: $count дня',
      one: 'Серия: $count день',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Очки';

  @override
  String get homeToPractise => 'К повтору';

  @override
  String get homeVocabulary => 'Словарь';

  @override
  String homeLevel(int level) {
    return 'Уровень $level';
  }

  @override
  String get homeLevelCaps => 'УРОВЕНЬ';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count слов',
      many: '$count слов',
      few: '$count слова',
      one: '$count слово',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Уровень $level: выучено слов: $learned из $total';
  }

  @override
  String get homeStartHere => 'Начни здесь';

  @override
  String get homeStartHereBody =>
      'Выучи первые 10 слов со звуком, а потом сыграй с ними в играх.';

  @override
  String get homeLearn10 => 'ВЫУЧИ 10 СЛОВ';

  @override
  String get homeGoal => 'Цель на сегодня';

  @override
  String get homeGoalReached => 'Цель дня выполнена!';

  @override
  String get homeGoalReachedBody =>
      'До завтра! Или играй дальше и собирай очки.';

  @override
  String homeGoalProgress(int done, int goal) {
    return 'Выучено слов или верных ответов: $done из $goal';
  }

  @override
  String get adsOutOfHints => 'Подсказки закончились';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Посмотришь короткую рекламу? Получишь ещё $count подсказок.',
      many: 'Посмотришь короткую рекламу? Получишь ещё $count подсказок.',
      few: 'Посмотришь короткую рекламу? Получишь ещё $count подсказки.',
      one: 'Посмотришь короткую рекламу? Получишь ещё $count подсказку.',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Не сейчас';

  @override
  String get adsWatchAd => 'Смотреть рекламу';

  @override
  String adsDoublePoints(int points) {
    return 'Двойные очки (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Верни серию в $days дней',
      many: 'Верни серию в $days дней',
      few: 'Верни серию в $days дня',
      one: 'Верни серию в $days день',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Больше немецкого от Pratiyush';

  @override
  String get rulePluralOnly =>
      'Только множественное число, а в нём всегда die.';

  @override
  String ruleCompound(String head) {
    return 'Сложные слова берут артикль своей последней части: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'Большинство существительных на -$suffix имеют артикль $article.';
  }

  @override
  String get levelBeginner => 'Начальный';

  @override
  String get levelElementary => 'Элементарный';

  @override
  String get levelIntermediate => 'Средний';

  @override
  String get levelUpperIntermediate => 'Выше среднего';

  @override
  String get levelAllInSequence => 'Все уровни по порядку';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · рекомендуем';

  @override
  String get levelOrChoose => 'Или выбери один или несколько уровней';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count слов',
      many: '$count слов',
      few: '$count слова',
      one: '$count слово',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Уровень $level';
  }

  @override
  String get levelsKeepProgress =>
      'Прогресс сохраняется для каждого уровня, поэтому при переключении ни одно выученное слово не теряется.';

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
      other: '$count подсказок',
      many: '$count подсказок',
      few: '$count подсказки',
      one: '$count подсказка',
      zero: 'без подсказок',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Поле дня, одно для всех';

  @override
  String practiceDailyDone(String stars) {
    return 'Сегодня готово: $stars. Нажми, чтобы поделиться';
  }

  @override
  String get dddPerfect => 'Perfekt! Все артикли верны.';

  @override
  String get dddTip =>
      'Цвет помогает запомнить: der чёрный, die красный, das золотой.';

  @override
  String dddItsArticle(String article) {
    return 'Правильно: $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Молниеносно.';

  @override
  String get falleeKeepGoing =>
      'Продолжай: чем больше играешь, тем быстрее читаешь.';

  @override
  String hiveRound(int round) {
    return 'Раунд $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Слово $n из $total';
  }

  @override
  String get hiveCoach =>
      'Нажимай или веди по соседним буквам, чтобы составить немецкое слово';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Осталось $count букв',
      many: 'Осталось $count букв',
      few: 'Осталось $count буквы',
      one: 'Осталась $count буква',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Подсказка';

  @override
  String get hiveBoardCleared => 'Поле пройдено!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count очков',
      many: '+$count очков',
      few: '+$count очка',
      one: '+$count очко',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'ПОДЕЛИТЬСЯ';

  @override
  String get commonDone => 'Готово';

  @override
  String get hiveNextRound => 'СЛЕДУЮЩИЙ РАУНД';

  @override
  String get commonLearn => 'Учить';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Теперь ты знаешь $count новых слов. Завтра они вернутся на повторение.',
      many:
          'Теперь ты знаешь $count новых слов. Завтра они вернутся на повторение.',
      few:
          'Теперь ты знаешь $count новых слова. Завтра они вернутся на повторение.',
      one:
          'Теперь ты знаешь $count новое слово. Завтра оно вернётся на повторение.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'ПОЗЖЕ';

  @override
  String get learnKnowIt => 'ЗНАЮ';

  @override
  String get learnFlip => 'ПЕРЕВЕРНИ';

  @override
  String get learnPluralOnly => 'только мн. ч. · всегда die';

  @override
  String learnPlural(String plural) {
    return 'мн. ч. $plural';
  }

  @override
  String get onboardingIntro =>
      'Учи немецкие слова, играя. Какой у тебя уровень?';

  @override
  String get onboardingStart => 'НАЧАТЬ';

  @override
  String get onboardingNotSure => 'Не знаешь? Начни с A1';

  @override
  String get onboardingChangeLater =>
      'Это можно изменить в любой момент в настройках.';

  @override
  String get practiceTitle => 'ТРЕНИРОВКА';

  @override
  String get practiceSpellDue => 'Напиши слова, которые пора повторить';

  @override
  String get practiceLearnFirst => 'Сначала выучи несколько слов';

  @override
  String get practiceCaughtUp => 'Всё сделано. Возвращайся завтра!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count слов',
      many: '$count слов',
      few: '$count слова',
      one: '$count слово',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'ИГРЫ';

  @override
  String get practiceHiveSub => 'Веди по сотам, чтобы составить каждое слово';

  @override
  String get practiceDddSub => 'Выбери правильный артикль';

  @override
  String get practiceFalleeSub => 'Выбери значение, пока слово не упало';

  @override
  String get settingsTitle => 'НАСТРОЙКИ';

  @override
  String get settingsMadeBy => 'С ❤️ создал Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Уровни';

  @override
  String get settingsAutoSpeak => 'Озвучивать слова автоматически';

  @override
  String get settingsAutoSpeakSub => 'На карточках и после ответов';

  @override
  String get settingsGamesAsPractice => 'Считать игры тренировкой';

  @override
  String get settingsGamesAsPracticeSub =>
      'Ответы в играх двигают выученные слова вверх или вниз';

  @override
  String get settingsSounds => 'Звуки и вибрация';

  @override
  String get settingsSoundsSub => 'В играх и тренировках';

  @override
  String get settingsReset => 'Сбросить прогресс';

  @override
  String get settingsResetTitle => 'Сбросить прогресс?';

  @override
  String get settingsResetBody =>
      'Будут забыты все выученные слова, твои очки и серия.';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get settingsResetConfirm => 'Сбросить';

  @override
  String get settingsPrivacyChoices => 'Конфиденциальность и реклама';

  @override
  String get settingsPrivacyPolicy => 'Политика конфиденциальности';

  @override
  String get settingsContact => 'Написать в поддержку';

  @override
  String get settingsLicences => 'Лицензии открытого ПО';

  @override
  String settingsAbout(int count) {
    return 'Частые немецкие слова ($count) с переводом на английский и записанным произношением. Ничего платного: все слова и игры бесплатны.';
  }

  @override
  String get settingsMailLastError =>
      'Последняя ошибка на этом устройстве (можешь удалить):';

  @override
  String get spellingTitle => 'Тренировка';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count слов',
      many: '$count слов',
      few: '$count слова',
      one: '$count слово',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points очков',
      many: '$points очков',
      few: '$points очка',
      one: '$points очко',
    );
    return 'Отработано: $_temp0, собрано: $_temp1.';
  }

  @override
  String get spellingNounHint => 'существительное — с der, die или das';

  @override
  String get spellingAnswerIs => 'Правильный ответ:';

  @override
  String get commonNext => 'ДАЛЕЕ';

  @override
  String get spellingSkip => 'Пропустить';

  @override
  String get spellingDelete => 'Удалить';

  @override
  String get spellingCheck => 'Проверить';

  @override
  String get wordListAllLearned => 'Ты знаешь все слова из этого списка.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'В этом списке осталось $count слов.',
      many: 'В этом списке осталось $count слов.',
      few: 'В этом списке осталось $count слова.',
      one: 'В этом списке осталось $count слово.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'СЛОВАРЬ ($count)';
  }

  @override
  String get reminderBody =>
      'Сегодняшний Daily Hive готов. Пять минут немецкого?';

  @override
  String get reminderChannel => 'Ежедневное напоминание';

  @override
  String get reminderChannelDesc =>
      'Одно напоминание в день, в выбранное тобой время.';

  @override
  String get reminderSwitch => 'Ежедневное напоминание';

  @override
  String reminderOnAt(String time) {
    return 'Одно напоминание в день в $time';
  }

  @override
  String get reminderOff => 'Одно напоминание в день, когда тебе удобно';

  @override
  String get reminderBlocked =>
      'Разреши уведомления для Wortschatz в настройках телефона, чтобы получать напоминания.';

  @override
  String get reminderTime => 'Время напоминания';

  @override
  String commonMastery(int level, int max) {
    return 'Освоение: $level из $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return 'Выучено $percent%';
  }

  @override
  String get commonListen => 'Прослушать';

  @override
  String get commonNoVoice =>
      'Немецкий голос не установлен. Добавь его в настройках синтеза речи на устройстве.';

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
    return 'Доступно обновление слов. Обновить ($size)';
  }

  @override
  String get contentUpdating => 'Обновляем слова…';

  @override
  String get contentUpdatedBanner =>
      'Слова обновлены. Они появятся при следующем запуске приложения; записи уже работают.';

  @override
  String get contentChecking => 'Проверяем…';

  @override
  String get contentDownloading => 'Загружаем и проверяем файлы…';

  @override
  String contentAvailable(int version, String size) {
    return 'Доступна версия $version, $size';
  }

  @override
  String get contentUpdate => 'Обновить';

  @override
  String get contentUpdated =>
      'Обновлено. Новые слова появятся при следующем запуске приложения.';

  @override
  String get contentUpToDate => 'Всё актуально';

  @override
  String get contentCheck => 'Проверить';

  @override
  String get contentAppTooOld =>
      'Обнови приложение, чтобы получить новый контент';

  @override
  String get contentStore => 'Магазин';

  @override
  String get contentFailed => 'Не удалось обновить. Твои слова не изменились.';

  @override
  String get contentRetry => 'Повторить';

  @override
  String contentTitle(int version) {
    return 'Набор слов · версия $version';
  }

  @override
  String get contentAutoWifi => 'Обновлять автоматически по Wi-Fi';

  @override
  String get contentAutoWifiSub => 'Никогда через мобильный интернет';

  @override
  String summaryCombo(int count) {
    return 'Комбо: $count подряд';
  }

  @override
  String get summaryNewBest => 'РЕКОРД!';

  @override
  String summaryBestCombo(int count) {
    return 'Лучшее комбо: $count подряд';
  }

  @override
  String get summaryPlayAgain => 'ИГРАТЬ СНОВА';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count звёзд из 3',
      many: '$count звёзд из 3',
      few: '$count звезды из 3',
      one: '$count звезда из 3',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle =>
      'Читай настоящие немецкие истории слово за словом';

  @override
  String get siblingWordbit => 'Немецкое слово при каждой разблокировке';

  @override
  String get siblingLeben => 'Сдай тест на гражданство';

  @override
  String get siblingAudiobookName => 'Немецкая аудиокнига';

  @override
  String get siblingAudiobook => 'Слушай истории по уровням';
}
