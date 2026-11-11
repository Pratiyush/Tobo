// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get settingsLanguage => 'لغة التطبيق';

  @override
  String get languageSearchHint => 'البحث عن لغة';

  @override
  String get languageSystemDefault => 'لغة النظام';

  @override
  String languageFollowsDevice(String language) {
    return 'حسب جهازك · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'تعذّر تشغيل Wortschatz.\n\n$error';
  }

  @override
  String get navWords => 'الكلمات';

  @override
  String get navPractice => 'التدريب';

  @override
  String get navSettings => 'الإعدادات';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'السلسلة: $count يوم',
      many: 'السلسلة: $count يومًا',
      few: 'السلسلة: $count أيام',
      two: 'السلسلة: يومان',
      one: 'السلسلة: يوم واحد',
      zero: 'السلسلة: $count يوم',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'النقاط';

  @override
  String get homeToPractise => 'للمراجعة';

  @override
  String get homeVocabulary => 'المفردات';

  @override
  String homeLevel(int level) {
    return 'المستوى $level';
  }

  @override
  String get homeLevelCaps => 'المستوى';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count كلمة',
      many: '$count كلمة',
      few: '$count كلمات',
      two: 'كلمتان',
      one: 'كلمة واحدة',
      zero: '$count كلمة',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'المستوى $level: تعلّمت $learned من $total كلمة';
  }

  @override
  String get homeStartHere => 'البداية من هنا';

  @override
  String get homeStartHereBody =>
      'تعلُّم أول 10 كلمات بالصوت، ثم اللعب بها في الألعاب.';

  @override
  String get homeLearn10 => 'تعلّم 10 كلمات';

  @override
  String get homeGoal => 'هدف اليوم';

  @override
  String get homeGoalReached => 'تحقّق هدف اليوم!';

  @override
  String get homeGoalReachedBody =>
      'نراك غدًا، أو يمكنك مواصلة اللعب لجمع النقاط.';

  @override
  String homeGoalProgress(int done, int goal) {
    return 'كلمات متعلَّمة أو إجابات صحيحة: $done من $goal';
  }

  @override
  String get adsOutOfHints => 'نفدت التلميحات';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'مشاهدة إعلان قصير للحصول على $count تلميح إضافي؟',
      many: 'مشاهدة إعلان قصير للحصول على $count تلميحًا إضافيًا؟',
      few: 'مشاهدة إعلان قصير للحصول على $count تلميحات إضافية؟',
      two: 'مشاهدة إعلان قصير للحصول على تلميحين إضافيين؟',
      one: 'مشاهدة إعلان قصير للحصول على تلميح إضافي واحد؟',
      zero: 'مشاهدة إعلان قصير للحصول على $count تلميح إضافي؟',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'ليس الآن';

  @override
  String get adsWatchAd => 'مشاهدة إعلان';

  @override
  String adsDoublePoints(int points) {
    return 'ضعف النقاط (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'استعادة سلسلة $days يوم',
      many: 'استعادة سلسلة $days يومًا',
      few: 'استعادة سلسلة $days أيام',
      two: 'استعادة سلسلة يومين',
      one: 'استعادة سلسلة يوم واحد',
      zero: 'استعادة سلسلة $days يوم',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'المزيد من الألمانية من Pratiyush';

  @override
  String get rulePluralOnly => 'اسم بصيغة الجمع فقط: الجمع يأخذ دائمًا die.';

  @override
  String ruleCompound(String head) {
    return 'الكلمات المركّبة تأخذ أداة تعريف جزئها الأخير: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'معظم الأسماء المنتهية بـ -$suffix تأخذ $article.';
  }

  @override
  String get levelBeginner => 'مبتدئ';

  @override
  String get levelElementary => 'أساسي';

  @override
  String get levelIntermediate => 'متوسط';

  @override
  String get levelUpperIntermediate => 'فوق المتوسط';

  @override
  String get levelAllInSequence => 'كل المستويات بالترتيب';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · موصى به';

  @override
  String get levelOrChoose => 'أو يمكنك اختيار مستوى أو أكثر';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count كلمة',
      many: '$count كلمة',
      few: '$count كلمات',
      two: 'كلمتان',
      one: 'كلمة واحدة',
      zero: '$count كلمة',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'المستوى $level';
  }

  @override
  String get levelsKeepProgress =>
      'يُحفظ تقدّمك في كل مستوى، فلا تضيع أي كلمة تعلّمتها عند التبديل.';

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
      other: '$count تلميح',
      many: '$count تلميحًا',
      few: '$count تلميحات',
      two: 'تلميحان',
      one: 'تلميح واحد',
      zero: 'بلا تلميحات',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'لوحة اليوم، نفسها لكل المتعلّمين';

  @override
  String practiceDailyDone(String stars) {
    return 'اكتملت اليوم: $stars. يمكنك مشاركتها بلمسة';
  }

  @override
  String get dddPerfect => 'Perfekt! كل أدوات التعريف صحيحة.';

  @override
  String get dddTip => 'اللون يساعد على التذكّر: der أسود، die أحمر، das ذهبي.';

  @override
  String dddItsArticle(String article) {
    return 'الصحيح: $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! بسرعة البرق.';

  @override
  String get falleeKeepGoing => 'فلنواصل: كلما لعبت أكثر، قرأت أسرع.';

  @override
  String hiveRound(int round) {
    return 'الجولة $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'الكلمة $n من $total';
  }

  @override
  String get hiveCoach =>
      'يمكنك لمس الحروف المتجاورة أو السحب عبرها لتهجئة الكلمة الألمانية';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'بقي $count حرف',
      many: 'بقي $count حرفًا',
      few: 'بقيت $count أحرف',
      two: 'بقي حرفان',
      one: 'بقي حرف واحد',
      zero: 'لم يبقَ أي حرف',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'تلميح';

  @override
  String get hiveBoardCleared => 'اكتملت اللوحة!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count نقطة',
      many: '+$count نقطة',
      few: '+$count نقاط',
      two: '+نقطتان',
      one: '+نقطة واحدة',
      zero: '+$count نقطة',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'مشاركة النتيجة';

  @override
  String get commonDone => 'تم';

  @override
  String get hiveNextRound => 'الجولة التالية';

  @override
  String get commonLearn => 'تعلّم';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تعلّمت $count كلمة جديدة. ستعود للتدريب غدًا.',
      many: 'تعلّمت $count كلمة جديدة. ستعود للتدريب غدًا.',
      few: 'تعلّمت $count كلمات جديدة. ستعود للتدريب غدًا.',
      two: 'تعلّمت كلمتين جديدتين. ستعودان للتدريب غدًا.',
      one: 'تعلّمت كلمة جديدة واحدة. ستعود للتدريب غدًا.',
      zero: 'تعلّمت $count كلمة جديدة. ستعود للتدريب غدًا.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'لاحقًا';

  @override
  String get learnKnowIt => 'أعرفها';

  @override
  String get learnFlip => 'قلب البطاقة';

  @override
  String get learnPluralOnly => 'جمع فقط · دائمًا die';

  @override
  String learnPlural(String plural) {
    return 'الجمع: $plural';
  }

  @override
  String get onboardingIntro => 'تعلّم كلمات ألمانية باللعب. ما مستواك؟';

  @override
  String get onboardingStart => 'لنبدأ';

  @override
  String get onboardingNotSure => 'لا فكرة لديك؟ لنبدأ من A1';

  @override
  String get onboardingChangeLater => 'يمكنك تغيير هذا في أي وقت من الإعدادات.';

  @override
  String get practiceTitle => 'التدريب';

  @override
  String get practiceSpellDue => 'تهجئة الكلمات المستحقة للمراجعة';

  @override
  String get practiceLearnFirst => 'تعلّم بعض الكلمات أولًا';

  @override
  String get practiceCaughtUp => 'أنجزت كل شيء. نراك غدًا!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count كلمة',
      many: '$count كلمة',
      few: '$count كلمات',
      two: 'كلمتان',
      one: 'كلمة واحدة',
      zero: '$count كلمة',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'الألعاب';

  @override
  String get practiceHiveSub => 'السحب عبر خلية النحل لتهجئة كل كلمة';

  @override
  String get practiceDddSub => 'اختيار أداة التعريف الصحيحة';

  @override
  String get practiceFalleeSub => 'اختيار المعنى قبل أن تهبط الكلمة';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get settingsMadeBy => 'صُنع بـ ❤️ على يد Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'المستويات';

  @override
  String get settingsAutoSpeak => 'نطق الكلمات تلقائيًا';

  @override
  String get settingsAutoSpeakSub => 'على البطاقات وبعد الإجابات';

  @override
  String get settingsGamesAsPractice => 'احتساب الألعاب تدريبًا';

  @override
  String get settingsGamesAsPracticeSub =>
      'إجابات الألعاب تقدّم الكلمات المتعلَّمة أو تؤخّرها';

  @override
  String get settingsSounds => 'الأصوات والاهتزاز';

  @override
  String get settingsSoundsSub => 'في الألعاب والتدريب';

  @override
  String get settingsReset => 'إعادة ضبط التقدّم';

  @override
  String get settingsResetTitle => 'إعادة ضبط التقدّم؟';

  @override
  String get settingsResetBody =>
      'سيُحذف كل ما تعلّمته من كلمات، ونقاطك، وسلسلتك.';

  @override
  String get commonCancel => 'إلغاء';

  @override
  String get settingsResetConfirm => 'إعادة ضبط';

  @override
  String get settingsPrivacyChoices => 'الخصوصية وخيارات الإعلانات';

  @override
  String get settingsPrivacyPolicy => 'سياسة الخصوصية';

  @override
  String get settingsContact => 'التواصل مع الدعم';

  @override
  String get settingsLicences => 'تراخيص البرامج مفتوحة المصدر';

  @override
  String settingsAbout(int count) {
    return 'كلمات ألمانية شائعة ($count) مع ترجمتها إلى الإنجليزية ونطق مسجّل. بلا أي مدفوعات: كل الكلمات والألعاب مجانية.';
  }

  @override
  String get settingsMailLastError =>
      'آخر خطأ على هذا الجهاز (يمكنك حذفه إن أردت):';

  @override
  String get spellingTitle => 'التدريب';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count كلمة',
      many: '$count كلمة',
      few: '$count كلمات',
      two: 'كلمتين',
      one: 'كلمة واحدة',
      zero: '$count كلمة',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points نقطة',
      many: '$points نقطة',
      few: '$points نقاط',
      two: 'نقطتين',
      one: 'نقطة واحدة',
      zero: '$points نقطة',
    );
    return 'تدرّبت على $_temp0 وجمعت $_temp1.';
  }

  @override
  String get spellingNounHint => 'اسم — مع der أو die أو das';

  @override
  String get spellingAnswerIs => 'الإجابة هي';

  @override
  String get commonNext => 'التالي';

  @override
  String get spellingSkip => 'تخطٍّ';

  @override
  String get spellingDelete => 'حذف';

  @override
  String get spellingCheck => 'تحقّق';

  @override
  String get wordListAllLearned => 'تعلّمت كل الكلمات في هذه القائمة.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'بقيت $count كلمة في هذه القائمة.',
      many: 'بقيت $count كلمة في هذه القائمة.',
      few: 'بقيت $count كلمات في هذه القائمة.',
      two: 'بقيت كلمتان في هذه القائمة.',
      one: 'بقيت كلمة واحدة في هذه القائمة.',
      zero: 'لم تبقَ أي كلمة في هذه القائمة.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'المفردات ($count)';
  }

  @override
  String get reminderBody =>
      'لعبة Daily Hive اليوم جاهزة. خمس دقائق من الألمانية؟';

  @override
  String get reminderChannel => 'تذكير يومي';

  @override
  String get reminderChannelDesc =>
      'تذكير واحد في اليوم، في الوقت الذي يناسبك.';

  @override
  String get reminderSwitch => 'تذكير يومي';

  @override
  String reminderOnAt(String time) {
    return 'تذكير واحد يوميًا عند $time';
  }

  @override
  String get reminderOff => 'تذكير واحد يوميًا، في الوقت الذي يناسبك';

  @override
  String get reminderBlocked =>
      'لتلقّي التذكير، يلزم السماح بإشعارات Wortschatz في إعدادات الهاتف.';

  @override
  String get reminderTime => 'وقت التذكير';

  @override
  String commonMastery(int level, int max) {
    return 'الإتقان $level من $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return 'تم تعلّم $percent%';
  }

  @override
  String get commonListen => 'استماع';

  @override
  String get commonNoVoice =>
      'لا يوجد صوت ألماني مثبّت. يمكنك إضافته من إعدادات تحويل النص إلى كلام في جهازك.';

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
    return 'بيانات كلمات جديدة متاحة. تحديث ($size)';
  }

  @override
  String get contentUpdating => 'جارٍ تحديث الكلمات…';

  @override
  String get contentUpdatedBanner =>
      'تم تحديث الكلمات. ستظهر عند فتح التطبيق في المرة القادمة، والتسجيلات تعمل من الآن.';

  @override
  String get contentChecking => 'جارٍ التحقّق…';

  @override
  String get contentDownloading => 'جارٍ تنزيل الملفات والتحقّق منها…';

  @override
  String contentAvailable(int version, String size) {
    return 'الإصدار $version متاح، $size';
  }

  @override
  String get contentUpdate => 'تحديث';

  @override
  String get contentUpdated =>
      'تم التحديث. ستظهر الكلمات الجديدة عند فتح التطبيق في المرة القادمة.';

  @override
  String get contentUpToDate => 'محدّث';

  @override
  String get contentCheck => 'تحقّق';

  @override
  String get contentAppTooOld => 'يلزم تحديث التطبيق للحصول على محتوى جديد';

  @override
  String get contentStore => 'المتجر';

  @override
  String get contentFailed => 'تعذّر التحديث. كلماتك لم تتغيّر.';

  @override
  String get contentRetry => 'إعادة المحاولة';

  @override
  String contentTitle(int version) {
    return 'محتوى الكلمات · الإصدار $version';
  }

  @override
  String get contentAutoWifi => 'تحديث تلقائي عبر Wi-Fi';

  @override
  String get contentAutoWifiSub => 'ليس عبر بيانات الجوال أبدًا';

  @override
  String summaryCombo(int count) {
    return 'كومبو: $count على التوالي';
  }

  @override
  String get summaryNewBest => 'رقم قياسي!';

  @override
  String summaryBestCombo(int count) {
    return 'أفضل كومبو: $count على التوالي';
  }

  @override
  String get summaryPlayAgain => 'جولة أخرى';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count نجمة من 3',
      many: '$count نجمة من 3',
      few: '$count نجوم من 3',
      two: 'نجمتان من 3',
      one: 'نجمة واحدة من 3',
      zero: '$count من 3 نجوم',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'قراءة قصص ألمانية حقيقية، كلمة بكلمة';

  @override
  String get siblingWordbit => 'كلمة ألمانية مع كل فتح لقفل الشاشة';

  @override
  String get siblingLeben => 'النجاح في اختبار الجنسية';

  @override
  String get siblingAudiobookName => 'كتاب صوتي ألماني';

  @override
  String get siblingAudiobook => 'الاستماع إلى قصص حسب المستوى';
}
