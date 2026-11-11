// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get settingsLanguage => 'Ngôn ngữ ứng dụng';

  @override
  String get languageSearchHint => 'Tìm ngôn ngữ';

  @override
  String get languageSystemDefault => 'Mặc định hệ thống';

  @override
  String languageFollowsDevice(String language) {
    return 'Theo thiết bị · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Không thể khởi động Wortschatz.\n\n$error';
  }

  @override
  String get navWords => 'Từ vựng';

  @override
  String get navPractice => 'Luyện tập';

  @override
  String get navSettings => 'Cài đặt';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Chuỗi $count ngày liên tiếp',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Điểm';

  @override
  String get homeToPractise => 'Cần ôn tập';

  @override
  String get homeVocabulary => 'Vốn từ';

  @override
  String homeLevel(int level) {
    return 'Cấp độ $level';
  }

  @override
  String get homeLevelCaps => 'CẤP ĐỘ';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count từ',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Cấp độ $level: đã học $learned trên $total từ';
  }

  @override
  String get homeStartHere => 'Bắt đầu tại đây';

  @override
  String get homeStartHereBody =>
      'Học 10 từ đầu tiên kèm âm thanh, rồi chơi các trò chơi với những từ đó.';

  @override
  String get homeLearn10 => 'HỌC 10 TỪ';

  @override
  String get homeGoal => 'Mục tiêu hôm nay';

  @override
  String get homeGoalReached => 'Đã đạt mục tiêu hôm nay!';

  @override
  String get homeGoalReachedBody =>
      'Hẹn gặp lại ngày mai, hoặc chơi tiếp để ghi điểm.';

  @override
  String homeGoalProgress(int done, int goal) {
    return 'Đã học hoặc trả lời đúng $done trên $goal từ';
  }

  @override
  String get adsOutOfHints => 'Hết gợi ý rồi';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Xem một quảng cáo ngắn để có thêm $count gợi ý?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Để sau';

  @override
  String get adsWatchAd => 'Xem quảng cáo';

  @override
  String adsDoublePoints(int points) {
    return 'Nhân đôi điểm (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Khôi phục chuỗi $days ngày của bạn',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Thêm ứng dụng tiếng Đức từ Pratiyush';

  @override
  String get rulePluralOnly =>
      'Danh từ chỉ có số nhiều: số nhiều luôn dùng die.';

  @override
  String ruleCompound(String head) {
    return 'Từ ghép dùng mạo từ của phần cuối: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'Hầu hết danh từ tận cùng bằng -$suffix dùng $article.';
  }

  @override
  String get levelBeginner => 'Mới bắt đầu';

  @override
  String get levelElementary => 'Sơ cấp';

  @override
  String get levelIntermediate => 'Trung cấp';

  @override
  String get levelUpperIntermediate => 'Trung cao cấp';

  @override
  String get levelAllInSequence => 'Mọi cấp độ theo thứ tự';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · đề xuất';

  @override
  String get levelOrChoose => 'Hoặc chọn một hay nhiều cấp độ';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count từ',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Cấp độ $level';
  }

  @override
  String get levelsKeepProgress =>
      'Tiến độ được lưu cho từng cấp độ, nên đổi cấp độ không bao giờ làm mất từ đã học.';

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
      other: '$count gợi ý',
      zero: 'không dùng gợi ý',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Bảng hôm nay, giống nhau cho mọi người học';

  @override
  String practiceDailyDone(String stars) {
    return 'Đã xong hôm nay: $stars. Chạm để chia sẻ';
  }

  @override
  String get dddPerfect => 'Perfekt! Đúng hết mọi mạo từ.';

  @override
  String get dddTip => 'Màu sắc giúp ghi nhớ: der đen, die đỏ, das vàng kim.';

  @override
  String dddItsArticle(String article) {
    return 'Mạo từ là $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Nhanh như chớp.';

  @override
  String get falleeKeepGoing =>
      'Cứ chơi tiếp: càng chơi nhiều, bạn đọc càng nhanh.';

  @override
  String hiveRound(int round) {
    return 'Vòng $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Từ $n trên $total';
  }

  @override
  String get hiveCoach =>
      'Chạm hoặc kéo qua các chữ cái liền kề để đánh vần từ tiếng Đức';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Còn $count chữ cái',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Gợi ý';

  @override
  String get hiveBoardCleared => 'Hoàn thành bảng!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count điểm',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'CHIA SẺ KẾT QUẢ';

  @override
  String get commonDone => 'Xong';

  @override
  String get hiveNextRound => 'VÒNG TIẾP THEO';

  @override
  String get commonLearn => 'Học';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Bạn vừa học $count từ mới. Ngày mai chúng sẽ quay lại để bạn luyện tập.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'ĐỂ SAU';

  @override
  String get learnKnowIt => 'ĐÃ BIẾT';

  @override
  String get learnFlip => 'LẬT THẺ';

  @override
  String get learnPluralOnly => 'chỉ có số nhiều · luôn là die';

  @override
  String learnPlural(String plural) {
    return 'số nhiều: $plural';
  }

  @override
  String get onboardingIntro =>
      'Học từ tiếng Đức qua trò chơi. Bạn đang ở cấp độ nào?';

  @override
  String get onboardingStart => 'BẮT ĐẦU';

  @override
  String get onboardingNotSure => 'Chưa chắc? Bắt đầu từ A1';

  @override
  String get onboardingChangeLater =>
      'Bạn có thể đổi lại bất cứ lúc nào trong Cài đặt.';

  @override
  String get practiceTitle => 'LUYỆN TẬP';

  @override
  String get practiceSpellDue => 'Đánh vần các từ đến hạn ôn';

  @override
  String get practiceLearnFirst => 'Hãy học vài từ trước đã';

  @override
  String get practiceCaughtUp => 'Đã ôn hết rồi. Mai quay lại nhé!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count từ',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'TRÒ CHƠI';

  @override
  String get practiceHiveSub => 'Vuốt qua tổ ong để đánh vần từng từ';

  @override
  String get practiceDddSub => 'Chọn đúng mạo từ';

  @override
  String get practiceFalleeSub => 'Chọn nghĩa trước khi từ rơi xuống đất';

  @override
  String get settingsTitle => 'CÀI ĐẶT';

  @override
  String get settingsMadeBy => 'Được tạo bằng ❤️ bởi Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Cấp độ';

  @override
  String get settingsAutoSpeak => 'Tự động phát âm từ';

  @override
  String get settingsAutoSpeakSub => 'Trên thẻ từ và sau khi trả lời';

  @override
  String get settingsGamesAsPractice => 'Tính trò chơi là luyện tập';

  @override
  String get settingsGamesAsPracticeSub =>
      'Câu trả lời trong trò chơi đẩy từ đã học lên hoặc xuống';

  @override
  String get settingsSounds => 'Âm thanh & rung';

  @override
  String get settingsSoundsSub => 'Trong trò chơi và luyện tập';

  @override
  String get settingsReset => 'Đặt lại tiến độ';

  @override
  String get settingsResetTitle => 'Đặt lại tiến độ?';

  @override
  String get settingsResetBody =>
      'Mọi từ đã học, điểm và chuỗi ngày của bạn sẽ bị xóa.';

  @override
  String get commonCancel => 'Hủy';

  @override
  String get settingsResetConfirm => 'Đặt lại';

  @override
  String get settingsPrivacyChoices => 'Quyền riêng tư & quảng cáo';

  @override
  String get settingsPrivacyPolicy => 'Chính sách quyền riêng tư';

  @override
  String get settingsContact => 'Liên hệ hỗ trợ';

  @override
  String get settingsLicences => 'Giấy phép mã nguồn mở';

  @override
  String settingsAbout(int count) {
    return '$count từ tiếng Đức thông dụng, kèm bản dịch tiếng Anh và phát âm được thu sẵn. Không có nội dung trả phí: mọi từ và mọi trò chơi đều miễn phí.';
  }

  @override
  String get settingsMailLastError =>
      'Lỗi gần nhất trên thiết bị này (xóa đi nếu bạn muốn):';

  @override
  String get spellingTitle => 'Luyện tập';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count từ',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points điểm',
    );
    return 'Bạn đã luyện $_temp0 và ghi được $_temp1.';
  }

  @override
  String get spellingNounHint => 'danh từ — kèm der, die hoặc das';

  @override
  String get spellingAnswerIs => 'Đáp án là';

  @override
  String get commonNext => 'TIẾP THEO';

  @override
  String get spellingSkip => 'Bỏ qua';

  @override
  String get spellingDelete => 'Xóa';

  @override
  String get spellingCheck => 'Kiểm tra';

  @override
  String get wordListAllLearned => 'Bạn đã học hết các từ trong danh sách này.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Danh sách này còn $count từ.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'TỪ VỰNG ($count)';
  }

  @override
  String get reminderBody =>
      'Daily Hive hôm nay đã sẵn sàng. Dành năm phút cho tiếng Đức nhé?';

  @override
  String get reminderChannel => 'Nhắc nhở hằng ngày';

  @override
  String get reminderChannelDesc => 'Mỗi ngày nhắc một lần, vào giờ bạn chọn.';

  @override
  String get reminderSwitch => 'Nhắc nhở hằng ngày';

  @override
  String reminderOnAt(String time) {
    return 'Mỗi ngày nhắc một lần lúc $time';
  }

  @override
  String get reminderOff => 'Mỗi ngày nhắc một lần, vào giờ bạn chọn';

  @override
  String get reminderBlocked =>
      'Hãy cho phép Wortschatz gửi thông báo trong cài đặt điện thoại để nhận lời nhắc.';

  @override
  String get reminderTime => 'Giờ nhắc';

  @override
  String commonMastery(int level, int max) {
    return 'Mức thành thạo $level trên $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return 'Đã học $percent%';
  }

  @override
  String get commonListen => 'Nghe';

  @override
  String get commonNoVoice =>
      'Chưa cài giọng đọc tiếng Đức. Hãy thêm giọng trong cài đặt chuyển văn bản thành giọng nói của thiết bị.';

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
    return 'Có dữ liệu từ vựng mới. Cập nhật ($size)';
  }

  @override
  String get contentUpdating => 'Đang cập nhật từ vựng…';

  @override
  String get contentUpdatedBanner =>
      'Đã cập nhật từ vựng. Từ mới sẽ hiện ở lần mở ứng dụng tới; bản ghi âm đã phát được ngay.';

  @override
  String get contentChecking => 'Đang kiểm tra…';

  @override
  String get contentDownloading => 'Đang tải xuống và kiểm tra tệp…';

  @override
  String contentAvailable(int version, String size) {
    return 'Có phiên bản $version, $size';
  }

  @override
  String get contentUpdate => 'Cập nhật';

  @override
  String get contentUpdated =>
      'Đã cập nhật. Từ mới sẽ hiện ở lần mở ứng dụng tới.';

  @override
  String get contentUpToDate => 'Đã là bản mới nhất';

  @override
  String get contentCheck => 'Kiểm tra';

  @override
  String get contentAppTooOld => 'Cập nhật ứng dụng để nhận nội dung mới';

  @override
  String get contentStore => 'Cửa hàng';

  @override
  String get contentFailed =>
      'Không cập nhật được. Từ vựng của bạn vẫn giữ nguyên.';

  @override
  String get contentRetry => 'Thử lại';

  @override
  String contentTitle(int version) {
    return 'Dữ liệu từ vựng · phiên bản $version';
  }

  @override
  String get contentAutoWifi => 'Tự động cập nhật qua Wi-Fi';

  @override
  String get contentAutoWifiSub => 'Không bao giờ dùng dữ liệu di động';

  @override
  String summaryCombo(int count) {
    return 'Combo: đúng $count câu liên tiếp';
  }

  @override
  String get summaryNewBest => 'KỶ LỤC MỚI!';

  @override
  String summaryBestCombo(int count) {
    return 'Combo cao nhất: $count câu liên tiếp';
  }

  @override
  String get summaryPlayAgain => 'CHƠI LẠI';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trên 3 sao',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'Đọc truyện tiếng Đức thật, từng từ một';

  @override
  String get siblingWordbit => 'Một từ tiếng Đức mỗi lần mở khóa';

  @override
  String get siblingLeben => 'Vượt qua kỳ thi nhập quốc tịch';

  @override
  String get siblingAudiobookName => 'Sách nói tiếng Đức';

  @override
  String get siblingAudiobook => 'Nghe truyện theo cấp độ';
}
