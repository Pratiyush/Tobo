// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get settingsLanguage => 'অ্যাপের ভাষা';

  @override
  String get languageSearchHint => 'ভাষা খুঁজুন';

  @override
  String get languageSystemDefault => 'সিস্টেমের ভাষা';

  @override
  String languageFollowsDevice(String language) {
    return 'ডিভাইস অনুযায়ী · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz চালু করা যায়নি।\n\n$error';
  }

  @override
  String get navWords => 'শব্দ';

  @override
  String get navPractice => 'অনুশীলন';

  @override
  String get navSettings => 'সেটিংস';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'স্ট্রিক: $count দিন',
      one: 'স্ট্রিক: $count দিন',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'পয়েন্ট';

  @override
  String get homeToPractise => 'অনুশীলন বাকি';

  @override
  String get homeVocabulary => 'শব্দভান্ডার';

  @override
  String homeLevel(int level) {
    return 'লেভেল $level';
  }

  @override
  String get homeLevelCaps => 'লেভেল';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি শব্দ',
      one: '$countটি শব্দ',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'লেভেল $level: $totalটির মধ্যে $learnedটি শব্দ শেখা হয়েছে';
  }

  @override
  String get homeStartHere => 'এখান থেকে শুরু করুন';

  @override
  String get homeStartHereBody =>
      'প্রথম 10টি শব্দ উচ্চারণসহ শিখুন, তারপর গেমে সেগুলো নিয়ে খেলুন।';

  @override
  String get homeLearn10 => '10টি শব্দ শিখুন';

  @override
  String get homeGoal => 'আজকের লক্ষ্য';

  @override
  String get homeGoalReached => 'আজকের লক্ষ্য পূরণ!';

  @override
  String get homeGoalReachedBody =>
      'কাল দেখা হবে, অথবা পয়েন্টের জন্য খেলতে থাকুন।';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$goalটির মধ্যে $doneটি শব্দ শেখা বা সঠিক উত্তর';
  }

  @override
  String get adsOutOfHints => 'ইঙ্গিত শেষ';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'আরও $countটি ইঙ্গিতের জন্য একটি ছোট বিজ্ঞাপন দেখবেন?',
      one: 'আরও $countটি ইঙ্গিতের জন্য একটি ছোট বিজ্ঞাপন দেখবেন?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'এখন না';

  @override
  String get adsWatchAd => 'বিজ্ঞাপন দেখুন';

  @override
  String adsDoublePoints(int points) {
    return 'দ্বিগুণ পয়েন্ট (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'আপনার $days দিনের স্ট্রিক ফিরিয়ে আনুন',
      one: 'আপনার $days দিনের স্ট্রিক ফিরিয়ে আনুন',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Pratiyush-এর আরও জার্মান';

  @override
  String get rulePluralOnly => 'শুধু বহুবচন বিশেষ্য: বহুবচনে সবসময় die।';

  @override
  String ruleCompound(String head) {
    return 'যৌগিক শব্দ তার শেষ অংশের আর্টিকেল নেয়: $head।';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return '-$suffix দিয়ে শেষ হওয়া বেশিরভাগ বিশেষ্য $article নেয়।';
  }

  @override
  String get levelBeginner => 'প্রারম্ভিক';

  @override
  String get levelElementary => 'প্রাথমিক';

  @override
  String get levelIntermediate => 'মধ্যবর্তী';

  @override
  String get levelUpperIntermediate => 'উচ্চ মধ্যবর্তী';

  @override
  String get levelAllInSequence => 'সব লেভেল ক্রমানুসারে';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · প্রস্তাবিত';

  @override
  String get levelOrChoose => 'অথবা এক বা একাধিক লেভেল বেছে নিন';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি শব্দ',
      one: '$countটি শব্দ',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'লেভেল $level';
  }

  @override
  String get levelsKeepProgress =>
      'প্রতিটি লেভেলের অগ্রগতি সংরক্ষিত থাকে, তাই লেভেল বদলালে কোনো শেখা শব্দ হারায় না।';

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
      other: '$countটি ইঙ্গিত',
      one: '$countটি ইঙ্গিত',
      zero: 'কোনো ইঙ্গিত ছাড়া',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'আজকের বোর্ড, সব শিক্ষার্থীর জন্য একই';

  @override
  String practiceDailyDone(String stars) {
    return 'আজ শেষ: $stars। শেয়ার করতে ট্যাপ করুন';
  }

  @override
  String get dddPerfect => 'Perfekt! সব আর্টিকেল সঠিক।';

  @override
  String get dddTip =>
      'রং মনে রাখতে সাহায্য করে: der কালো, die লাল, das সোনালি।';

  @override
  String dddItsArticle(String article) {
    return 'সঠিক হলো $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! বিদ্যুতের গতিতে।';

  @override
  String get falleeKeepGoing => 'চালিয়ে যান: যত বেশি খেলবেন, তত দ্রুত পড়বেন।';

  @override
  String hiveRound(int round) {
    return 'রাউন্ড $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return '$totalটির মধ্যে শব্দ $n';
  }

  @override
  String get hiveCoach =>
      'জার্মান শব্দটির বানান করতে পাশাপাশি অক্ষরে ট্যাপ করুন বা আঙুল টেনে নিন';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'আর $countটি অক্ষর বাকি',
      one: 'আর $countটি অক্ষর বাকি',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'ইঙ্গিত';

  @override
  String get hiveBoardCleared => 'বোর্ড পরিষ্কার!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count পয়েন্ট',
      one: '+$count পয়েন্ট',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'ফল শেয়ার করুন';

  @override
  String get commonDone => 'হয়ে গেছে';

  @override
  String get hiveNextRound => 'পরের রাউন্ড';

  @override
  String get commonLearn => 'শিখুন';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'আপনি $countটি নতুন শব্দ শিখলেন। কাল সেগুলো অনুশীলনের জন্য ফিরে আসবে।',
      one: 'আপনি $countটি নতুন শব্দ শিখলেন। কাল এটি অনুশীলনের জন্য ফিরে আসবে।',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'পরে';

  @override
  String get learnKnowIt => 'জানি';

  @override
  String get learnFlip => 'উল্টান';

  @override
  String get learnPluralOnly => 'শুধু বহুবচন · সবসময় die';

  @override
  String learnPlural(String plural) {
    return 'বহুবচন: $plural';
  }

  @override
  String get onboardingIntro =>
      'খেলতে খেলতে জার্মান শব্দ শিখুন। আপনার লেভেল কী?';

  @override
  String get onboardingStart => 'শুরু করুন';

  @override
  String get onboardingNotSure => 'নিশ্চিত নন? A1 থেকে শুরু করুন';

  @override
  String get onboardingChangeLater =>
      'সেটিংসে গিয়ে যেকোনো সময় এটি বদলাতে পারবেন।';

  @override
  String get practiceTitle => 'অনুশীলন';

  @override
  String get practiceSpellDue => 'যে শব্দগুলোর সময় হয়েছে সেগুলোর বানান লিখুন';

  @override
  String get practiceLearnFirst => 'আগে কিছু শব্দ শিখুন';

  @override
  String get practiceCaughtUp => 'সব হয়ে গেছে। কাল আবার আসুন!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি শব্দ',
      one: '$countটি শব্দ',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'গেম';

  @override
  String get practiceHiveSub =>
      'প্রতিটি শব্দের বানান করতে মৌচাকের ওপর আঙুল টানুন';

  @override
  String get practiceDddSub => 'সঠিক আর্টিকেল বেছে নিন';

  @override
  String get practiceFalleeSub => 'শব্দটি নামার আগে অর্থ বেছে নিন';

  @override
  String get settingsTitle => 'সেটিংস';

  @override
  String get settingsMadeBy => 'Pratiyush Kumar Singh ❤️ দিয়ে বানিয়েছেন';

  @override
  String get settingsLevels => 'লেভেল';

  @override
  String get settingsAutoSpeak => 'শব্দের স্বয়ংক্রিয় উচ্চারণ';

  @override
  String get settingsAutoSpeakSub => 'ফ্ল্যাশকার্ডে এবং উত্তরের পরে';

  @override
  String get settingsGamesAsPractice => 'গেমকে অনুশীলন হিসেবে গণনা';

  @override
  String get settingsGamesAsPracticeSub =>
      'গেমের উত্তর শেখা শব্দগুলোকে ওপরে বা নিচে সরায়';

  @override
  String get settingsSounds => 'সাউন্ড ও ভাইব্রেশন';

  @override
  String get settingsSoundsSub => 'গেম ও অনুশীলনে';

  @override
  String get settingsReset => 'অগ্রগতি রিসেট';

  @override
  String get settingsResetTitle => 'অগ্রগতি রিসেট করবেন?';

  @override
  String get settingsResetBody =>
      'এতে সব শেখা শব্দ, আপনার পয়েন্ট ও স্ট্রিক মুছে যাবে।';

  @override
  String get commonCancel => 'বাতিল';

  @override
  String get settingsResetConfirm => 'রিসেট';

  @override
  String get settingsPrivacyChoices => 'গোপনীয়তা ও বিজ্ঞাপনের পছন্দ';

  @override
  String get settingsPrivacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String get settingsContact => 'সহায়তায় যোগাযোগ';

  @override
  String get settingsLicences => 'ওপেন-সোর্স লাইসেন্স';

  @override
  String settingsAbout(int count) {
    return 'প্রচলিত জার্মান শব্দ ($count), ইংরেজি অনুবাদ ও রেকর্ড করা উচ্চারণসহ। কোনো খরচ নেই: সব শব্দ আর গেম বিনামূল্যে।';
  }

  @override
  String get settingsMailLastError =>
      'এই ডিভাইসের শেষ ত্রুটি (চাইলে মুছে দিন):';

  @override
  String get spellingTitle => 'অনুশীলন';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি শব্দ',
      one: '$countটি শব্দ',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points পয়েন্ট',
      one: '$points পয়েন্ট',
    );
    return 'আপনি $_temp0 অনুশীলন করলেন এবং $_temp1 পেলেন।';
  }

  @override
  String get spellingNounHint => 'বিশেষ্য — der, die বা das সহ';

  @override
  String get spellingAnswerIs => 'সঠিক উত্তর';

  @override
  String get commonNext => 'পরবর্তী';

  @override
  String get spellingSkip => 'বাদ দিন';

  @override
  String get spellingDelete => 'মুছুন';

  @override
  String get spellingCheck => 'যাচাই';

  @override
  String get wordListAllLearned => 'এই তালিকার সব শব্দ আপনি শিখে ফেলেছেন।';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'এই তালিকায় আর $countটি শব্দ বাকি।',
      one: 'এই তালিকায় আর $countটি শব্দ বাকি।',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'শব্দভান্ডার ($count)';
  }

  @override
  String get reminderBody =>
      'আজকের Daily Hive তৈরি। পাঁচ মিনিট জার্মান হয়ে যাক?';

  @override
  String get reminderChannel => 'প্রতিদিনের রিমাইন্ডার';

  @override
  String get reminderChannelDesc =>
      'দিনে একটি রিমাইন্ডার, আপনার বেছে নেওয়া সময়ে।';

  @override
  String get reminderSwitch => 'প্রতিদিনের রিমাইন্ডার';

  @override
  String reminderOnAt(String time) {
    return 'প্রতিদিন $time-এ একটি রিমাইন্ডার';
  }

  @override
  String get reminderOff => 'দিনে একটি রিমাইন্ডার, আপনার পছন্দের সময়ে';

  @override
  String get reminderBlocked =>
      'রিমাইন্ডার পেতে ফোনের সেটিংসে Wortschatz-এর বিজ্ঞপ্তি চালু করুন।';

  @override
  String get reminderTime => 'রিমাইন্ডারের সময়';

  @override
  String commonMastery(int level, int max) {
    return 'দক্ষতা $max-এর মধ্যে $level';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent% শেখা হয়েছে';
  }

  @override
  String get commonListen => 'শুনুন';

  @override
  String get commonNoVoice =>
      'কোনো জার্মান ভয়েস ইনস্টল করা নেই। ডিভাইসের টেক্সট-টু-স্পিচ সেটিংসে একটি যোগ করুন।';

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
    return 'শব্দের নতুন ডেটা এসেছে। আপডেট করুন ($size)';
  }

  @override
  String get contentUpdating => 'শব্দ আপডেট হচ্ছে…';

  @override
  String get contentUpdatedBanner =>
      'শব্দ আপডেট হয়েছে। পরের বার অ্যাপ খুললে দেখা যাবে; রেকর্ডিং এখনই চলে।';

  @override
  String get contentChecking => 'যাচাই হচ্ছে…';

  @override
  String get contentDownloading => 'ফাইল ডাউনলোড ও যাচাই হচ্ছে…';

  @override
  String contentAvailable(int version, String size) {
    return 'সংস্করণ $version পাওয়া যাচ্ছে, $size';
  }

  @override
  String get contentUpdate => 'আপডেট';

  @override
  String get contentUpdated =>
      'আপডেট হয়েছে। নতুন শব্দ পরের বার অ্যাপ খুললে দেখা যাবে।';

  @override
  String get contentUpToDate => 'সর্বশেষ সংস্করণ';

  @override
  String get contentCheck => 'যাচাই';

  @override
  String get contentAppTooOld => 'নতুন কনটেন্ট পেতে অ্যাপ আপডেট করুন';

  @override
  String get contentStore => 'স্টোর';

  @override
  String get contentFailed => 'আপডেট হয়নি। আপনার শব্দ যেমন ছিল তেমনই আছে।';

  @override
  String get contentRetry => 'আবার চেষ্টা';

  @override
  String contentTitle(int version) {
    return 'শব্দ কনটেন্ট · সংস্করণ $version';
  }

  @override
  String get contentAutoWifi => 'Wi-Fi-তে নিজে থেকে আপডেট';

  @override
  String get contentAutoWifiSub => 'মোবাইল ডেটায় কখনো না';

  @override
  String summaryCombo(int count) {
    return 'কম্বো: টানা $count';
  }

  @override
  String get summaryNewBest => 'নতুন রেকর্ড!';

  @override
  String summaryBestCombo(int count) {
    return 'সেরা কম্বো: টানা $count';
  }

  @override
  String get summaryPlayAgain => 'আবার খেলুন';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '3টির মধ্যে $countটি তারা',
      one: '3টির মধ্যে $countটি তারা',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'আসল জার্মান গল্প পড়ুন, শব্দে শব্দে';

  @override
  String get siblingWordbit => 'প্রতিবার ফোন আনলক করলেই একটি জার্মান শব্দ';

  @override
  String get siblingLeben => 'নাগরিকত্বের পরীক্ষায় পাস করুন';

  @override
  String get siblingAudiobookName => 'জার্মান অডিওবুক';

  @override
  String get siblingAudiobook => 'লেভেল অনুযায়ী গল্প শুনুন';
}
