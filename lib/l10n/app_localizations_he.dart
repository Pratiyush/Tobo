// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get settingsLanguage => 'שפת האפליקציה';

  @override
  String get languageSearchHint => 'חיפוש שפה';

  @override
  String get languageSystemDefault => 'שפת המערכת';

  @override
  String languageFollowsDevice(String language) {
    return 'לפי המכשיר · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'לא ניתן היה להפעיל את Wortschatz.\n\n$error';
  }

  @override
  String get navWords => 'מילים';

  @override
  String get navPractice => 'תרגול';

  @override
  String get navSettings => 'הגדרות';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'רצף: $count ימים',
      two: 'רצף: יומיים',
      one: 'רצף: יום אחד',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'נקודות';

  @override
  String get homeToPractise => 'לתרגול';

  @override
  String get homeVocabulary => 'אוצר מילים';

  @override
  String homeLevel(int level) {
    return 'רמה $level';
  }

  @override
  String get homeLevelCaps => 'רמה';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count מילים',
      two: 'שתי מילים',
      one: 'מילה אחת',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'רמה $level: $learned מתוך $total מילים נלמדו';
  }

  @override
  String get homeStartHere => 'מתחילים כאן';

  @override
  String get homeStartHereBody =>
      'לומדים את 10 המילים הראשונות עם שמע, ואז משחקים בהן במשחקים.';

  @override
  String get homeLearn10 => 'ללמוד 10 מילים';

  @override
  String get homeGoal => 'היעד היומי';

  @override
  String get homeGoalReached => 'היעד היומי הושג!';

  @override
  String get homeGoalReachedBody =>
      'נתראה מחר, או שאפשר להמשיך לשחק בשביל נקודות.';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$done מתוך $goal מילים נלמדו או נענו נכון';
  }

  @override
  String get adsOutOfHints => 'נגמרו הרמזים';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'לצפות בפרסומת קצרה בשביל עוד $count רמזים?',
      two: 'לצפות בפרסומת קצרה בשביל עוד שני רמזים?',
      one: 'לצפות בפרסומת קצרה בשביל עוד רמז אחד?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'לא עכשיו';

  @override
  String get adsWatchAd => 'לצפות בפרסומת';

  @override
  String adsDoublePoints(int points) {
    return 'נקודות כפולות (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'לשחזר את הרצף של $days ימים',
      two: 'לשחזר את הרצף של יומיים',
      one: 'לשחזר את הרצף של יום אחד',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'עוד גרמנית מ-Pratiyush';

  @override
  String get rulePluralOnly => 'שם עצם ברבים בלבד: ברבים תמיד die.';

  @override
  String ruleCompound(String head) {
    return 'מילים מורכבות מקבלות את הארטיקל של החלק האחרון שלהן: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'רוב שמות העצם עם הסיומת -$suffix מקבלים $article.';
  }

  @override
  String get levelBeginner => 'מתחילים';

  @override
  String get levelElementary => 'בסיסי';

  @override
  String get levelIntermediate => 'בינוני';

  @override
  String get levelUpperIntermediate => 'בינוני-מתקדם';

  @override
  String get levelAllInSequence => 'כל הרמות לפי הסדר';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · מומלץ';

  @override
  String get levelOrChoose => 'או לבחור רמה אחת או יותר';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count מילים',
      two: 'שתי מילים',
      one: 'מילה אחת',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'רמה $level';
  }

  @override
  String get levelsKeepProgress =>
      'ההתקדמות נשמרת לכל רמה, כך שמעבר בין רמות אף פעם לא מוחק מילה שנלמדה.';

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
      other: '$count רמזים',
      two: 'שני רמזים',
      one: 'רמז אחד',
      zero: 'בלי רמזים',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'הלוח של היום, זהה לכל הלומדים';

  @override
  String practiceDailyDone(String stars) {
    return 'הושלם היום: $stars. הקשה לשיתוף';
  }

  @override
  String get dddPerfect => 'Perfekt! כל הארטיקלים נכונים.';

  @override
  String get dddTip => 'הצבע עוזר לזכור: der שחור, die אדום, das זהב.';

  @override
  String dddItsArticle(String article) {
    return 'התשובה: $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! מהיר כברק.';

  @override
  String get falleeKeepGoing => 'ממשיכים: ככל שמשחקים יותר, קוראים מהר יותר.';

  @override
  String hiveRound(int round) {
    return 'סיבוב $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'מילה $n מתוך $total';
  }

  @override
  String get hiveCoach =>
      'מקישים או גוררים דרך אותיות סמוכות כדי לאיית את המילה בגרמנית';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'נשארו $count אותיות',
      two: 'נשארו שתי אותיות',
      one: 'נשארה אות אחת',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'רמז';

  @override
  String get hiveBoardCleared => 'הלוח נוקה!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count נקודות',
      two: '+$count נקודות',
      one: '+$count נקודה',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'שיתוף התוצאה';

  @override
  String get commonDone => 'סיום';

  @override
  String get hiveNextRound => 'לסיבוב הבא';

  @override
  String get commonLearn => 'ללמוד';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'למדת $count מילים חדשות. הן יחזרו לתרגול מחר.',
      two: 'למדת שתי מילים חדשות. הן יחזרו לתרגול מחר.',
      one: 'למדת מילה חדשה אחת. היא תחזור לתרגול מחר.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'אחר כך';

  @override
  String get learnKnowIt => 'ידוע לי';

  @override
  String get learnFlip => 'להפוך';

  @override
  String get learnPluralOnly => 'רבים בלבד · תמיד die';

  @override
  String learnPlural(String plural) {
    return 'רבים: $plural';
  }

  @override
  String get onboardingIntro =>
      'לומדים מילים בגרמנית תוך כדי משחק. מה הרמה שלך?';

  @override
  String get onboardingStart => 'להתחיל';

  @override
  String get onboardingNotSure => 'לא יודעים? מתחילים ב-A1';

  @override
  String get onboardingChangeLater => 'אפשר לשנות את זה בכל עת בהגדרות.';

  @override
  String get practiceTitle => 'תרגול';

  @override
  String get practiceSpellDue => 'לאיית את המילים שהגיע זמנן';

  @override
  String get practiceLearnFirst => 'קודם כדאי ללמוד כמה מילים';

  @override
  String get practiceCaughtUp => 'הכול מעודכן. נתראה מחר!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count מילים',
      two: 'שתי מילים',
      one: 'מילה אחת',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'משחקים';

  @override
  String get practiceHiveSub => 'מחליקים על חלת הדבש כדי לאיית כל מילה';

  @override
  String get practiceDddSub => 'בוחרים את הארטיקל הנכון';

  @override
  String get practiceFalleeSub => 'בוחרים את הפירוש לפני שהמילה נוחתת';

  @override
  String get settingsTitle => 'הגדרות';

  @override
  String get settingsMadeBy => 'נוצר עם ❤️ על ידי Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'רמות';

  @override
  String get settingsAutoSpeak => 'הקראת מילים אוטומטית';

  @override
  String get settingsAutoSpeakSub => 'בכרטיסיות ואחרי תשובות';

  @override
  String get settingsGamesAsPractice => 'משחקים נחשבים לתרגול';

  @override
  String get settingsGamesAsPracticeSub =>
      'תשובות במשחקים מקדמות או מורידות מילים שנלמדו';

  @override
  String get settingsSounds => 'צלילים ורטט';

  @override
  String get settingsSoundsSub => 'במשחקים ובתרגול';

  @override
  String get settingsReset => 'איפוס ההתקדמות';

  @override
  String get settingsResetTitle => 'לאפס את ההתקדמות?';

  @override
  String get settingsResetBody =>
      'פעולה זו מוחקת את כל המילים שנלמדו, את הנקודות ואת הרצף.';

  @override
  String get commonCancel => 'ביטול';

  @override
  String get settingsResetConfirm => 'איפוס';

  @override
  String get settingsPrivacyChoices => 'פרטיות ופרסומות';

  @override
  String get settingsPrivacyPolicy => 'מדיניות פרטיות';

  @override
  String get settingsContact => 'פנייה לתמיכה';

  @override
  String get settingsLicences => 'רישיונות קוד פתוח';

  @override
  String settingsAbout(int count) {
    return 'מילים נפוצות בגרמנית ($count) עם תרגום לאנגלית והגייה מוקלטת. בלי תשלום: כל המילים והמשחקים בחינם.';
  }

  @override
  String get settingsMailLastError => 'השגיאה האחרונה במכשיר הזה (אפשר למחוק):';

  @override
  String get spellingTitle => 'תרגול';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count מילים',
      two: 'שתי מילים',
      one: 'מילה אחת',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points נקודות',
      two: 'שתי נקודות',
      one: 'נקודה אחת',
    );
    return 'תרגלת $_temp0 ואספת $_temp1.';
  }

  @override
  String get spellingNounHint => 'שם עצם — כולל der, die או das';

  @override
  String get spellingAnswerIs => 'התשובה היא';

  @override
  String get commonNext => 'הבא';

  @override
  String get spellingSkip => 'דילוג';

  @override
  String get spellingDelete => 'מחיקה';

  @override
  String get spellingCheck => 'בדיקה';

  @override
  String get wordListAllLearned => 'למדת את כל המילים ברשימה הזאת.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'נשארו $count מילים ברשימה הזאת.',
      two: 'נשארו שתי מילים ברשימה הזאת.',
      one: 'נשארה מילה אחת ברשימה הזאת.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'אוצר מילים ($count)';
  }

  @override
  String get reminderBody => 'ה-Daily Hive של היום מוכן. חמש דקות של גרמנית?';

  @override
  String get reminderChannel => 'תזכורת יומית';

  @override
  String get reminderChannelDesc => 'תזכורת אחת ביום, בשעה שבוחרים.';

  @override
  String get reminderSwitch => 'תזכורת יומית';

  @override
  String reminderOnAt(String time) {
    return 'תזכורת אחת ביום ב-$time';
  }

  @override
  String get reminderOff => 'תזכורת אחת ביום, בשעה לבחירתך';

  @override
  String get reminderBlocked =>
      'כדי לקבל תזכורת, צריך לאפשר התראות ל-Wortschatz בהגדרות הטלפון.';

  @override
  String get reminderTime => 'שעת התזכורת';

  @override
  String commonMastery(int level, int max) {
    return 'שליטה $level מתוך $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent% נלמדו';
  }

  @override
  String get commonListen => 'האזנה';

  @override
  String get commonNoVoice =>
      'לא מותקן קול גרמני. אפשר להוסיף אחד בהגדרות המרת טקסט לדיבור במכשיר.';

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
    return 'יש נתוני מילים חדשים. לעדכן ($size)';
  }

  @override
  String get contentUpdating => 'המילים מתעדכנות…';

  @override
  String get contentUpdatedBanner =>
      'המילים עודכנו. הן יופיעו בפעם הבאה שהאפליקציה תיפתח; ההקלטות כבר מתנגנות.';

  @override
  String get contentChecking => 'בבדיקה…';

  @override
  String get contentDownloading => 'הורדה ובדיקה של קבצים…';

  @override
  String contentAvailable(int version, String size) {
    return 'גרסה $version זמינה, $size';
  }

  @override
  String get contentUpdate => 'עדכון';

  @override
  String get contentUpdated =>
      'עודכן. מילים חדשות יופיעו בפעם הבאה שהאפליקציה תיפתח.';

  @override
  String get contentUpToDate => 'הכול מעודכן';

  @override
  String get contentCheck => 'בדיקה';

  @override
  String get contentAppTooOld => 'צריך לעדכן את האפליקציה כדי לקבל תוכן חדש';

  @override
  String get contentStore => 'חנות';

  @override
  String get contentFailed => 'העדכון נכשל. המילים שלך לא השתנו.';

  @override
  String get contentRetry => 'לנסות שוב';

  @override
  String contentTitle(int version) {
    return 'תוכן המילים · גרסה $version';
  }

  @override
  String get contentAutoWifi => 'עדכון אוטומטי ב-Wi-Fi';

  @override
  String get contentAutoWifiSub => 'אף פעם לא בחבילת גלישה';

  @override
  String summaryCombo(int count) {
    return 'קומבו: $count ברצף';
  }

  @override
  String get summaryNewBest => 'שיא חדש!';

  @override
  String summaryBestCombo(int count) {
    return 'הקומבו הטוב ביותר: $count ברצף';
  }

  @override
  String get summaryPlayAgain => 'לשחק שוב';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count כוכבים מתוך 3',
      two: 'שני כוכבים מתוך 3',
      one: 'כוכב אחד מתוך 3',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'לקרוא סיפורים אמיתיים בגרמנית, מילה אחר מילה';

  @override
  String get siblingWordbit => 'מילה בגרמנית בכל פתיחת נעילה';

  @override
  String get siblingLeben => 'לעבור את מבחן האזרחות';

  @override
  String get siblingAudiobookName => 'ספר שמע בגרמנית';

  @override
  String get siblingAudiobook => 'להאזין לסיפורים לפי רמות';
}
