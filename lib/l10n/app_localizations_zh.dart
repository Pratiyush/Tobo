// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get settingsLanguage => '应用语言';

  @override
  String get languageSearchHint => '搜索语言';

  @override
  String get languageSystemDefault => '跟随系统';

  @override
  String languageFollowsDevice(String language) {
    return '跟随设备 · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz 无法启动。\n\n$error';
  }

  @override
  String get navWords => '单词';

  @override
  String get navPractice => '练习';

  @override
  String get navSettings => '设置';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '连续学习 $count 天',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => '积分';

  @override
  String get homeToPractise => '待练习';

  @override
  String get homeVocabulary => '词汇量';

  @override
  String homeLevel(int level) {
    return '等级 $level';
  }

  @override
  String get homeLevelCaps => '等级';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个单词',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return '等级 $level：$total 个单词中已学会 $learned 个';
  }

  @override
  String get homeStartHere => '从这里开始';

  @override
  String get homeStartHereBody => '先听着发音学会前 10 个单词，再到游戏里玩一玩。';

  @override
  String get homeLearn10 => '学 10 个单词';

  @override
  String get homeGoal => '今日目标';

  @override
  String get homeGoalReached => '今日目标已完成！';

  @override
  String get homeGoalReachedBody => '明天见，也可以继续玩，多攒些积分。';

  @override
  String homeGoalProgress(int done, int goal) {
    return '已学会或答对 $done/$goal 个单词';
  }

  @override
  String get adsOutOfHints => '提示用完了';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '看一段短广告，再得 $count 次提示？',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => '以后再说';

  @override
  String get adsWatchAd => '看广告';

  @override
  String adsDoublePoints(int points) {
    return '积分翻倍（+$points）';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '恢复 $days 天的连续学习',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Pratiyush 的更多德语应用';

  @override
  String get rulePluralOnly => '只有复数形式的名词：复数总是用 die。';

  @override
  String ruleCompound(String head) {
    return '复合词的冠词跟随最后一部分：$head。';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return '以 -$suffix 结尾的名词大多用 $article。';
  }

  @override
  String get levelBeginner => '入门';

  @override
  String get levelElementary => '初级';

  @override
  String get levelIntermediate => '中级';

  @override
  String get levelUpperIntermediate => '中高级';

  @override
  String get levelAllInSequence => '按顺序学习所有等级';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · 推荐';

  @override
  String get levelOrChoose => '或选择一个或多个等级';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个单词',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return '等级 $level';
  }

  @override
  String get levelsKeepProgress => '每个等级的进度都会保留，切换等级也不会丢失已学会的单词。';

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
      other: '用了 $count 次提示',
      zero: '未用提示',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => '今日题板，所有学习者都一样';

  @override
  String practiceDailyDone(String stars) {
    return '今日已完成：$stars。点按即可分享';
  }

  @override
  String get dddPerfect => 'Perfekt! 冠词全部正确。';

  @override
  String get dddTip => '用颜色帮你记：der 黑色，die 红色，das 金色。';

  @override
  String dddItsArticle(String article) {
    return '冠词是 $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! 快如闪电。';

  @override
  String get falleeKeepGoing => '继续加油：玩得越多，读得越快。';

  @override
  String hiveRound(int round) {
    return '第 $round 轮';
  }

  @override
  String hiveWordOf(int n, int total) {
    return '第 $n 个，共 $total 个';
  }

  @override
  String get hiveCoach => '点按或滑过相邻的字母，拼出德语单词';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '还剩 $count 个字母',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => '提示';

  @override
  String get hiveBoardCleared => '题板已清空！';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count 积分',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => '分享结果';

  @override
  String get commonDone => '完成';

  @override
  String get hiveNextRound => '下一轮';

  @override
  String get commonLearn => '学习';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '你学会了 $count 个新单词，明天会再出现，供你练习。',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => '稍后';

  @override
  String get learnKnowIt => '认识';

  @override
  String get learnFlip => '翻面';

  @override
  String get learnPluralOnly => '仅有复数 · 总是 die';

  @override
  String learnPlural(String plural) {
    return '复数 $plural';
  }

  @override
  String get onboardingIntro => '边玩边学德语单词。你现在是什么等级？';

  @override
  String get onboardingStart => '开始';

  @override
  String get onboardingNotSure => '不确定？从 A1 开始';

  @override
  String get onboardingChangeLater => '你随时可以在设置中更改。';

  @override
  String get practiceTitle => '练习';

  @override
  String get practiceSpellDue => '拼写该复习的单词';

  @override
  String get practiceLearnFirst => '先学几个单词吧';

  @override
  String get practiceCaughtUp => '都复习完了，明天再来吧！';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个单词',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => '游戏';

  @override
  String get practiceHiveSub => '在蜂巢上滑动，拼出每个单词';

  @override
  String get practiceDddSub => '选出正确的冠词';

  @override
  String get practiceFalleeSub => '在单词落地前选出词义';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsMadeBy => '由 Pratiyush Kumar Singh 用 ❤️ 制作';

  @override
  String get settingsLevels => '等级';

  @override
  String get settingsAutoSpeak => '自动朗读单词';

  @override
  String get settingsAutoSpeakSub => '在单词卡上和答题后';

  @override
  String get settingsGamesAsPractice => '游戏计入练习';

  @override
  String get settingsGamesAsPracticeSub => '游戏中的答题会让已学单词升级或降级';

  @override
  String get settingsSounds => '声音和振动';

  @override
  String get settingsSoundsSub => '在游戏和练习中';

  @override
  String get settingsReset => '重置进度';

  @override
  String get settingsResetTitle => '要重置进度吗？';

  @override
  String get settingsResetBody => '这会清除所有已学单词、你的积分和连续学习记录。';

  @override
  String get commonCancel => '取消';

  @override
  String get settingsResetConfirm => '重置';

  @override
  String get settingsPrivacyChoices => '隐私和广告选项';

  @override
  String get settingsPrivacyPolicy => '隐私政策';

  @override
  String get settingsContact => '联系客服';

  @override
  String get settingsLicences => '开源许可';

  @override
  String settingsAbout(int count) {
    return '收录 $count 个常用德语单词，附英文释义和发音录音。没有付费内容：所有单词和游戏都免费。';
  }

  @override
  String get settingsMailLastError => '此设备上最近一次的错误（可自行删除）：';

  @override
  String get spellingTitle => '练习';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个单词',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points 积分',
    );
    return '你练习了 $_temp0，获得了 $_temp1。';
  }

  @override
  String get spellingNounHint => '名词 — 要带上 der、die 或 das';

  @override
  String get spellingAnswerIs => '正确答案是';

  @override
  String get commonNext => '下一个';

  @override
  String get spellingSkip => '跳过';

  @override
  String get spellingDelete => '删除';

  @override
  String get spellingCheck => '检查';

  @override
  String get wordListAllLearned => '这个列表里的单词你都学会了。';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '这个列表还剩 $count 个单词。',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return '词汇（$count）';
  }

  @override
  String get reminderBody => '今天的 Daily Hive 已经准备好了。花五分钟学学德语吧？';

  @override
  String get reminderChannel => '每日提醒';

  @override
  String get reminderChannelDesc => '每天一次，在你选择的时间提醒。';

  @override
  String get reminderSwitch => '每日提醒';

  @override
  String reminderOnAt(String time) {
    return '每天 $time 提醒一次';
  }

  @override
  String get reminderOff => '每天提醒一次，时间由你选';

  @override
  String get reminderBlocked => '请在手机设置中允许 Wortschatz 发送通知，这样才能收到提醒。';

  @override
  String get reminderTime => '提醒时间';

  @override
  String commonMastery(int level, int max) {
    return '熟练度 $level/$max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '已学会 $percent%';
  }

  @override
  String get commonListen => '听发音';

  @override
  String get commonNoVoice => '未安装德语语音。请在设备的文字转语音设置中添加。';

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
    return '有新的单词数据。更新（$size）';
  }

  @override
  String get contentUpdating => '正在更新单词…';

  @override
  String get contentUpdatedBanner => '单词已更新，下次打开应用时显示；录音现在就能播放。';

  @override
  String get contentChecking => '正在检查…';

  @override
  String get contentDownloading => '正在下载并校验文件…';

  @override
  String contentAvailable(int version, String size) {
    return '可更新到版本 $version，$size';
  }

  @override
  String get contentUpdate => '更新';

  @override
  String get contentUpdated => '已更新。新单词将在下次打开应用时显示。';

  @override
  String get contentUpToDate => '已是最新';

  @override
  String get contentCheck => '检查';

  @override
  String get contentAppTooOld => '请更新应用以获取新内容';

  @override
  String get contentStore => '应用商店';

  @override
  String get contentFailed => '更新失败。你的单词没有变化。';

  @override
  String get contentRetry => '重试';

  @override
  String contentTitle(int version) {
    return '单词内容 · 版本 $version';
  }

  @override
  String get contentAutoWifi => '连接 Wi-Fi 时自动更新';

  @override
  String get contentAutoWifiSub => '绝不使用移动数据';

  @override
  String summaryCombo(int count) {
    return '连击：连续答对 $count 个';
  }

  @override
  String get summaryNewBest => '新纪录！';

  @override
  String summaryBestCombo(int count) {
    return '最佳连击：连续答对 $count 个';
  }

  @override
  String get summaryPlayAgain => '再玩一次';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '3 星中得了 $count 星',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => '逐词阅读真实的德语故事';

  @override
  String get siblingWordbit => '每次解锁都学一个德语单词';

  @override
  String get siblingLeben => '通过入籍考试';

  @override
  String get siblingAudiobookName => '德语有声书';

  @override
  String get siblingAudiobook => '收听分级故事';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get settingsLanguage => '應用程式語言';

  @override
  String get languageSearchHint => '搜尋語言';

  @override
  String get languageSystemDefault => '系統預設';

  @override
  String languageFollowsDevice(String language) {
    return '跟隨裝置 · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz 無法啟動。\n\n$error';
  }

  @override
  String get navWords => '單字';

  @override
  String get navPractice => '練習';

  @override
  String get navSettings => '設定';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '連續學習 $count 天',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => '點數';

  @override
  String get homeToPractise => '待練習';

  @override
  String get homeVocabulary => '字彙量';

  @override
  String homeLevel(int level) {
    return '等級 $level';
  }

  @override
  String get homeLevelCaps => '等級';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個單字',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return '等級 $level：$total 個單字中已學會 $learned 個';
  }

  @override
  String get homeStartHere => '從這裡開始';

  @override
  String get homeStartHereBody => '先聽著發音學會前 10 個單字，再到遊戲裡玩玩看。';

  @override
  String get homeLearn10 => '學 10 個單字';

  @override
  String get homeGoal => '今日目標';

  @override
  String get homeGoalReached => '今日目標達成！';

  @override
  String get homeGoalReachedBody => '明天見，也可以繼續玩，多累積一些點數。';

  @override
  String homeGoalProgress(int done, int goal) {
    return '已學會或答對 $done/$goal 個單字';
  }

  @override
  String get adsOutOfHints => '提示用完了';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '看一段短廣告，再拿 $count 次提示？',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => '下次再說';

  @override
  String get adsWatchAd => '看廣告';

  @override
  String adsDoublePoints(int points) {
    return '點數加倍（+$points）';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '恢復 $days 天的連續學習',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => '更多 Pratiyush 的德文 App';

  @override
  String get rulePluralOnly => '只有複數形的名詞：複數一律用 die。';

  @override
  String ruleCompound(String head) {
    return '複合字的冠詞看最後一個部分：$head。';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return '以 -$suffix 結尾的名詞大多用 $article。';
  }

  @override
  String get levelBeginner => '入門';

  @override
  String get levelElementary => '初級';

  @override
  String get levelIntermediate => '中級';

  @override
  String get levelUpperIntermediate => '中高級';

  @override
  String get levelAllInSequence => '依序學習所有等級';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · 推薦';

  @override
  String get levelOrChoose => '或選擇一個或多個等級';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個單字',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return '等級 $level';
  }

  @override
  String get levelsKeepProgress => '每個等級的進度都會保留，切換等級也不會遺失學會的單字。';

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
      other: '用了 $count 次提示',
      zero: '沒用提示',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => '今日題板，每位學習者都一樣';

  @override
  String practiceDailyDone(String stars) {
    return '今天已完成：$stars。輕觸即可分享';
  }

  @override
  String get dddPerfect => 'Perfekt! 冠詞全部答對。';

  @override
  String get dddTip => '用顏色幫你記：der 黑色、die 紅色、das 金色。';

  @override
  String dddItsArticle(String article) {
    return '冠詞是 $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! 快如閃電。';

  @override
  String get falleeKeepGoing => '繼續加油：玩得越多，讀得越快。';

  @override
  String hiveRound(int round) {
    return '第 $round 回合';
  }

  @override
  String hiveWordOf(int n, int total) {
    return '第 $n 個，共 $total 個';
  }

  @override
  String get hiveCoach => '輕觸或滑過相鄰的字母，拼出德文單字';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '還剩 $count 個字母',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => '提示';

  @override
  String get hiveBoardCleared => '題板清空了！';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count 點',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => '分享結果';

  @override
  String get commonDone => '完成';

  @override
  String get hiveNextRound => '下一回合';

  @override
  String get commonLearn => '學習';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '你學會了 $count 個新單字，明天會再出現讓你練習。',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => '稍後';

  @override
  String get learnKnowIt => '我會了';

  @override
  String get learnFlip => '翻面';

  @override
  String get learnPluralOnly => '只有複數 · 一律 die';

  @override
  String learnPlural(String plural) {
    return '複數 $plural';
  }

  @override
  String get onboardingIntro => '邊玩邊學德文單字。你目前是哪個等級？';

  @override
  String get onboardingStart => '開始';

  @override
  String get onboardingNotSure => '不確定？從 A1 開始';

  @override
  String get onboardingChangeLater => '隨時都能在設定中更改。';

  @override
  String get practiceTitle => '練習';

  @override
  String get practiceSpellDue => '拼寫該複習的單字';

  @override
  String get practiceLearnFirst => '先學幾個單字吧';

  @override
  String get practiceCaughtUp => '都複習完了，明天再來！';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個單字',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => '遊戲';

  @override
  String get practiceHiveSub => '在蜂巢上滑動，拼出每個單字';

  @override
  String get practiceDddSub => '選出正確的冠詞';

  @override
  String get practiceFalleeSub => '在單字落地前選出字義';

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsMadeBy => '由 Pratiyush Kumar Singh 用 ❤️ 打造';

  @override
  String get settingsLevels => '等級';

  @override
  String get settingsAutoSpeak => '自動播放單字發音';

  @override
  String get settingsAutoSpeakSub => '在單字卡上和作答後';

  @override
  String get settingsGamesAsPractice => '遊戲也算練習';

  @override
  String get settingsGamesAsPracticeSub => '遊戲中的作答會讓學會的單字升級或降級';

  @override
  String get settingsSounds => '音效與震動';

  @override
  String get settingsSoundsSub => '在遊戲和練習中';

  @override
  String get settingsReset => '重設進度';

  @override
  String get settingsResetTitle => '要重設進度嗎？';

  @override
  String get settingsResetBody => '這會清除所有學會的單字、你的點數和連續學習紀錄。';

  @override
  String get commonCancel => '取消';

  @override
  String get settingsResetConfirm => '重設';

  @override
  String get settingsPrivacyChoices => '隱私權與廣告選項';

  @override
  String get settingsPrivacyPolicy => '隱私權政策';

  @override
  String get settingsContact => '聯絡客服';

  @override
  String get settingsLicences => '開放原始碼授權';

  @override
  String settingsAbout(int count) {
    return '收錄 $count 個常用德文單字，附英文翻譯和發音錄音。沒有付費內容：所有單字和遊戲都免費。';
  }

  @override
  String get settingsMailLastError => '這部裝置最近一次的錯誤（不想附上可以刪除）：';

  @override
  String get spellingTitle => '練習';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個單字',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points 點',
    );
    return '你練習了 $_temp0，拿到 $_temp1。';
  }

  @override
  String get spellingNounHint => '名詞 — 要加上 der、die 或 das';

  @override
  String get spellingAnswerIs => '正確答案是';

  @override
  String get commonNext => '下一個';

  @override
  String get spellingSkip => '略過';

  @override
  String get spellingDelete => '刪除';

  @override
  String get spellingCheck => '檢查';

  @override
  String get wordListAllLearned => '這個清單的單字你全都學會了。';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '這個清單還剩 $count 個單字。',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return '字彙（$count）';
  }

  @override
  String get reminderBody => '今天的 Daily Hive 準備好了。來學五分鐘德文吧？';

  @override
  String get reminderChannel => '每日提醒';

  @override
  String get reminderChannelDesc => '每天一次，在你選的時間提醒。';

  @override
  String get reminderSwitch => '每日提醒';

  @override
  String reminderOnAt(String time) {
    return '每天 $time 提醒一次';
  }

  @override
  String get reminderOff => '每天提醒一次，時間由你選';

  @override
  String get reminderBlocked => '請在手機設定中允許 Wortschatz 傳送通知，才能收到提醒。';

  @override
  String get reminderTime => '提醒時間';

  @override
  String commonMastery(int level, int max) {
    return '熟練度 $level/$max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '已學會 $percent%';
  }

  @override
  String get commonListen => '聽發音';

  @override
  String get commonNoVoice => '沒有安裝德文語音。請到裝置的文字轉語音設定中新增。';

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
    return '有新的單字資料。更新（$size）';
  }

  @override
  String get contentUpdating => '正在更新單字…';

  @override
  String get contentUpdatedBanner => '單字已更新，下次開啟 App 時就會出現；錄音現在就能播放。';

  @override
  String get contentChecking => '檢查中…';

  @override
  String get contentDownloading => '正在下載並檢查檔案…';

  @override
  String contentAvailable(int version, String size) {
    return '可更新至版本 $version，$size';
  }

  @override
  String get contentUpdate => '更新';

  @override
  String get contentUpdated => '已更新。新單字會在下次開啟 App 時出現。';

  @override
  String get contentUpToDate => '已是最新版本';

  @override
  String get contentCheck => '檢查';

  @override
  String get contentAppTooOld => '請更新 App 以取得新內容';

  @override
  String get contentStore => '商店';

  @override
  String get contentFailed => '無法更新。你的單字沒有任何變動。';

  @override
  String get contentRetry => '重試';

  @override
  String contentTitle(int version) {
    return '單字內容 · 版本 $version';
  }

  @override
  String get contentAutoWifi => '連上 Wi-Fi 時自動更新';

  @override
  String get contentAutoWifiSub => '絕不使用行動數據';

  @override
  String summaryCombo(int count) {
    return '連擊：連續答對 $count 題';
  }

  @override
  String get summaryNewBest => '新紀錄！';

  @override
  String summaryBestCombo(int count) {
    return '最佳連擊：連續答對 $count 題';
  }

  @override
  String get summaryPlayAgain => '再玩一次';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '3 顆星中得到 $count 顆',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => '一個字一個字讀真實的德文故事';

  @override
  String get siblingWordbit => '每次解鎖都學一個德文單字';

  @override
  String get siblingLeben => '通過入籍考試';

  @override
  String get siblingAudiobookName => '德文有聲書';

  @override
  String get siblingAudiobook => '聆聽分級故事';
}
