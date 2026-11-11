// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get settingsLanguage => 'ایپ کی زبان';

  @override
  String get languageSearchHint => 'زبان تلاش کریں';

  @override
  String get languageSystemDefault => 'سسٹم کی زبان';

  @override
  String languageFollowsDevice(String language) {
    return 'آلے کے مطابق · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz شروع نہیں ہو سکی۔\n\n$error';
  }

  @override
  String get navWords => 'الفاظ';

  @override
  String get navPractice => 'مشق';

  @override
  String get navSettings => 'ترتیبات';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'سلسلہ: $count دن',
      one: 'سلسلہ: $count دن',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'پوائنٹس';

  @override
  String get homeToPractise => 'مشق کے لیے';

  @override
  String get homeVocabulary => 'ذخیرۂ الفاظ';

  @override
  String homeLevel(int level) {
    return 'لیول $level';
  }

  @override
  String get homeLevelCaps => 'لیول';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count الفاظ',
      one: '$count لفظ',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'لیول $level: $total میں سے $learned الفاظ سیکھے گئے';
  }

  @override
  String get homeStartHere => 'یہاں سے شروع کریں';

  @override
  String get homeStartHereBody =>
      'اپنے پہلے 10 الفاظ آواز کے ساتھ سیکھیں، پھر گیمز میں ان کے ساتھ کھیلیں۔';

  @override
  String get homeLearn10 => '10 الفاظ سیکھیں';

  @override
  String get homeGoal => 'آج کا ہدف';

  @override
  String get homeGoalReached => 'آج کا ہدف پورا ہو گیا!';

  @override
  String get homeGoalReachedBody =>
      'کل ملتے ہیں، یا پوائنٹس کے لیے کھیلتے رہیں۔';

  @override
  String homeGoalProgress(int done, int goal) {
    return 'سیکھے گئے یا درست جواب والے الفاظ: $goal میں سے $done';
  }

  @override
  String get adsOutOfHints => 'اشارے ختم ہو گئے';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'مزید $count اشاروں کے لیے مختصر اشتہار دیکھیں؟',
      one: 'مزید $count اشارے کے لیے مختصر اشتہار دیکھیں؟',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'ابھی نہیں';

  @override
  String get adsWatchAd => 'اشتہار دیکھیں';

  @override
  String adsDoublePoints(int points) {
    return 'دگنے پوائنٹس (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'اپنا $days دن کا سلسلہ بحال کریں',
      one: 'اپنا $days دن کا سلسلہ بحال کریں',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Pratiyush کی طرف سے مزید جرمن';

  @override
  String get rulePluralOnly => 'صرف جمع والا اسم: جمع میں ہمیشہ die آتا ہے۔';

  @override
  String ruleCompound(String head) {
    return 'مرکب الفاظ اپنے آخری حصے کا آرٹیکل لیتے ہیں: $head۔';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return '-$suffix پر ختم ہونے والے زیادہ تر اسم $article لیتے ہیں۔';
  }

  @override
  String get levelBeginner => 'ابتدائی';

  @override
  String get levelElementary => 'بنیادی';

  @override
  String get levelIntermediate => 'درمیانہ';

  @override
  String get levelUpperIntermediate => 'اعلیٰ درمیانہ';

  @override
  String get levelAllInSequence => 'تمام لیول ترتیب سے';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · تجویز کردہ';

  @override
  String get levelOrChoose => 'یا ایک یا زیادہ لیول چنیں';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count الفاظ',
      one: '$count لفظ',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'لیول $level';
  }

  @override
  String get levelsKeepProgress =>
      'ہر لیول کے لیے آپ کی پیش رفت محفوظ رہتی ہے، اس لیے لیول بدلنے سے کوئی سیکھا ہوا لفظ ضائع نہیں ہوتا۔';

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
      other: '$count اشارے',
      one: '$count اشارہ',
      zero: 'کوئی اشارہ نہیں',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'آج کا بورڈ، ہر سیکھنے والے کے لیے ایک جیسا';

  @override
  String practiceDailyDone(String stars) {
    return 'آج مکمل: $stars۔ شیئر کرنے کے لیے ٹیپ کریں';
  }

  @override
  String get dddPerfect => 'Perfekt! سارے آرٹیکل درست۔';

  @override
  String get dddTip =>
      'رنگ یاد رکھنے میں مدد دیتا ہے: der سیاہ، die سرخ، das سنہرا۔';

  @override
  String dddItsArticle(String article) {
    return 'درست: $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! بجلی کی طرح تیز۔';

  @override
  String get falleeKeepGoing =>
      'جاری رکھیں: زیادہ کھیلنے سے پڑھنے کی رفتار بڑھتی ہے۔';

  @override
  String hiveRound(int round) {
    return 'راؤنڈ $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return '$total میں سے لفظ $n';
  }

  @override
  String get hiveCoach =>
      'جرمن لفظ کے ہجے کرنے کے لیے ساتھ والے حروف کو ٹیپ کریں یا ان پر انگلی پھیریں';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count حروف باقی',
      one: '$count حرف باقی',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'اشارہ';

  @override
  String get hiveBoardCleared => 'بورڈ صاف!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count پوائنٹس',
      one: '+$count پوائنٹ',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'نتیجہ شیئر کریں';

  @override
  String get commonDone => 'ہو گیا';

  @override
  String get hiveNextRound => 'اگلا راؤنڈ';

  @override
  String get commonLearn => 'سیکھیں';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'آپ نے $count نئے الفاظ سیکھے۔ یہ کل مشق کے لیے واپس آئیں گے۔',
      one: 'آپ نے $count نیا لفظ سیکھا۔ یہ کل مشق کے لیے واپس آئے گا۔',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'بعد میں';

  @override
  String get learnKnowIt => 'معلوم ہے';

  @override
  String get learnFlip => 'پلٹیں';

  @override
  String get learnPluralOnly => 'صرف جمع · ہمیشہ die';

  @override
  String learnPlural(String plural) {
    return 'جمع: $plural';
  }

  @override
  String get onboardingIntro =>
      'کھیل کھیل میں جرمن الفاظ سیکھیں۔ آپ کا لیول کیا ہے؟';

  @override
  String get onboardingStart => 'شروع کریں';

  @override
  String get onboardingNotSure => 'یقین نہیں؟ A1 سے شروع کریں';

  @override
  String get onboardingChangeLater =>
      'اسے کبھی بھی ترتیبات میں بدلا جا سکتا ہے۔';

  @override
  String get practiceTitle => 'مشق';

  @override
  String get practiceSpellDue => 'دہرائی کے لیے تیار الفاظ کے ہجے کریں';

  @override
  String get practiceLearnFirst => 'پہلے کچھ الفاظ سیکھیں';

  @override
  String get practiceCaughtUp => 'سب مکمل۔ کل پھر آئیں!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count الفاظ',
      one: '$count لفظ',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'گیمز';

  @override
  String get practiceHiveSub => 'ہر لفظ کے ہجے کے لیے چھتے پر انگلی پھیریں';

  @override
  String get practiceDddSub => 'درست آرٹیکل چنیں';

  @override
  String get practiceFalleeSub => 'لفظ کے گرنے سے پہلے مطلب چنیں';

  @override
  String get settingsTitle => 'ترتیبات';

  @override
  String get settingsMadeBy => 'Pratiyush Kumar Singh نے ❤️ سے بنایا';

  @override
  String get settingsLevels => 'لیول';

  @override
  String get settingsAutoSpeak => 'الفاظ کا خودکار تلفظ';

  @override
  String get settingsAutoSpeakSub => 'فلیش کارڈز پر اور جوابات کے بعد';

  @override
  String get settingsGamesAsPractice => 'گیمز کو مشق میں شمار کریں';

  @override
  String get settingsGamesAsPracticeSub =>
      'گیمز کے جوابات سیکھے ہوئے الفاظ کو اوپر یا نیچے لے جاتے ہیں';

  @override
  String get settingsSounds => 'آوازیں اور وائبریشن';

  @override
  String get settingsSoundsSub => 'گیمز اور مشق میں';

  @override
  String get settingsReset => 'پیش رفت ری سیٹ کریں';

  @override
  String get settingsResetTitle => 'پیش رفت ری سیٹ کریں؟';

  @override
  String get settingsResetBody =>
      'اس سے سیکھے ہوئے تمام الفاظ، آپ کے پوائنٹس اور آپ کا سلسلہ مٹ جائیں گے۔';

  @override
  String get commonCancel => 'منسوخ';

  @override
  String get settingsResetConfirm => 'ری سیٹ';

  @override
  String get settingsPrivacyChoices => 'رازداری اور اشتہارات کے انتخاب';

  @override
  String get settingsPrivacyPolicy => 'رازداری کی پالیسی';

  @override
  String get settingsContact => 'سپورٹ سے رابطہ';

  @override
  String get settingsLicences => 'اوپن سورس لائسنس';

  @override
  String settingsAbout(int count) {
    return 'عام جرمن الفاظ ($count) انگریزی ترجمے اور ریکارڈ شدہ تلفظ کے ساتھ۔ کوئی ادائیگی نہیں: ہر لفظ اور ہر گیم مفت ہے۔';
  }

  @override
  String get settingsMailLastError =>
      'اس آلے پر آخری خرابی (چاہیں تو حذف کر دیں):';

  @override
  String get spellingTitle => 'مشق';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count الفاظ',
      one: '$count لفظ',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points پوائنٹس جمع کیے',
      one: '$points پوائنٹ جمع کیا',
    );
    return 'آپ نے $_temp0 کی مشق کی اور $_temp1۔';
  }

  @override
  String get spellingNounHint => 'اسم — der، die یا das کے ساتھ';

  @override
  String get spellingAnswerIs => 'درست جواب ہے';

  @override
  String get commonNext => 'اگلا';

  @override
  String get spellingSkip => 'چھوڑیں';

  @override
  String get spellingDelete => 'مٹائیں';

  @override
  String get spellingCheck => 'جانچیں';

  @override
  String get wordListAllLearned => 'آپ نے اس فہرست کا ہر لفظ سیکھ لیا ہے۔';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'اس فہرست میں $count الفاظ باقی ہیں۔',
      one: 'اس فہرست میں $count لفظ باقی ہے۔',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'ذخیرۂ الفاظ ($count)';
  }

  @override
  String get reminderBody => 'آج کا Daily Hive تیار ہے۔ جرمن کے پانچ منٹ؟';

  @override
  String get reminderChannel => 'روزانہ یاد دہانی';

  @override
  String get reminderChannelDesc =>
      'دن میں ایک یاد دہانی، آپ کے چنے ہوئے وقت پر۔';

  @override
  String get reminderSwitch => 'روزانہ یاد دہانی';

  @override
  String reminderOnAt(String time) {
    return 'روزانہ $time پر ایک یاد دہانی';
  }

  @override
  String get reminderOff => 'دن میں ایک یاد دہانی، آپ کی پسند کے وقت پر';

  @override
  String get reminderBlocked =>
      'یاد دہانی پانے کے لیے فون کی ترتیبات میں Wortschatz کی اطلاعات کی اجازت دیں۔';

  @override
  String get reminderTime => 'یاد دہانی کا وقت';

  @override
  String commonMastery(int level, int max) {
    return 'مہارت $max میں سے $level';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent% سیکھا گیا';
  }

  @override
  String get commonListen => 'سنیں';

  @override
  String get commonNoVoice =>
      'کوئی جرمن آواز انسٹال نہیں۔ اپنے آلے کی ٹیکسٹ ٹو اسپیچ ترتیبات میں ایک شامل کریں۔';

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
    return 'الفاظ کا نیا ڈیٹا دستیاب ہے۔ اپ ڈیٹ کریں ($size)';
  }

  @override
  String get contentUpdating => 'الفاظ اپ ڈیٹ ہو رہے ہیں…';

  @override
  String get contentUpdatedBanner =>
      'الفاظ اپ ڈیٹ ہو گئے۔ یہ اگلی بار ایپ کھولنے پر نظر آئیں گے؛ ریکارڈنگز ابھی سے چلتی ہیں۔';

  @override
  String get contentChecking => 'جانچ ہو رہی ہے…';

  @override
  String get contentDownloading => 'فائلیں ڈاؤن لوڈ اور جانچی جا رہی ہیں…';

  @override
  String contentAvailable(int version, String size) {
    return 'ورژن $version دستیاب ہے، $size';
  }

  @override
  String get contentUpdate => 'اپ ڈیٹ';

  @override
  String get contentUpdated =>
      'اپ ڈیٹ ہو گیا۔ نئے الفاظ اگلی بار ایپ کھولنے پر نظر آئیں گے۔';

  @override
  String get contentUpToDate => 'تازہ ترین';

  @override
  String get contentCheck => 'جانچیں';

  @override
  String get contentAppTooOld => 'نیا مواد پانے کے لیے ایپ اپ ڈیٹ کریں';

  @override
  String get contentStore => 'اسٹور';

  @override
  String get contentFailed => 'اپ ڈیٹ نہیں ہو سکا۔ آپ کے الفاظ جوں کے توں ہیں۔';

  @override
  String get contentRetry => 'دوبارہ کوشش';

  @override
  String contentTitle(int version) {
    return 'الفاظ کا مواد · ورژن $version';
  }

  @override
  String get contentAutoWifi => 'Wi-Fi پر خود بخود اپ ڈیٹ کریں';

  @override
  String get contentAutoWifiSub => 'موبائل ڈیٹا پر کبھی نہیں';

  @override
  String summaryCombo(int count) {
    return 'کومبو: لگاتار $count';
  }

  @override
  String get summaryNewBest => 'نیا ریکارڈ!';

  @override
  String summaryBestCombo(int count) {
    return 'بہترین کومبو: لگاتار $count';
  }

  @override
  String get summaryPlayAgain => 'دوبارہ کھیلیں';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '3 میں سے $count ستارے',
      one: '3 میں سے $count ستارہ',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'اصلی جرمن کہانیاں لفظ بہ لفظ پڑھیں';

  @override
  String get siblingWordbit => 'ہر بار فون کھولنے پر ایک جرمن لفظ';

  @override
  String get siblingLeben => 'شہریت کا امتحان پاس کریں';

  @override
  String get siblingAudiobookName => 'جرمن آڈیو بک';

  @override
  String get siblingAudiobook => 'لیول کے مطابق کہانیاں سنیں';
}
