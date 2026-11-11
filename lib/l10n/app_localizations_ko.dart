// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get settingsLanguage => '앱 언어';

  @override
  String get languageSearchHint => '언어 검색';

  @override
  String get languageSystemDefault => '시스템 기본값';

  @override
  String languageFollowsDevice(String language) {
    return '기기 설정을 따라요 · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz를 시작하지 못했어요.\n\n$error';
  }

  @override
  String get navWords => '단어';

  @override
  String get navPractice => '연습';

  @override
  String get navSettings => '설정';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '연속 학습: $count일',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => '포인트';

  @override
  String get homeToPractise => '연습할 단어';

  @override
  String get homeVocabulary => '익힌 단어';

  @override
  String homeLevel(int level) {
    return '레벨 $level';
  }

  @override
  String get homeLevelCaps => '레벨';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '단어 $count개',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return '레벨 $level: 단어 $total개 중 $learned개 익힘';
  }

  @override
  String get homeStartHere => '여기서 시작하세요';

  @override
  String get homeStartHereBody => '첫 단어 10개를 소리와 함께 익히고, 게임에서 써 보세요.';

  @override
  String get homeLearn10 => '단어 10개 배우기';

  @override
  String get homeGoal => '오늘의 목표';

  @override
  String get homeGoalReached => '오늘의 목표 달성!';

  @override
  String get homeGoalReachedBody => '내일 또 만나요. 계속 플레이해서 포인트를 모아도 좋아요.';

  @override
  String homeGoalProgress(int done, int goal) {
    return '단어 $goal개 중 $done개를 익히거나 맞혔어요';
  }

  @override
  String get adsOutOfHints => '힌트를 다 썼어요';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '짧은 광고를 보고 힌트 $count개를 더 받을까요?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => '나중에';

  @override
  String get adsWatchAd => '광고 보기';

  @override
  String adsDoublePoints(int points) {
    return '포인트 2배 (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일 연속 학습 되살리기',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Pratiyush의 독일어 앱 더 보기';

  @override
  String get rulePluralOnly => '복수형만 있는 명사: 복수형은 항상 die를 써요.';

  @override
  String ruleCompound(String head) {
    return '복합어는 마지막 부분의 관사를 따라요: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return '어미가 -$suffix인 명사는 대부분 $article 명사예요.';
  }

  @override
  String get levelBeginner => '입문';

  @override
  String get levelElementary => '초급';

  @override
  String get levelIntermediate => '중급';

  @override
  String get levelUpperIntermediate => '중상급';

  @override
  String get levelAllInSequence => '모든 레벨을 순서대로';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · 추천';

  @override
  String get levelOrChoose => '또는 레벨을 하나 이상 고르세요';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '단어 $count개',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return '레벨 $level';
  }

  @override
  String get levelsKeepProgress => '진도는 레벨마다 저장되니까, 레벨을 바꿔도 익힌 단어는 사라지지 않아요.';

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
      other: '힌트 $count개',
      zero: '힌트 없음',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => '오늘의 보드, 모든 학습자에게 똑같아요';

  @override
  String practiceDailyDone(String stars) {
    return '오늘 완료: $stars. 탭해서 공유하세요';
  }

  @override
  String get dddPerfect => 'Perfekt! 관사를 모두 맞혔어요.';

  @override
  String get dddTip => '색으로 기억해요: der 검정, die 빨강, das 금색.';

  @override
  String dddItsArticle(String article) {
    return '정답: $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! 번개처럼 빨라요.';

  @override
  String get falleeKeepGoing => '계속해 보세요. 많이 할수록 더 빨리 읽게 돼요.';

  @override
  String hiveRound(int round) {
    return '라운드 $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return '단어 $total개 중 $n번째';
  }

  @override
  String get hiveCoach => '붙어 있는 글자를 탭하거나 드래그해서 독일어 단어를 완성하세요';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count글자 남음',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => '힌트';

  @override
  String get hiveBoardCleared => '보드 클리어!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count포인트',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => '결과 공유';

  @override
  String get commonDone => '완료';

  @override
  String get hiveNextRound => '다음 라운드';

  @override
  String get commonLearn => '학습';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '새 단어 $count개를 익혔어요. 내일 연습할 때 다시 나와요.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => '나중에';

  @override
  String get learnKnowIt => '알아요';

  @override
  String get learnFlip => '뒤집기';

  @override
  String get learnPluralOnly => '복수형만 · 항상 die';

  @override
  String learnPlural(String plural) {
    return '복수 $plural';
  }

  @override
  String get onboardingIntro => '게임하며 독일어 단어를 배워요. 지금 레벨이 어느 정도예요?';

  @override
  String get onboardingStart => '시작';

  @override
  String get onboardingNotSure => '잘 모르겠다면 A1부터';

  @override
  String get onboardingChangeLater => '설정에서 언제든 바꿀 수 있어요.';

  @override
  String get practiceTitle => '연습';

  @override
  String get practiceSpellDue => '복습할 때가 된 단어 철자 쓰기';

  @override
  String get practiceLearnFirst => '먼저 단어를 몇 개 배워 보세요';

  @override
  String get practiceCaughtUp => '다 끝냈어요. 내일 또 오세요!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => '게임';

  @override
  String get practiceHiveSub => '벌집을 스와이프해서 단어 철자를 맞춰요';

  @override
  String get practiceDddSub => '알맞은 관사를 고르세요';

  @override
  String get practiceFalleeSub => '단어가 떨어지기 전에 뜻을 고르세요';

  @override
  String get settingsTitle => '설정';

  @override
  String get settingsMadeBy => '❤️ 담아 만든 사람: Pratiyush Kumar Singh';

  @override
  String get settingsLevels => '레벨';

  @override
  String get settingsAutoSpeak => '단어 자동 발음';

  @override
  String get settingsAutoSpeakSub => '단어 카드에서, 그리고 답한 뒤에';

  @override
  String get settingsGamesAsPractice => '게임도 연습으로 인정';

  @override
  String get settingsGamesAsPracticeSub => '게임에서 답한 결과에 따라 익힌 단어의 단계가 오르내려요';

  @override
  String get settingsSounds => '소리 및 진동';

  @override
  String get settingsSoundsSub => '게임과 연습에서';

  @override
  String get settingsReset => '진도 초기화';

  @override
  String get settingsResetTitle => '진도를 초기화할까요?';

  @override
  String get settingsResetBody => '익힌 단어, 포인트, 연속 학습 기록이 모두 지워져요.';

  @override
  String get commonCancel => '취소';

  @override
  String get settingsResetConfirm => '초기화';

  @override
  String get settingsPrivacyChoices => '개인정보 및 광고 선택';

  @override
  String get settingsPrivacyPolicy => '개인정보처리방침';

  @override
  String get settingsContact => '고객 지원 문의';

  @override
  String get settingsLicences => '오픈소스 라이선스';

  @override
  String settingsAbout(int count) {
    return '자주 쓰는 독일어 단어 $count개를 영어 번역, 녹음된 발음과 함께 담았어요. 결제할 것 없이 모든 단어와 게임이 무료예요.';
  }

  @override
  String get settingsMailLastError => '이 기기의 마지막 오류 (원하면 지워도 돼요):';

  @override
  String get spellingTitle => '연습';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '단어 $count개',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points포인트',
    );
    return '$_temp0를 연습하고 $_temp1를 모았어요.';
  }

  @override
  String get spellingNounHint => '명사 — der, die, das 중 하나를 붙이세요';

  @override
  String get spellingAnswerIs => '정답은';

  @override
  String get commonNext => '다음';

  @override
  String get spellingSkip => '건너뛰기';

  @override
  String get spellingDelete => '지우기';

  @override
  String get spellingCheck => '확인';

  @override
  String get wordListAllLearned => '이 목록의 단어를 모두 익혔어요.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '이 목록에 단어가 $count개 남았어요.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return '단어 ($count)';
  }

  @override
  String get reminderBody => '오늘의 Daily Hive가 준비됐어요. 독일어 5분 어때요?';

  @override
  String get reminderChannel => '매일 알림';

  @override
  String get reminderChannelDesc => '하루에 한 번, 원하는 시간에 알려 드려요.';

  @override
  String get reminderSwitch => '매일 알림';

  @override
  String reminderOnAt(String time) {
    return '매일 $time에 한 번 알림';
  }

  @override
  String get reminderOff => '하루 한 번, 원하는 시간에 알림';

  @override
  String get reminderBlocked => '알림을 받으려면 휴대폰 설정에서 Wortschatz 알림을 허용하세요.';

  @override
  String get reminderTime => '알림 시간';

  @override
  String commonMastery(int level, int max) {
    return '숙련도 $level/$max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent% 익힘';
  }

  @override
  String get commonListen => '듣기';

  @override
  String get commonNoVoice => '독일어 음성이 설치되어 있지 않아요. 기기의 텍스트 음성 변환 설정에서 추가하세요.';

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
    return '새 단어 데이터가 있어요. 업데이트 ($size)';
  }

  @override
  String get contentUpdating => '단어 업데이트 중…';

  @override
  String get contentUpdatedBanner =>
      '단어를 업데이트했어요. 다음에 앱을 열면 보이고, 녹음은 지금 바로 재생돼요.';

  @override
  String get contentChecking => '확인 중…';

  @override
  String get contentDownloading => '파일을 다운로드하고 확인하는 중…';

  @override
  String contentAvailable(int version, String size) {
    return '버전 $version 사용 가능, $size';
  }

  @override
  String get contentUpdate => '업데이트';

  @override
  String get contentUpdated => '업데이트했어요. 새 단어는 다음에 앱을 열 때 보여요.';

  @override
  String get contentUpToDate => '최신 상태예요';

  @override
  String get contentCheck => '확인';

  @override
  String get contentAppTooOld => '새 콘텐츠를 받으려면 앱을 업데이트하세요';

  @override
  String get contentStore => '스토어';

  @override
  String get contentFailed => '업데이트하지 못했어요. 단어는 그대로예요.';

  @override
  String get contentRetry => '다시 시도';

  @override
  String contentTitle(int version) {
    return '단어 콘텐츠 · 버전 $version';
  }

  @override
  String get contentAutoWifi => 'Wi-Fi에서 자동 업데이트';

  @override
  String get contentAutoWifiSub => '모바일 데이터로는 업데이트하지 않아요';

  @override
  String summaryCombo(int count) {
    return '콤보: $count연속';
  }

  @override
  String get summaryNewBest => '신기록!';

  @override
  String summaryBestCombo(int count) {
    return '최고 콤보: $count연속';
  }

  @override
  String get summaryPlayAgain => '다시 하기';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '별 3개 중 $count개',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => '진짜 독일어 이야기를 한 단어씩 읽어요';

  @override
  String get siblingWordbit => '잠금을 풀 때마다 독일어 단어 하나';

  @override
  String get siblingLeben => '시민권 시험에 합격하세요';

  @override
  String get siblingAudiobookName => '독일어 오디오북';

  @override
  String get siblingAudiobook => '레벨별 이야기를 들어요';
}
