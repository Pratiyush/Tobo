// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get settingsLanguage => 'ऐप की भाषा';

  @override
  String get languageSearchHint => 'भाषा खोजें';

  @override
  String get languageSystemDefault => 'सिस्टम की भाषा';

  @override
  String languageFollowsDevice(String language) {
    return 'डिवाइस के अनुसार · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz शुरू नहीं हो सका।\n\n$error';
  }

  @override
  String get navWords => 'शब्द';

  @override
  String get navPractice => 'अभ्यास';

  @override
  String get navSettings => 'सेटिंग्स';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'स्ट्रीक: $count दिन',
      one: 'स्ट्रीक: $count दिन',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'पॉइंट';

  @override
  String get homeToPractise => 'अभ्यास बाकी';

  @override
  String get homeVocabulary => 'शब्दावली';

  @override
  String homeLevel(int level) {
    return 'लेवल $level';
  }

  @override
  String get homeLevelCaps => 'लेवल';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count शब्द',
      one: '$count शब्द',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'लेवल $level: $total में से $learned शब्द सीखे गए';
  }

  @override
  String get homeStartHere => 'यहाँ से शुरू करें';

  @override
  String get homeStartHereBody =>
      'अपने पहले 10 शब्द आवाज़ के साथ सीखें, फिर उन्हें गेम में खेलें।';

  @override
  String get homeLearn10 => '10 शब्द सीखें';

  @override
  String get homeGoal => 'आज का लक्ष्य';

  @override
  String get homeGoalReached => 'आज का लक्ष्य पूरा!';

  @override
  String get homeGoalReachedBody => 'कल मिलते हैं, या पॉइंट के लिए खेलते रहें।';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$goal में से $done शब्द सीखे या सही बताए';
  }

  @override
  String get adsOutOfHints => 'संकेत खत्म हो गए';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count और संकेतों के लिए छोटा विज्ञापन देखें?',
      one: '$count और संकेत के लिए छोटा विज्ञापन देखें?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'अभी नहीं';

  @override
  String get adsWatchAd => 'विज्ञापन देखें';

  @override
  String adsDoublePoints(int points) {
    return 'दोगुने पॉइंट (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'अपनी $days दिन की स्ट्रीक वापस पाएँ',
      one: 'अपनी $days दिन की स्ट्रीक वापस पाएँ',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Pratiyush से और जर्मन';

  @override
  String get rulePluralOnly =>
      'सिर्फ़ बहुवचन वाली संज्ञा: बहुवचन में हमेशा die लगता है।';

  @override
  String ruleCompound(String head) {
    return 'संयुक्त शब्द अपने आख़िरी हिस्से का आर्टिकल लेते हैं: $head।';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return '-$suffix पर ख़त्म होने वाली ज़्यादातर संज्ञाएँ $article लेती हैं।';
  }

  @override
  String get levelBeginner => 'शुरुआती';

  @override
  String get levelElementary => 'प्राथमिक';

  @override
  String get levelIntermediate => 'मध्यम';

  @override
  String get levelUpperIntermediate => 'उच्च मध्यम';

  @override
  String get levelAllInSequence => 'सभी लेवल क्रम से';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · सुझाया गया';

  @override
  String get levelOrChoose => 'या एक या ज़्यादा लेवल चुनें';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count शब्द',
      one: '$count शब्द',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'लेवल $level';
  }

  @override
  String get levelsKeepProgress =>
      'हर लेवल की प्रगति सहेजी रहती है, इसलिए लेवल बदलने से कोई सीखा हुआ शब्द नहीं खोता।';

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
      other: '$count संकेत',
      one: '$count संकेत',
      zero: 'कोई संकेत नहीं',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'आज का बोर्ड, हर सीखने वाले के लिए एक जैसा';

  @override
  String practiceDailyDone(String stars) {
    return 'आज पूरा: $stars। शेयर करने के लिए टैप करें';
  }

  @override
  String get dddPerfect => 'Perfekt! हर आर्टिकल सही।';

  @override
  String get dddTip =>
      'रंग याद रखने में मदद करता है: der काला, die लाल, das सुनहरा।';

  @override
  String dddItsArticle(String article) {
    return 'सही है $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! बिजली जैसी तेज़ी।';

  @override
  String get falleeKeepGoing =>
      'खेलते रहें: ज़्यादा खेलने से पढ़ने की रफ़्तार बढ़ती है।';

  @override
  String hiveRound(int round) {
    return 'राउंड $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return '$total में से शब्द $n';
  }

  @override
  String get hiveCoach =>
      'जर्मन शब्द बनाने के लिए पास-पास के अक्षरों पर टैप करें या उन पर उँगली फेरें';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count अक्षर बाकी',
      one: '$count अक्षर बाकी',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'संकेत';

  @override
  String get hiveBoardCleared => 'बोर्ड साफ़!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count पॉइंट',
      one: '+$count पॉइंट',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'नतीजा शेयर करें';

  @override
  String get commonDone => 'हो गया';

  @override
  String get hiveNextRound => 'अगला राउंड';

  @override
  String get commonLearn => 'सीखें';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'आपने $count नए शब्द सीखे। ये कल अभ्यास के लिए फिर आएँगे।',
      one: 'आपने $count नया शब्द सीखा। यह कल अभ्यास के लिए फिर आएगा।',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'बाद में';

  @override
  String get learnKnowIt => 'पता है';

  @override
  String get learnFlip => 'पलटें';

  @override
  String get learnPluralOnly => 'सिर्फ़ बहुवचन · हमेशा die';

  @override
  String learnPlural(String plural) {
    return 'बहुवचन: $plural';
  }

  @override
  String get onboardingIntro =>
      'खेल-खेल में जर्मन शब्द सीखें। आपका लेवल क्या है?';

  @override
  String get onboardingStart => 'शुरू करें';

  @override
  String get onboardingNotSure => 'पता नहीं? A1 से शुरू करें';

  @override
  String get onboardingChangeLater =>
      'इसे कभी भी सेटिंग्स में बदला जा सकता है।';

  @override
  String get practiceTitle => 'अभ्यास';

  @override
  String get practiceSpellDue => 'दोहराने वाले शब्दों की स्पेलिंग लिखें';

  @override
  String get practiceLearnFirst => 'पहले कुछ शब्द सीखें';

  @override
  String get practiceCaughtUp => 'सब पूरा हो गया। कल फिर आएँ!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count शब्द',
      one: '$count शब्द',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'गेम';

  @override
  String get practiceHiveSub => 'हर शब्द बनाने के लिए छत्ते पर उँगली फेरें';

  @override
  String get practiceDddSub => 'सही आर्टिकल चुनें';

  @override
  String get practiceFalleeSub => 'शब्द के गिरने से पहले मतलब चुनें';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get settingsMadeBy => 'Pratiyush Kumar Singh ने ❤️ से बनाया';

  @override
  String get settingsLevels => 'लेवल';

  @override
  String get settingsAutoSpeak => 'शब्दों का अपने-आप उच्चारण';

  @override
  String get settingsAutoSpeakSub => 'फ़्लैशकार्ड पर और जवाब के बाद';

  @override
  String get settingsGamesAsPractice => 'गेम को अभ्यास में गिनें';

  @override
  String get settingsGamesAsPracticeSub =>
      'गेम के जवाब सीखे हुए शब्दों को ऊपर या नीचे ले जाते हैं';

  @override
  String get settingsSounds => 'आवाज़ और वाइब्रेशन';

  @override
  String get settingsSoundsSub => 'गेम और अभ्यास में';

  @override
  String get settingsReset => 'प्रगति रीसेट करें';

  @override
  String get settingsResetTitle => 'प्रगति रीसेट करें?';

  @override
  String get settingsResetBody =>
      'इससे सीखे हुए सभी शब्द, आपके पॉइंट और आपकी स्ट्रीक मिट जाएँगे।';

  @override
  String get commonCancel => 'रद्द करें';

  @override
  String get settingsResetConfirm => 'रीसेट';

  @override
  String get settingsPrivacyChoices => 'निजता और विज्ञापन विकल्प';

  @override
  String get settingsPrivacyPolicy => 'निजता नीति';

  @override
  String get settingsContact => 'सहायता से संपर्क';

  @override
  String get settingsLicences => 'ओपन-सोर्स लाइसेंस';

  @override
  String settingsAbout(int count) {
    return 'आम जर्मन शब्द ($count), अंग्रेज़ी अनुवाद और रिकॉर्ड किए गए उच्चारण के साथ। कोई भुगतान नहीं: हर शब्द और हर गेम मुफ़्त है।';
  }

  @override
  String get settingsMailLastError =>
      'इस डिवाइस पर आख़िरी गड़बड़ी (चाहें तो मिटा दें):';

  @override
  String get spellingTitle => 'अभ्यास';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count शब्दों',
      one: '$count शब्द',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points पॉइंट पाए',
      one: '$points पॉइंट पाया',
    );
    return 'आपने $_temp0 का अभ्यास किया और $_temp1।';
  }

  @override
  String get spellingNounHint => 'संज्ञा — der, die या das के साथ';

  @override
  String get spellingAnswerIs => 'सही जवाब है';

  @override
  String get commonNext => 'आगे';

  @override
  String get spellingSkip => 'छोड़ें';

  @override
  String get spellingDelete => 'मिटाएँ';

  @override
  String get spellingCheck => 'जाँचें';

  @override
  String get wordListAllLearned => 'आपने इस सूची का हर शब्द सीख लिया है।';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'इस सूची में $count शब्द बाकी हैं।',
      one: 'इस सूची में $count शब्द बाकी है।',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'शब्दावली ($count)';
  }

  @override
  String get reminderBody =>
      'आज का Daily Hive तैयार है। पाँच मिनट जर्मन हो जाए?';

  @override
  String get reminderChannel => 'रोज़ का रिमाइंडर';

  @override
  String get reminderChannelDesc => 'दिन में एक रिमाइंडर, आपके चुने समय पर।';

  @override
  String get reminderSwitch => 'रोज़ का रिमाइंडर';

  @override
  String reminderOnAt(String time) {
    return 'रोज़ $time पर एक रिमाइंडर';
  }

  @override
  String get reminderOff => 'दिन में एक रिमाइंडर, आपकी पसंद के समय पर';

  @override
  String get reminderBlocked =>
      'रिमाइंडर पाने के लिए फ़ोन की सेटिंग्स में Wortschatz की सूचनाएँ चालू करें।';

  @override
  String get reminderTime => 'रिमाइंडर का समय';

  @override
  String commonMastery(int level, int max) {
    return 'महारत $max में से $level';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent% सीखा';
  }

  @override
  String get commonListen => 'सुनें';

  @override
  String get commonNoVoice =>
      'कोई जर्मन आवाज़ इंस्टॉल नहीं है। डिवाइस की टेक्स्ट-टू-स्पीच सेटिंग्स में एक जोड़ें।';

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
    return 'शब्दों का नया डेटा उपलब्ध है। अपडेट करें ($size)';
  }

  @override
  String get contentUpdating => 'शब्द अपडेट हो रहे हैं…';

  @override
  String get contentUpdatedBanner =>
      'शब्द अपडेट हो गए। ये अगली बार ऐप खोलने पर दिखेंगे; रिकॉर्डिंग अभी से चलती हैं।';

  @override
  String get contentChecking => 'जाँच हो रही है…';

  @override
  String get contentDownloading => 'फ़ाइलें डाउनलोड और जाँची जा रही हैं…';

  @override
  String contentAvailable(int version, String size) {
    return 'वर्शन $version उपलब्ध, $size';
  }

  @override
  String get contentUpdate => 'अपडेट करें';

  @override
  String get contentUpdated =>
      'अपडेट हो गया। नए शब्द अगली बार ऐप खोलने पर दिखेंगे।';

  @override
  String get contentUpToDate => 'अप-टू-डेट';

  @override
  String get contentCheck => 'जाँचें';

  @override
  String get contentAppTooOld => 'नई सामग्री के लिए ऐप अपडेट करें';

  @override
  String get contentStore => 'स्टोर';

  @override
  String get contentFailed =>
      'अपडेट नहीं हो सका। आपके शब्द जैसे थे वैसे ही हैं।';

  @override
  String get contentRetry => 'फिर कोशिश करें';

  @override
  String contentTitle(int version) {
    return 'शब्द सामग्री · वर्शन $version';
  }

  @override
  String get contentAutoWifi => 'Wi-Fi पर अपने-आप अपडेट करें';

  @override
  String get contentAutoWifiSub => 'मोबाइल डेटा पर कभी नहीं';

  @override
  String summaryCombo(int count) {
    return 'कॉम्बो: लगातार $count';
  }

  @override
  String get summaryNewBest => 'नया रिकॉर्ड!';

  @override
  String summaryBestCombo(int count) {
    return 'सबसे अच्छा कॉम्बो: लगातार $count';
  }

  @override
  String get summaryPlayAgain => 'फिर खेलें';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '3 में से $count स्टार',
      one: '3 में से $count स्टार',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'असली जर्मन कहानियाँ पढ़ें, शब्द-दर-शब्द';

  @override
  String get siblingWordbit => 'हर बार फ़ोन अनलॉक करने पर एक जर्मन शब्द';

  @override
  String get siblingLeben => 'नागरिकता टेस्ट पास करें';

  @override
  String get siblingAudiobookName => 'जर्मन ऑडियोबुक';

  @override
  String get siblingAudiobook => 'लेवल के हिसाब से कहानियाँ सुनें';
}
