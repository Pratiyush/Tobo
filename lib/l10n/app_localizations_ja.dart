// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get settingsLanguage => 'アプリの言語';

  @override
  String get languageSearchHint => '言語を検索';

  @override
  String get languageSystemDefault => 'システムのデフォルト';

  @override
  String languageFollowsDevice(String language) {
    return '端末の設定に従う · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatzを起動できませんでした。\n\n$error';
  }

  @override
  String get navWords => '単語';

  @override
  String get navPractice => '練習';

  @override
  String get navSettings => '設定';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '連続記録：$count日',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'ポイント';

  @override
  String get homeToPractise => '要復習';

  @override
  String get homeVocabulary => '覚えた単語';

  @override
  String homeLevel(int level) {
    return 'レベル$level';
  }

  @override
  String get homeLevelCaps => 'レベル';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count語',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'レベル$level：$total語中$learned語を習得';
  }

  @override
  String get homeStartHere => 'ここから始めよう';

  @override
  String get homeStartHereBody => 'まずは最初の10語を音声つきで覚えて、ゲームで遊んでみましょう。';

  @override
  String get homeLearn10 => '10語を覚える';

  @override
  String get homeGoal => '今日の目標';

  @override
  String get homeGoalReached => '今日の目標を達成！';

  @override
  String get homeGoalReachedBody => 'また明日。続けて遊んでポイントを集めるのもOKです。';

  @override
  String homeGoalProgress(int done, int goal) {
    return '学習または正解：$goal語中$done語';
  }

  @override
  String get adsOutOfHints => 'ヒントがなくなりました';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '短い広告を見て、ヒントを$count回追加しますか？',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => '今はしない';

  @override
  String get adsWatchAd => '広告を見る';

  @override
  String adsDoublePoints(int points) {
    return 'ポイント2倍（+$points）';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days日の連続記録を復活させる',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Pratiyushのほかのドイツ語アプリ';

  @override
  String get rulePluralOnly => '複数形しかない名詞：複数形はいつもdieです。';

  @override
  String ruleCompound(String head) {
    return '複合語は最後の部分の冠詞をとります：$head。';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return '-$suffixで終わる名詞の多くは$articleです。';
  }

  @override
  String get levelBeginner => '入門';

  @override
  String get levelElementary => '初級';

  @override
  String get levelIntermediate => '中級';

  @override
  String get levelUpperIntermediate => '中上級';

  @override
  String get levelAllInSequence => '全レベルを順番に';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · おすすめ';

  @override
  String get levelOrChoose => 'またはレベルを選ぶ（複数可）';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count語',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'レベル$level';
  }

  @override
  String get levelsKeepProgress => '進み具合はレベルごとに保存されるので、切り替えても覚えた単語は消えません。';

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
      other: 'ヒント$count回',
      zero: 'ヒントなし',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => '今日のボード。全員が同じ問題です';

  @override
  String practiceDailyDone(String stars) {
    return '今日はクリア：$stars。タップしてシェア';
  }

  @override
  String get dddPerfect => 'Perfekt! 冠詞は全問正解です。';

  @override
  String get dddTip => '色で覚えよう：derは黒、dieは赤、dasは金。';

  @override
  String dddItsArticle(String article) {
    return '冠詞は$articleです';
  }

  @override
  String get falleePerfect => 'Blitzschnell! 稲妻のような速さ！';

  @override
  String get falleeKeepGoing => '続けよう：遊ぶほど、読むのが速くなります。';

  @override
  String hiveRound(int round) {
    return 'ラウンド$round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return '$total語中$n語目';
  }

  @override
  String get hiveCoach => '隣り合う文字をタップするかなぞって、ドイツ語の単語をつづろう';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '残り$count文字',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'ヒント';

  @override
  String get hiveBoardCleared => 'ボードクリア！';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$countポイント',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => '結果をシェア';

  @override
  String get commonDone => '完了';

  @override
  String get hiveNextRound => '次のラウンド';

  @override
  String get commonLearn => '学習';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '新しい単語を$count語覚えました。明日また練習に出てきます。',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'あとで';

  @override
  String get learnKnowIt => '知ってる';

  @override
  String get learnFlip => 'めくる';

  @override
  String get learnPluralOnly => '複数形のみ · いつもdie';

  @override
  String learnPlural(String plural) {
    return '複数形：$plural';
  }

  @override
  String get onboardingIntro => '遊びながらドイツ語の単語を覚えよう。あなたのレベルは？';

  @override
  String get onboardingStart => 'はじめる';

  @override
  String get onboardingNotSure => 'わからない？ A1から始めよう';

  @override
  String get onboardingChangeLater => '設定からいつでも変更できます。';

  @override
  String get practiceTitle => '練習';

  @override
  String get practiceSpellDue => '復習の時期が来た単語をつづる';

  @override
  String get practiceLearnFirst => 'まずは単語を覚えましょう';

  @override
  String get practiceCaughtUp => '全部終わりました。また明日！';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count語',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'ゲーム';

  @override
  String get practiceHiveSub => 'ハチの巣をなぞって、単語をつづろう';

  @override
  String get practiceDddSub => '正しい冠詞を選ぼう';

  @override
  String get practiceFalleeSub => '単語が落ちる前に意味を選ぼう';

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsMadeBy => 'Pratiyush Kumar Singhが❤️を込めて制作';

  @override
  String get settingsLevels => 'レベル';

  @override
  String get settingsAutoSpeak => '単語を自動で読み上げ';

  @override
  String get settingsAutoSpeakSub => '単語カードの表示時と解答のあと';

  @override
  String get settingsGamesAsPractice => 'ゲームも練習にカウント';

  @override
  String get settingsGamesAsPracticeSub => 'ゲームの答えで、覚えた単語の段階が上下します';

  @override
  String get settingsSounds => 'サウンドとバイブ';

  @override
  String get settingsSoundsSub => 'ゲームと練習で';

  @override
  String get settingsReset => '進み具合をリセット';

  @override
  String get settingsResetTitle => '進み具合をリセットしますか？';

  @override
  String get settingsResetBody => '覚えた単語、ポイント、連続記録がすべて消えます。';

  @override
  String get commonCancel => 'キャンセル';

  @override
  String get settingsResetConfirm => 'リセット';

  @override
  String get settingsPrivacyChoices => 'プライバシーと広告の設定';

  @override
  String get settingsPrivacyPolicy => 'プライバシーポリシー';

  @override
  String get settingsContact => 'サポートに問い合わせ';

  @override
  String get settingsLicences => 'オープンソースライセンス';

  @override
  String settingsAbout(int count) {
    return 'よく使うドイツ語の単語を$count語、英語訳と録音された発音つきで収録。課金はありません：すべての単語とゲームが無料です。';
  }

  @override
  String get settingsMailLastError => 'この端末での直近のエラー（削除してもかまいません）：';

  @override
  String get spellingTitle => '練習';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count語',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$pointsポイント',
    );
    return '$_temp0を練習して、$_temp1を集めました。';
  }

  @override
  String get spellingNounHint => '名詞 — der・die・dasもつけて';

  @override
  String get spellingAnswerIs => '正解は';

  @override
  String get commonNext => '次へ';

  @override
  String get spellingSkip => 'スキップ';

  @override
  String get spellingDelete => '削除';

  @override
  String get spellingCheck => 'チェック';

  @override
  String get wordListAllLearned => 'このリストの単語はすべて覚えました。';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'このリストには、あと$count語残っています。',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return '単語（$count）';
  }

  @override
  String get reminderBody => '今日のDaily Hiveが用意できました。5分だけドイツ語をやってみませんか？';

  @override
  String get reminderChannel => '毎日のリマインダー';

  @override
  String get reminderChannelDesc => '選んだ時刻に、1日1回お知らせします。';

  @override
  String get reminderSwitch => '毎日のリマインダー';

  @override
  String reminderOnAt(String time) {
    return '毎日$timeに1回お知らせ';
  }

  @override
  String get reminderOff => '好きな時刻に1日1回お知らせ';

  @override
  String get reminderBlocked => 'リマインダーを受け取るには、端末の設定でWortschatzの通知を許可してください。';

  @override
  String get reminderTime => 'お知らせの時刻';

  @override
  String commonMastery(int level, int max) {
    return '習熟度 $level/$max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent%習得';
  }

  @override
  String get commonListen => '聞く';

  @override
  String get commonNoVoice => 'ドイツ語の音声が入っていません。端末のテキスト読み上げ設定で追加してください。';

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
    return '新しい単語データがあります。更新（$size）';
  }

  @override
  String get contentUpdating => '単語を更新中…';

  @override
  String get contentUpdatedBanner =>
      '単語を更新しました。次にアプリを開いたときに反映されます。録音はもう再生できます。';

  @override
  String get contentChecking => '確認中…';

  @override
  String get contentDownloading => 'ファイルをダウンロードして確認中…';

  @override
  String contentAvailable(int version, String size) {
    return 'バージョン$versionがあります（$size）';
  }

  @override
  String get contentUpdate => '更新';

  @override
  String get contentUpdated => '更新しました。新しい単語は次にアプリを開いたときに表示されます。';

  @override
  String get contentUpToDate => '最新です';

  @override
  String get contentCheck => '確認';

  @override
  String get contentAppTooOld => '新しいコンテンツを受け取るにはアプリを更新してください';

  @override
  String get contentStore => 'ストア';

  @override
  String get contentFailed => '更新できませんでした。単語はそのままです。';

  @override
  String get contentRetry => '再試行';

  @override
  String contentTitle(int version) {
    return '単語データ · バージョン$version';
  }

  @override
  String get contentAutoWifi => 'Wi-Fi接続時に自動で更新';

  @override
  String get contentAutoWifiSub => 'モバイルデータでは更新しません';

  @override
  String summaryCombo(int count) {
    return 'コンボ：$count連続';
  }

  @override
  String get summaryNewBest => '新記録！';

  @override
  String summaryBestCombo(int count) {
    return '最高コンボ：$count連続';
  }

  @override
  String get summaryPlayAgain => 'もう一度遊ぶ';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '星3つ中$countつ',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => '本物のドイツ語の物語を、1語ずつ読もう';

  @override
  String get siblingWordbit => 'ロック解除のたびに、ドイツ語の単語をひとつ';

  @override
  String get siblingLeben => '帰化テストに合格しよう';

  @override
  String get siblingAudiobookName => 'ドイツ語オーディオブック';

  @override
  String get siblingAudiobook => 'レベル別の物語を聞こう';
}
