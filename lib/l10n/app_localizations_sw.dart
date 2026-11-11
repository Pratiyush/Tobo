// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get settingsLanguage => 'Lugha ya programu';

  @override
  String get languageSearchHint => 'Tafuta lugha';

  @override
  String get languageSystemDefault => 'Lugha ya mfumo';

  @override
  String languageFollowsDevice(String language) {
    return 'Inafuata kifaa chako · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz imeshindwa kuanza.\n\n$error';
  }

  @override
  String get navWords => 'Maneno';

  @override
  String get navPractice => 'Mazoezi';

  @override
  String get navSettings => 'Mipangilio';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mfululizo: siku $count',
      one: 'Mfululizo: siku $count',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Pointi';

  @override
  String get homeToPractise => 'Ya kurudia';

  @override
  String get homeVocabulary => 'Msamiati';

  @override
  String homeLevel(int level) {
    return 'Kiwango $level';
  }

  @override
  String get homeLevelCaps => 'KIWANGO';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'maneno $count',
      one: 'neno $count',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Kiwango $level: umejifunza maneno $learned kati ya $total';
  }

  @override
  String get homeStartHere => 'Anza hapa';

  @override
  String get homeStartHereBody =>
      'Jifunza maneno yako 10 ya kwanza kwa sauti, kisha uyacheze kwenye michezo.';

  @override
  String get homeLearn10 => 'JIFUNZE MANENO 10';

  @override
  String get homeGoal => 'Lengo la leo';

  @override
  String get homeGoalReached => 'Lengo la leo limefikiwa!';

  @override
  String get homeGoalReachedBody =>
      'Tuonane kesho, au endelea kucheza ukusanye pointi.';

  @override
  String homeGoalProgress(int done, int goal) {
    return 'Maneno $done kati ya $goal yamejifunzwa au kujibiwa sawa';
  }

  @override
  String get adsOutOfHints => 'Vidokezo vimeisha';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tazama tangazo fupi upate vidokezo $count zaidi?',
      one: 'Tazama tangazo fupi upate kidokezo $count zaidi?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Si sasa';

  @override
  String get adsWatchAd => 'Tazama tangazo';

  @override
  String adsDoublePoints(int points) {
    return 'Pointi mara mbili (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Rejesha mfululizo wako wa siku $days',
      one: 'Rejesha mfululizo wako wa siku $days',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Kijerumani zaidi kutoka kwa Pratiyush';

  @override
  String get rulePluralOnly => 'Nomino ya wingi tu: wingi daima huchukua die.';

  @override
  String ruleCompound(String head) {
    return 'Neno ambatani huchukua kibainishi cha sehemu yake ya mwisho: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'Nomino nyingi zinazoishia na -$suffix huchukua $article.';
  }

  @override
  String get levelBeginner => 'Mwanzo';

  @override
  String get levelElementary => 'Msingi';

  @override
  String get levelIntermediate => 'Kati';

  @override
  String get levelUpperIntermediate => 'Juu ya kati';

  @override
  String get levelAllInSequence => 'Viwango vyote kwa mfuatano';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · inapendekezwa';

  @override
  String get levelOrChoose => 'Au chagua kiwango kimoja au zaidi';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'maneno $count',
      one: 'neno $count',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Kiwango $level';
  }

  @override
  String get levelsKeepProgress =>
      'Maendeleo yako huhifadhiwa kwa kila kiwango, kwa hivyo kubadilisha kiwango hakupotezi neno ulilojifunza.';

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
      other: 'vidokezo $count',
      one: 'kidokezo $count',
      zero: 'bila vidokezo',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Ubao wa leo, sawa kwa kila mwanafunzi';

  @override
  String practiceDailyDone(String stars) {
    return 'Umemaliza leo: $stars. Gusa ili kushiriki';
  }

  @override
  String get dddPerfect => 'Perfekt! Kila kibainishi ni sahihi.';

  @override
  String get dddTip =>
      'Rangi husaidia kukumbuka: der nyeusi, die nyekundu, das dhahabu.';

  @override
  String dddItsArticle(String article) {
    return 'Kibainishi ni $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Haraka kama umeme.';

  @override
  String get falleeKeepGoing =>
      'Endelea: kadiri unavyocheza zaidi, ndivyo utakavyosoma haraka zaidi.';

  @override
  String hiveRound(int round) {
    return 'Raundi $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Neno $n kati ya $total';
  }

  @override
  String get hiveCoach =>
      'Gusa au buruta kupitia herufi zinazogusana ili kuunda neno la Kijerumani';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zimebaki herufi $count',
      one: 'Imebaki herufi $count',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Kidokezo';

  @override
  String get hiveBoardCleared => 'Ubao umekamilika!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count pointi',
      one: '+$count pointi',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'SHIRIKI MATOKEO';

  @override
  String get commonDone => 'Nimemaliza';

  @override
  String get hiveNextRound => 'RAUNDI IJAYO';

  @override
  String get commonLearn => 'Jifunze';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Umejifunza maneno mapya $count. Yatarudi kwa mazoezi kesho.',
      one: 'Umejifunza neno jipya $count. Litarudi kwa mazoezi kesho.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'BAADAYE';

  @override
  String get learnKnowIt => 'NALIJUA';

  @override
  String get learnFlip => 'GEUZA';

  @override
  String get learnPluralOnly => 'wingi tu · daima die';

  @override
  String learnPlural(String plural) {
    return 'wingi: $plural';
  }

  @override
  String get onboardingIntro =>
      'Jifunze maneno ya Kijerumani kwa kucheza. Kiwango chako ni kipi?';

  @override
  String get onboardingStart => 'ANZA';

  @override
  String get onboardingNotSure => 'Huna uhakika? Anza na A1';

  @override
  String get onboardingChangeLater =>
      'Unaweza kubadilisha hili wakati wowote kwenye Mipangilio.';

  @override
  String get practiceTitle => 'MAZOEZI';

  @override
  String get practiceSpellDue => 'Andika maneno yaliyofika wakati wa kurudiwa';

  @override
  String get practiceLearnFirst => 'Jifunze maneno kadhaa kwanza';

  @override
  String get practiceCaughtUp => 'Umemaliza yote. Rudi kesho!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'maneno $count',
      one: 'neno $count',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'MICHEZO';

  @override
  String get practiceHiveSub =>
      'Telezesha kidole kwenye sega ili kuunda kila neno';

  @override
  String get practiceDddSub => 'Chagua kibainishi sahihi';

  @override
  String get practiceFalleeSub => 'Chagua maana kabla neno halijatua';

  @override
  String get settingsTitle => 'MIPANGILIO';

  @override
  String get settingsMadeBy => 'Imetengenezwa kwa ❤️ na Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Viwango';

  @override
  String get settingsAutoSpeak => 'Matamshi ya maneno kiotomatiki';

  @override
  String get settingsAutoSpeakSub => 'Kwenye kadi na baada ya majibu';

  @override
  String get settingsGamesAsPractice => 'Hesabu michezo kama mazoezi';

  @override
  String get settingsGamesAsPracticeSub =>
      'Majibu ya michezo hupandisha au kushusha maneno uliyojifunza';

  @override
  String get settingsSounds => 'Sauti na mtetemo';

  @override
  String get settingsSoundsSub => 'Kwenye michezo na mazoezi';

  @override
  String get settingsReset => 'Weka upya maendeleo';

  @override
  String get settingsResetTitle => 'Weka upya maendeleo?';

  @override
  String get settingsResetBody =>
      'Hii itafuta kila neno ulilojifunza, pointi zako na mfululizo wako.';

  @override
  String get commonCancel => 'Ghairi';

  @override
  String get settingsResetConfirm => 'Weka upya';

  @override
  String get settingsPrivacyChoices => 'Faragha na chaguo za matangazo';

  @override
  String get settingsPrivacyPolicy => 'Sera ya faragha';

  @override
  String get settingsContact => 'Wasiliana na usaidizi';

  @override
  String get settingsLicences => 'Leseni za programu huria';

  @override
  String settingsAbout(int count) {
    return 'Maneno $count ya Kijerumani yanayotumika sana, yenye tafsiri za Kiingereza na matamshi yaliyorekodiwa. Hakuna cha kulipia: kila neno na kila mchezo ni bure.';
  }

  @override
  String get settingsMailLastError =>
      'Hitilafu ya mwisho kwenye kifaa hiki (ifute ukipenda):';

  @override
  String get spellingTitle => 'Mazoezi';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'maneno $count',
      one: 'neno $count',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: 'pointi $points',
      one: 'pointi $points',
    );
    return 'Umefanyia mazoezi $_temp0 na kukusanya $_temp1.';
  }

  @override
  String get spellingNounHint => 'nomino — weka der, die au das';

  @override
  String get spellingAnswerIs => 'Jibu ni';

  @override
  String get commonNext => 'ENDELEA';

  @override
  String get spellingSkip => 'Ruka';

  @override
  String get spellingDelete => 'Futa';

  @override
  String get spellingCheck => 'Kagua';

  @override
  String get wordListAllLearned => 'Umejifunza kila neno katika orodha hii.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Yamebaki maneno $count katika orodha hii.',
      one: 'Limebaki neno $count katika orodha hii.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'MSAMIATI ($count)';
  }

  @override
  String get reminderBody =>
      'Daily Hive ya leo iko tayari. Dakika tano za Kijerumani?';

  @override
  String get reminderChannel => 'Kikumbusho cha kila siku';

  @override
  String get reminderChannelDesc =>
      'Kikumbusho kimoja kwa siku, kwa wakati unaouchagua.';

  @override
  String get reminderSwitch => 'Kikumbusho cha kila siku';

  @override
  String reminderOnAt(String time) {
    return 'Kikumbusho kimoja kwa siku saa $time';
  }

  @override
  String get reminderOff =>
      'Kikumbusho kimoja kwa siku, kwa wakati unaouchagua';

  @override
  String get reminderBlocked =>
      'Ruhusu arifa za Wortschatz kwenye mipangilio ya simu yako ili upate kikumbusho.';

  @override
  String get reminderTime => 'Muda wa kikumbusho';

  @override
  String commonMastery(int level, int max) {
    return 'Umahiri $level kati ya $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return 'Umejifunza $percent%';
  }

  @override
  String get commonListen => 'Sikiliza';

  @override
  String get commonNoVoice =>
      'Hakuna sauti ya Kijerumani iliyosakinishwa. Iongeze kwenye mipangilio ya maandishi kuwa sauti ya kifaa chako.';

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
    return 'Data mpya ya maneno inapatikana. Sasisha ($size)';
  }

  @override
  String get contentUpdating => 'Inasasisha maneno…';

  @override
  String get contentUpdatedBanner =>
      'Maneno yamesasishwa. Yataonekana utakapofungua programu tena; rekodi za sauti tayari zinacheza.';

  @override
  String get contentChecking => 'Inakagua…';

  @override
  String get contentDownloading => 'Inapakua na kukagua faili…';

  @override
  String contentAvailable(int version, String size) {
    return 'Toleo $version linapatikana, $size';
  }

  @override
  String get contentUpdate => 'Sasisha';

  @override
  String get contentUpdated =>
      'Imesasishwa. Maneno mapya yataonekana utakapofungua programu tena.';

  @override
  String get contentUpToDate => 'Ni toleo la karibuni';

  @override
  String get contentCheck => 'Kagua';

  @override
  String get contentAppTooOld => 'Sasisha programu ili upate maudhui mapya';

  @override
  String get contentStore => 'Duka';

  @override
  String get contentFailed =>
      'Imeshindwa kusasisha. Maneno yako hayajabadilika.';

  @override
  String get contentRetry => 'Jaribu tena';

  @override
  String contentTitle(int version) {
    return 'Maudhui ya maneno · toleo $version';
  }

  @override
  String get contentAutoWifi => 'Sasisha kiotomatiki kwenye Wi-Fi';

  @override
  String get contentAutoWifiSub => 'Kamwe si kwa data ya simu';

  @override
  String summaryCombo(int count) {
    return 'Kombo: majibu $count mfululizo';
  }

  @override
  String get summaryNewBest => 'REKODI MPYA!';

  @override
  String summaryBestCombo(int count) {
    return 'Kombo bora: majibu $count mfululizo';
  }

  @override
  String get summaryPlayAgain => 'CHEZA TENA';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'nyota $count kati ya 3',
      one: 'nyota $count kati ya 3',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle =>
      'Soma hadithi halisi za Kijerumani, neno kwa neno';

  @override
  String get siblingWordbit => 'Neno la Kijerumani kila unapofungua simu';

  @override
  String get siblingLeben => 'Faulu mtihani wa uraia';

  @override
  String get siblingAudiobookName => 'Kitabu cha sauti cha Kijerumani';

  @override
  String get siblingAudiobook => 'Sikiliza hadithi kwa viwango';
}
