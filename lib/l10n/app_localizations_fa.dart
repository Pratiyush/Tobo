// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get settingsLanguage => 'زبان برنامه';

  @override
  String get languageSearchHint => 'جستجوی زبان';

  @override
  String get languageSystemDefault => 'پیش‌فرض سیستم';

  @override
  String languageFollowsDevice(String language) {
    return 'مطابق دستگاه شما · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz اجرا نشد.\n\n$error';
  }

  @override
  String get navWords => 'کلمه‌ها';

  @override
  String get navPractice => 'تمرین';

  @override
  String get navSettings => 'تنظیمات';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'زنجیره: $count روز',
      one: 'زنجیره: $count روز',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'امتیاز';

  @override
  String get homeToPractise => 'برای تمرین';

  @override
  String get homeVocabulary => 'واژگان';

  @override
  String homeLevel(int level) {
    return 'سطح $level';
  }

  @override
  String get homeLevelCaps => 'سطح';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلمه',
      one: '$count کلمه',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'سطح $level: $learned از $total کلمه یاد گرفته شده';
  }

  @override
  String get homeStartHere => 'از اینجا شروع کنید';

  @override
  String get homeStartHereBody =>
      'اولین 10 کلمه‌تان را با صدا یاد بگیرید، بعد در بازی‌ها با آن‌ها بازی کنید.';

  @override
  String get homeLearn10 => 'یادگیری 10 کلمه';

  @override
  String get homeGoal => 'هدف امروز';

  @override
  String get homeGoalReached => 'به هدف امروز رسیدید!';

  @override
  String get homeGoalReachedBody =>
      'تا فردا! یا برای امتیاز بیشتر بازی را ادامه دهید.';

  @override
  String homeGoalProgress(int done, int goal) {
    return 'کلمه‌های یادگرفته یا پاسخ‌های درست: $done از $goal';
  }

  @override
  String get adsOutOfHints => 'راهنمایی‌ها تمام شد';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'یک تبلیغ کوتاه می‌بینید تا $count راهنمایی دیگر بگیرید؟',
      one: 'یک تبلیغ کوتاه می‌بینید تا $count راهنمایی دیگر بگیرید؟',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'حالا نه';

  @override
  String get adsWatchAd => 'دیدن تبلیغ';

  @override
  String adsDoublePoints(int points) {
    return 'امتیاز دوبرابر (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'بازگرداندن زنجیرهٔ $days روزه',
      one: 'بازگرداندن زنجیرهٔ $days روزه',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'آلمانی بیشتر از Pratiyush';

  @override
  String get rulePluralOnly => 'اسم فقط‌جمع: جمع همیشه die می‌گیرد.';

  @override
  String ruleCompound(String head) {
    return 'کلمه‌های مرکب حرف تعریفِ بخش آخرشان را می‌گیرند: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'بیشتر اسم‌های مختوم به -$suffix، $article می‌گیرند.';
  }

  @override
  String get levelBeginner => 'مبتدی';

  @override
  String get levelElementary => 'مقدماتی';

  @override
  String get levelIntermediate => 'متوسط';

  @override
  String get levelUpperIntermediate => 'فوق متوسط';

  @override
  String get levelAllInSequence => 'همهٔ سطح‌ها به ترتیب';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · پیشنهادی';

  @override
  String get levelOrChoose => 'یا یک یا چند سطح انتخاب کنید';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلمه',
      one: '$count کلمه',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'سطح $level';
  }

  @override
  String get levelsKeepProgress =>
      'پیشرفت شما در هر سطح حفظ می‌شود، پس با تغییر سطح هیچ کلمهٔ یادگرفته‌ای از دست نمی‌رود.';

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
      other: '$count راهنمایی',
      one: '$count راهنمایی',
      zero: 'بدون راهنمایی',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'صفحهٔ امروز، برای همه یکسان';

  @override
  String practiceDailyDone(String stars) {
    return 'امروز انجام شد: $stars. برای اشتراک‌گذاری بزنید';
  }

  @override
  String get dddPerfect => 'Perfekt! همهٔ حرف‌های تعریف درست.';

  @override
  String get dddTip =>
      'رنگ به یادآوری کمک می‌کند: der سیاه، die قرمز، das طلایی.';

  @override
  String dddItsArticle(String article) {
    return 'پاسخ درست: $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! مثل برق.';

  @override
  String get falleeKeepGoing =>
      'ادامه بدهید: هرچه بیشتر بازی کنید، سریع‌تر می‌خوانید.';

  @override
  String hiveRound(int round) {
    return 'دور $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'کلمهٔ $n از $total';
  }

  @override
  String get hiveCoach =>
      'روی حروف کنار هم بزنید یا بکشید تا کلمهٔ آلمانی را هجی کنید';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count حرف مانده',
      one: '$count حرف مانده',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'راهنمایی';

  @override
  String get hiveBoardCleared => 'صفحه پاک شد!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count امتیاز',
      one: '+$count امتیاز',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'اشتراک نتیجه';

  @override
  String get commonDone => 'تمام';

  @override
  String get hiveNextRound => 'دور بعد';

  @override
  String get commonLearn => 'یادگیری';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلمهٔ تازه یاد گرفتید. فردا برای تمرین برمی‌گردند.',
      one: '$count کلمهٔ تازه یاد گرفتید. فردا برای تمرین برمی‌گردد.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'بعداً';

  @override
  String get learnKnowIt => 'بلدم';

  @override
  String get learnFlip => 'برگرداندن کارت';

  @override
  String get learnPluralOnly => 'فقط جمع · همیشه die';

  @override
  String learnPlural(String plural) {
    return 'جمع: $plural';
  }

  @override
  String get onboardingIntro =>
      'کلمه‌های آلمانی را با بازی یاد بگیرید. سطح شما چیست؟';

  @override
  String get onboardingStart => 'شروع';

  @override
  String get onboardingNotSure => 'مطمئن نیستید؟ از A1 شروع کنید';

  @override
  String get onboardingChangeLater =>
      'هر وقت خواستید می‌توانید این را در تنظیمات تغییر دهید.';

  @override
  String get practiceTitle => 'تمرین';

  @override
  String get practiceSpellDue => 'کلمه‌هایی را که وقت مرورشان است هجی کنید';

  @override
  String get practiceLearnFirst => 'اول چند کلمه یاد بگیرید';

  @override
  String get practiceCaughtUp => 'همه‌چیز انجام شده. فردا برگردید!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلمه',
      one: '$count کلمه',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'بازی‌ها';

  @override
  String get practiceHiveSub => 'روی کندو بکشید تا هر کلمه را هجی کنید';

  @override
  String get practiceDddSub => 'حرف تعریف درست را انتخاب کنید';

  @override
  String get practiceFalleeSub => 'معنی را قبل از افتادن کلمه انتخاب کنید';

  @override
  String get settingsTitle => 'تنظیمات';

  @override
  String get settingsMadeBy => 'ساخته‌شده با ❤️ توسط Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'سطح‌ها';

  @override
  String get settingsAutoSpeak => 'تلفظ خودکار کلمه‌ها';

  @override
  String get settingsAutoSpeakSub => 'روی کارت‌ها و بعد از پاسخ‌ها';

  @override
  String get settingsGamesAsPractice => 'بازی‌ها تمرین حساب شوند';

  @override
  String get settingsGamesAsPracticeSub =>
      'پاسخ‌های بازی کلمه‌های یادگرفته را بالا یا پایین می‌برند';

  @override
  String get settingsSounds => 'صدا و لرزش';

  @override
  String get settingsSoundsSub => 'در بازی‌ها و تمرین';

  @override
  String get settingsReset => 'بازنشانی پیشرفت';

  @override
  String get settingsResetTitle => 'پیشرفت بازنشانی شود؟';

  @override
  String get settingsResetBody =>
      'با این کار همهٔ کلمه‌های یادگرفته، امتیازها و زنجیرهٔ شما پاک می‌شود.';

  @override
  String get commonCancel => 'لغو';

  @override
  String get settingsResetConfirm => 'بازنشانی';

  @override
  String get settingsPrivacyChoices => 'حریم خصوصی و تبلیغات';

  @override
  String get settingsPrivacyPolicy => 'سیاست حریم خصوصی';

  @override
  String get settingsContact => 'تماس با پشتیبانی';

  @override
  String get settingsLicences => 'مجوزهای متن‌باز';

  @override
  String settingsAbout(int count) {
    return 'کلمه‌های رایج آلمانی ($count) با ترجمهٔ انگلیسی و تلفظ ضبط‌شده. بدون پرداخت: همهٔ کلمه‌ها و بازی‌ها رایگان‌اند.';
  }

  @override
  String get settingsMailLastError =>
      'آخرین خطا در این دستگاه (اگر خواستید پاکش کنید):';

  @override
  String get spellingTitle => 'تمرین';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلمه',
      one: '$count کلمه',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points امتیاز',
      one: '$points امتیاز',
    );
    return '$_temp0 تمرین کردید و $_temp1 گرفتید.';
  }

  @override
  String get spellingNounHint => 'اسم — همراه با der، die یا das';

  @override
  String get spellingAnswerIs => 'پاسخ درست:';

  @override
  String get commonNext => 'بعدی';

  @override
  String get spellingSkip => 'رد کردن';

  @override
  String get spellingDelete => 'حذف';

  @override
  String get spellingCheck => 'بررسی';

  @override
  String get wordListAllLearned => 'همهٔ کلمه‌های این فهرست را یاد گرفته‌اید.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کلمه در این فهرست مانده است.',
      one: '$count کلمه در این فهرست مانده است.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'واژگان ($count)';
  }

  @override
  String get reminderBody => 'Daily Hive امروز آماده است. پنج دقیقه آلمانی؟';

  @override
  String get reminderChannel => 'یادآور روزانه';

  @override
  String get reminderChannelDesc =>
      'روزی یک یادآوری، در ساعتی که انتخاب می‌کنید.';

  @override
  String get reminderSwitch => 'یادآور روزانه';

  @override
  String reminderOnAt(String time) {
    return 'روزی یک یادآوری، ساعت $time';
  }

  @override
  String get reminderOff => 'روزی یک یادآوری، در ساعتی که بخواهید';

  @override
  String get reminderBlocked =>
      'برای دریافت یادآوری، اعلان‌های Wortschatz را در تنظیمات گوشی مجاز کنید.';

  @override
  String get reminderTime => 'ساعت یادآوری';

  @override
  String commonMastery(int level, int max) {
    return 'تسلط $level از $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent% یاد گرفته‌شده';
  }

  @override
  String get commonListen => 'گوش دادن';

  @override
  String get commonNoVoice =>
      'صدای آلمانی نصب نیست. یکی را در تنظیمات تبدیل متن به گفتار دستگاه اضافه کنید.';

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
    return 'داده‌های تازهٔ کلمه‌ها آماده است. به‌روزرسانی ($size)';
  }

  @override
  String get contentUpdating => 'در حال به‌روزرسانی کلمه‌ها…';

  @override
  String get contentUpdatedBanner =>
      'کلمه‌ها به‌روز شدند. دفعهٔ بعد که برنامه را باز کنید نمایش داده می‌شوند؛ صداهای ضبط‌شده از همین حالا پخش می‌شوند.';

  @override
  String get contentChecking => 'در حال بررسی…';

  @override
  String get contentDownloading => 'در حال دانلود و بررسی فایل‌ها…';

  @override
  String contentAvailable(int version, String size) {
    return 'نسخهٔ $version موجود است، $size';
  }

  @override
  String get contentUpdate => 'به‌روزرسانی';

  @override
  String get contentUpdated =>
      'به‌روز شد. کلمه‌های تازه دفعهٔ بعد که برنامه را باز کنید نمایش داده می‌شوند.';

  @override
  String get contentUpToDate => 'به‌روز است';

  @override
  String get contentCheck => 'بررسی';

  @override
  String get contentAppTooOld => 'برای محتوای تازه، برنامه را به‌روز کنید';

  @override
  String get contentStore => 'فروشگاه';

  @override
  String get contentFailed =>
      'به‌روزرسانی انجام نشد. کلمه‌هایتان تغییری نکرده‌اند.';

  @override
  String get contentRetry => 'تلاش دوباره';

  @override
  String contentTitle(int version) {
    return 'محتوای کلمه‌ها · نسخهٔ $version';
  }

  @override
  String get contentAutoWifi => 'به‌روزرسانی خودکار با Wi-Fi';

  @override
  String get contentAutoWifiSub => 'هرگز با اینترنت همراه';

  @override
  String summaryCombo(int count) {
    return 'کمبو: $count پشت سر هم';
  }

  @override
  String get summaryNewBest => 'رکورد تازه!';

  @override
  String summaryBestCombo(int count) {
    return 'بهترین کمبو: $count پشت سر هم';
  }

  @override
  String get summaryPlayAgain => 'بازی مجدد';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count از 3 ستاره',
      one: '$count از 3 ستاره',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'داستان‌های واقعی آلمانی را کلمه به کلمه بخوانید';

  @override
  String get siblingWordbit => 'با هر باز کردن قفل گوشی، یک کلمهٔ آلمانی';

  @override
  String get siblingLeben => 'در آزمون شهروندی قبول شوید';

  @override
  String get siblingAudiobookName => 'کتاب صوتی آلمانی';

  @override
  String get siblingAudiobook => 'داستان‌های سطح‌بندی‌شده را گوش کنید';
}
