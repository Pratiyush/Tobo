// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get settingsLanguage => 'ஆப்ஸ் மொழி';

  @override
  String get languageSearchHint => 'மொழியைத் தேடுக';

  @override
  String get languageSystemDefault => 'சிஸ்டம் மொழி';

  @override
  String languageFollowsDevice(String language) {
    return 'சாதனத்தின்படி · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz-ஐத் தொடங்க முடியவில்லை.\n\n$error';
  }

  @override
  String get navWords => 'சொற்கள்';

  @override
  String get navPractice => 'பயிற்சி';

  @override
  String get navSettings => 'அமைப்புகள்';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'தொடர்: $count நாட்கள்',
      one: 'தொடர்: $count நாள்',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'புள்ளிகள்';

  @override
  String get homeToPractise => 'பயிற்சிக்கு';

  @override
  String get homeVocabulary => 'சொல்வளம்';

  @override
  String homeLevel(int level) {
    return 'நிலை $level';
  }

  @override
  String get homeLevelCaps => 'நிலை';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count சொற்கள்',
      one: '$count சொல்',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'நிலை $level: $total சொற்களில் $learned கற்றவை';
  }

  @override
  String get homeStartHere => 'இங்கே தொடங்குங்கள்';

  @override
  String get homeStartHereBody =>
      'முதல் 10 சொற்களை ஒலியுடன் கற்று, பிறகு விளையாட்டுகளில் அவற்றுடன் விளையாடுங்கள்.';

  @override
  String get homeLearn10 => '10 சொற்கள் கற்க';

  @override
  String get homeGoal => 'இன்றைய இலக்கு';

  @override
  String get homeGoalReached => 'இன்றைய இலக்கு நிறைவு!';

  @override
  String get homeGoalReachedBody =>
      'நாளை சந்திப்போம், அல்லது புள்ளிகளுக்காகத் தொடர்ந்து விளையாடுங்கள்.';

  @override
  String homeGoalProgress(int done, int goal) {
    return 'கற்ற அல்லது சரியாகச் சொன்ன சொற்கள்: $goal-இல் $done';
  }

  @override
  String get adsOutOfHints => 'குறிப்புகள் தீர்ந்தன';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'இன்னும் $count குறிப்புகளுக்கு ஒரு சிறிய விளம்பரம் பார்க்கிறீர்களா?',
      one: 'இன்னும் $count குறிப்புக்கு ஒரு சிறிய விளம்பரம் பார்க்கிறீர்களா?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'இப்போது வேண்டாம்';

  @override
  String get adsWatchAd => 'விளம்பரம் பார்க்க';

  @override
  String adsDoublePoints(int points) {
    return 'இரட்டைப் புள்ளிகள் (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days நாள் தொடரை மீட்டெடுங்கள்',
      one: '$days நாள் தொடரை மீட்டெடுங்கள்',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Pratiyush வழங்கும் மேலும் ஜெர்மன்';

  @override
  String get rulePluralOnly =>
      'பன்மை மட்டும் உள்ள பெயர்ச்சொல்: பன்மைக்கு எப்போதும் die.';

  @override
  String ruleCompound(String head) {
    return 'கூட்டுச் சொற்கள் கடைசிப் பகுதியின் ஆர்டிகிளை எடுக்கும்: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return '-$suffix என முடியும் பெரும்பாலான பெயர்ச்சொற்கள் $article எடுக்கும்.';
  }

  @override
  String get levelBeginner => 'தொடக்கநிலை';

  @override
  String get levelElementary => 'அடிப்படை';

  @override
  String get levelIntermediate => 'இடைநிலை';

  @override
  String get levelUpperIntermediate => 'உயர் இடைநிலை';

  @override
  String get levelAllInSequence => 'எல்லா நிலைகளும் வரிசையாக';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · பரிந்துரை';

  @override
  String get levelOrChoose => 'அல்லது ஒன்று அல்லது பல நிலைகளைத் தேர்வுசெய்க';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count சொற்கள்',
      one: '$count சொல்',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'நிலை $level';
  }

  @override
  String get levelsKeepProgress =>
      'ஒவ்வொரு நிலைக்கும் உங்கள் முன்னேற்றம் சேமிக்கப்படும்; நிலையை மாற்றினாலும் கற்ற எந்தச் சொல்லும் இழக்கப்படாது.';

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
      other: '$count குறிப்புகள்',
      one: '$count குறிப்பு',
      zero: 'குறிப்பு இல்லை',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'இன்றைய பலகை, எல்லோருக்கும் ஒன்றே';

  @override
  String practiceDailyDone(String stars) {
    return 'இன்று முடிந்தது: $stars. பகிரத் தட்டவும்';
  }

  @override
  String get dddPerfect => 'Perfekt! எல்லா ஆர்டிகிள்களும் சரி.';

  @override
  String get dddTip =>
      'நிறம் நினைவில் வைக்க உதவும்: der கருப்பு, die சிவப்பு, das தங்கம்.';

  @override
  String dddItsArticle(String article) {
    return 'சரியானது $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! மின்னல் வேகம்.';

  @override
  String get falleeKeepGoing =>
      'தொடருங்கள்: அதிகம் விளையாடினால், வேகமாகப் படிப்பீர்கள்.';

  @override
  String hiveRound(int round) {
    return 'சுற்று $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'சொல் $n / $total';
  }

  @override
  String get hiveCoach =>
      'ஜெர்மன் சொல்லை எழுத, அடுத்தடுத்த எழுத்துகளைத் தட்டவும் அல்லது இழுக்கவும்';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count எழுத்துகள் மீதம்',
      one: '$count எழுத்து மீதம்',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'குறிப்பு';

  @override
  String get hiveBoardCleared => 'பலகை முடிந்தது!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count புள்ளிகள்',
      one: '+$count புள்ளி',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'முடிவைப் பகிர்';

  @override
  String get commonDone => 'முடிந்தது';

  @override
  String get hiveNextRound => 'அடுத்த சுற்று';

  @override
  String get commonLearn => 'கற்க';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count புதிய சொற்கள் கற்றுக்கொண்டீர்கள். அவை நாளை மீண்டும் பயிற்சிக்கு வரும்.',
      one:
          '$count புதிய சொல் கற்றுக்கொண்டீர்கள். அது நாளை மீண்டும் பயிற்சிக்கு வரும்.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'பிறகு';

  @override
  String get learnKnowIt => 'தெரியும்';

  @override
  String get learnFlip => 'திருப்பு';

  @override
  String get learnPluralOnly => 'பன்மை மட்டும் · எப்போதும் die';

  @override
  String learnPlural(String plural) {
    return 'பன்மை: $plural';
  }

  @override
  String get onboardingIntro =>
      'விளையாடியபடி ஜெர்மன் சொற்களைக் கற்கலாம். உங்கள் நிலை என்ன?';

  @override
  String get onboardingStart => 'தொடங்கு';

  @override
  String get onboardingNotSure => 'உறுதியில்லையா? A1-இல் தொடங்குங்கள்';

  @override
  String get onboardingChangeLater =>
      'இதை எப்போது வேண்டுமானாலும் அமைப்புகளில் மாற்றலாம்.';

  @override
  String get practiceTitle => 'பயிற்சி';

  @override
  String get practiceSpellDue => 'மீள்பார்வைக்கு வந்த சொற்களை எழுதுங்கள்';

  @override
  String get practiceLearnFirst => 'முதலில் சில சொற்களைக் கற்றுக்கொள்ளுங்கள்';

  @override
  String get practiceCaughtUp => 'எல்லாம் முடிந்தது. நாளை வாருங்கள்!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count சொற்கள்',
      one: '$count சொல்',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'விளையாட்டுகள்';

  @override
  String get practiceHiveSub =>
      'ஒவ்வொரு சொல்லையும் எழுத தேன்கூட்டின் மேல் இழுக்கவும்';

  @override
  String get practiceDddSub => 'சரியான ஆர்டிகிளைத் தேர்வுசெய்க';

  @override
  String get practiceFalleeSub => 'சொல் விழும் முன் பொருளைத் தேர்வுசெய்க';

  @override
  String get settingsTitle => 'அமைப்புகள்';

  @override
  String get settingsMadeBy => '❤️ உடன் உருவாக்கியவர் Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'நிலைகள்';

  @override
  String get settingsAutoSpeak => 'சொற்களைத் தானாக ஒலிக்கச் செய்';

  @override
  String get settingsAutoSpeakSub => 'அட்டைகளிலும் பதில்களுக்குப் பிறகும்';

  @override
  String get settingsGamesAsPractice => 'விளையாட்டுகளைப் பயிற்சியாகக் கணக்கிடு';

  @override
  String get settingsGamesAsPracticeSub =>
      'விளையாட்டுப் பதில்கள் கற்ற சொற்களை மேலே அல்லது கீழே நகர்த்தும்';

  @override
  String get settingsSounds => 'ஒலிகள் & அதிர்வு';

  @override
  String get settingsSoundsSub => 'விளையாட்டுகளிலும் பயிற்சியிலும்';

  @override
  String get settingsReset => 'முன்னேற்றத்தை மீட்டமை';

  @override
  String get settingsResetTitle => 'முன்னேற்றத்தை மீட்டமைக்கவா?';

  @override
  String get settingsResetBody =>
      'இது கற்ற எல்லாச் சொற்களையும், உங்கள் புள்ளிகளையும், தொடரையும் அழிக்கும்.';

  @override
  String get commonCancel => 'ரத்துசெய்';

  @override
  String get settingsResetConfirm => 'மீட்டமை';

  @override
  String get settingsPrivacyChoices => 'தனியுரிமை & விளம்பரத் தேர்வுகள்';

  @override
  String get settingsPrivacyPolicy => 'தனியுரிமைக் கொள்கை';

  @override
  String get settingsContact => 'உதவிக் குழுவைத் தொடர்புகொள்';

  @override
  String get settingsLicences => 'ஓப்பன் சோர்ஸ் உரிமங்கள்';

  @override
  String settingsAbout(int count) {
    return 'பொதுவான ஜெர்மன் சொற்கள் ($count), ஆங்கில மொழிபெயர்ப்பு மற்றும் பதிவுசெய்த உச்சரிப்புடன். கட்டணப் பூட்டு இல்லை: எல்லாச் சொற்களும் விளையாட்டுகளும் இலவசம்.';
  }

  @override
  String get settingsMailLastError =>
      'இந்தச் சாதனத்தின் கடைசிப் பிழை (வேண்டுமானால் நீக்கலாம்):';

  @override
  String get spellingTitle => 'பயிற்சி';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count சொற்கள்',
      one: '$count சொல்',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points புள்ளிகள்',
      one: '$points புள்ளி',
    );
    return '$_temp0 பயிற்சி செய்து $_temp1 பெற்றீர்கள்.';
  }

  @override
  String get spellingNounHint =>
      'பெயர்ச்சொல் — der, die அல்லது das சேர்க்கவும்';

  @override
  String get spellingAnswerIs => 'சரியான விடை';

  @override
  String get commonNext => 'அடுத்து';

  @override
  String get spellingSkip => 'தவிர்';

  @override
  String get spellingDelete => 'நீக்கு';

  @override
  String get spellingCheck => 'சரிபார்';

  @override
  String get wordListAllLearned =>
      'இந்தப் பட்டியலின் எல்லாச் சொற்களையும் கற்றுவிட்டீர்கள்.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'இந்தப் பட்டியலில் இன்னும் $count சொற்கள் உள்ளன.',
      one: 'இந்தப் பட்டியலில் இன்னும் $count சொல் உள்ளது.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'சொல்வளம் ($count)';
  }

  @override
  String get reminderBody => 'இன்றைய Daily Hive தயார். ஐந்து நிமிடம் ஜெர்மன்?';

  @override
  String get reminderChannel => 'தினசரி நினைவூட்டல்';

  @override
  String get reminderChannelDesc =>
      'நாளுக்கு ஒரு நினைவூட்டல், நீங்கள் தேர்வுசெய்யும் நேரத்தில்.';

  @override
  String get reminderSwitch => 'தினசரி நினைவூட்டல்';

  @override
  String reminderOnAt(String time) {
    return 'தினமும் $time மணிக்கு ஒரு நினைவூட்டல்';
  }

  @override
  String get reminderOff =>
      'நாளுக்கு ஒரு நினைவூட்டல், நீங்கள் விரும்பும் நேரத்தில்';

  @override
  String get reminderBlocked =>
      'நினைவூட்டல் பெற, ஃபோன் அமைப்புகளில் Wortschatz-க்கு அறிவிப்புகளை அனுமதியுங்கள்.';

  @override
  String get reminderTime => 'நினைவூட்டல் நேரம்';

  @override
  String commonMastery(int level, int max) {
    return 'தேர்ச்சி $level / $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent% கற்றது';
  }

  @override
  String get commonListen => 'கேள்';

  @override
  String get commonNoVoice =>
      'ஜெர்மன் குரல் நிறுவப்படவில்லை. சாதனத்தின் உரையிலிருந்து பேச்சு அமைப்புகளில் ஒன்றைச் சேர்க்கவும்.';

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
    return 'புதிய சொல் தரவு உள்ளது. புதுப்பி ($size)';
  }

  @override
  String get contentUpdating => 'சொற்கள் புதுப்பிக்கப்படுகின்றன…';

  @override
  String get contentUpdatedBanner =>
      'சொற்கள் புதுப்பிக்கப்பட்டன. அடுத்த முறை ஆப்ஸைத் திறக்கும்போது தோன்றும்; பதிவுகள் இப்போதே இயங்கும்.';

  @override
  String get contentChecking => 'சரிபார்க்கிறது…';

  @override
  String get contentDownloading => 'கோப்புகளைப் பதிவிறக்கிச் சரிபார்க்கிறது…';

  @override
  String contentAvailable(int version, String size) {
    return 'பதிப்பு $version உள்ளது, $size';
  }

  @override
  String get contentUpdate => 'புதுப்பி';

  @override
  String get contentUpdated =>
      'புதுப்பிக்கப்பட்டது. அடுத்த முறை ஆப்ஸைத் திறக்கும்போது புதிய சொற்கள் தோன்றும்.';

  @override
  String get contentUpToDate => 'புதுப்பித்த நிலையில்';

  @override
  String get contentCheck => 'சரிபார்';

  @override
  String get contentAppTooOld => 'புதிய உள்ளடக்கம் பெற ஆப்ஸைப் புதுப்பிக்கவும்';

  @override
  String get contentStore => 'ஸ்டோர்';

  @override
  String get contentFailed =>
      'புதுப்பிக்க முடியவில்லை. உங்கள் சொற்கள் மாறவில்லை.';

  @override
  String get contentRetry => 'மீண்டும் முயல்';

  @override
  String contentTitle(int version) {
    return 'சொல் உள்ளடக்கம் · பதிப்பு $version';
  }

  @override
  String get contentAutoWifi => 'Wi-Fi-இல் தானாகப் புதுப்பி';

  @override
  String get contentAutoWifiSub => 'மொபைல் டேட்டாவில் ஒருபோதும் இல்லை';

  @override
  String summaryCombo(int count) {
    return 'காம்போ: தொடர்ந்து $count';
  }

  @override
  String get summaryNewBest => 'புதிய சாதனை!';

  @override
  String summaryBestCombo(int count) {
    return 'சிறந்த காம்போ: தொடர்ந்து $count';
  }

  @override
  String get summaryPlayAgain => 'மீண்டும் விளையாடு';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '3-இல் $count நட்சத்திரங்கள்',
      one: '3-இல் $count நட்சத்திரம்',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle =>
      'உண்மையான ஜெர்மன் கதைகளைச் சொல் சொல்லாகப் படியுங்கள்';

  @override
  String get siblingWordbit =>
      'ஒவ்வொரு முறை அன்லாக் செய்யும்போதும் ஒரு ஜெர்மன் சொல்';

  @override
  String get siblingLeben => 'குடியுரிமைத் தேர்வில் தேர்ச்சி பெறுங்கள்';

  @override
  String get siblingAudiobookName => 'ஜெர்மன் ஒலிப்புத்தகம்';

  @override
  String get siblingAudiobook => 'நிலைவாரியான கதைகளைக் கேளுங்கள்';
}
