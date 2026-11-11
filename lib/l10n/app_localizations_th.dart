// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get settingsLanguage => 'ภาษาของแอป';

  @override
  String get languageSearchHint => 'ค้นหาภาษา';

  @override
  String get languageSystemDefault => 'ภาษาของระบบ';

  @override
  String languageFollowsDevice(String language) {
    return 'ตามอุปกรณ์ · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'เปิด Wortschatz ไม่ได้\n\n$error';
  }

  @override
  String get navWords => 'คำศัพท์';

  @override
  String get navPractice => 'ฝึกฝน';

  @override
  String get navSettings => 'ตั้งค่า';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'สตรีค: $count วัน',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'คะแนน';

  @override
  String get homeToPractise => 'รอทบทวน';

  @override
  String get homeVocabulary => 'คลังคำศัพท์';

  @override
  String homeLevel(int level) {
    return 'ระดับ $level';
  }

  @override
  String get homeLevelCaps => 'ระดับ';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count คำ',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'ระดับ $level: เรียนแล้ว $learned จาก $total คำ';
  }

  @override
  String get homeStartHere => 'เริ่มตรงนี้';

  @override
  String get homeStartHereBody =>
      'เรียน 10 คำแรกพร้อมเสียง แล้วไปเล่นกับคำเหล่านั้นในเกม';

  @override
  String get homeLearn10 => 'เรียน 10 คำ';

  @override
  String get homeGoal => 'เป้าหมายวันนี้';

  @override
  String get homeGoalReached => 'ถึงเป้าหมายวันนี้แล้ว!';

  @override
  String get homeGoalReachedBody => 'เจอกันพรุ่งนี้ หรือเล่นต่อเพื่อเก็บคะแนน';

  @override
  String homeGoalProgress(int done, int goal) {
    return 'เรียนหรือตอบถูกแล้ว $done จาก $goal คำ';
  }

  @override
  String get adsOutOfHints => 'คำใบ้หมดแล้ว';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ดูโฆษณาสั้นๆ เพื่อรับคำใบ้เพิ่มอีก $count ครั้งไหม',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'ไว้ทีหลัง';

  @override
  String get adsWatchAd => 'ดูโฆษณา';

  @override
  String adsDoublePoints(int points) {
    return 'คะแนนสองเท่า (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'กู้สตรีค $days วันคืนมา',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'ภาษาเยอรมันเพิ่มเติมจาก Pratiyush';

  @override
  String get rulePluralOnly => 'คำนามที่มีแต่รูปพหูพจน์: พหูพจน์ใช้ die เสมอ';

  @override
  String ruleCompound(String head) {
    return 'คำประสมใช้คำนำหน้านามตามส่วนสุดท้าย: $head';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'คำนามส่วนใหญ่ที่ลงท้ายด้วย -$suffix ใช้ $article';
  }

  @override
  String get levelBeginner => 'ระดับเริ่มต้น';

  @override
  String get levelElementary => 'ระดับพื้นฐาน';

  @override
  String get levelIntermediate => 'ระดับกลาง';

  @override
  String get levelUpperIntermediate => 'ระดับกลางค่อนสูง';

  @override
  String get levelAllInSequence => 'ทุกระดับตามลำดับ';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · แนะนำ';

  @override
  String get levelOrChoose => 'หรือเลือกหนึ่งระดับขึ้นไป';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count คำ',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'ระดับ $level';
  }

  @override
  String get levelsKeepProgress =>
      'ความคืบหน้าของทุกระดับจะถูกเก็บไว้ เปลี่ยนระดับเมื่อไหร่ก็ไม่เสียคำที่เรียนแล้ว';

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
      other: 'คำใบ้ $count ครั้ง',
      zero: 'ไม่ใช้คำใบ้',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'กระดานของวันนี้ เหมือนกันสำหรับทุกคน';

  @override
  String practiceDailyDone(String stars) {
    return 'วันนี้เล่นแล้ว: $stars แตะเพื่อแชร์';
  }

  @override
  String get dddPerfect => 'Perfekt! คำนำหน้านามถูกทุกข้อ';

  @override
  String get dddTip => 'ใช้สีช่วยจำ: der สีดำ, die สีแดง, das สีทอง';

  @override
  String dddItsArticle(String article) {
    return 'ที่ถูกคือ $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! เร็วปานสายฟ้า';

  @override
  String get falleeKeepGoing => 'เล่นต่อไป ยิ่งเล่นมาก ยิ่งอ่านได้เร็ว';

  @override
  String hiveRound(int round) {
    return 'รอบที่ $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'คำที่ $n จาก $total';
  }

  @override
  String get hiveCoach =>
      'แตะหรือลากผ่านตัวอักษรที่ติดกันเพื่อสะกดคำภาษาเยอรมัน';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'เหลืออีก $count ตัวอักษร',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'คำใบ้';

  @override
  String get hiveBoardCleared => 'เคลียร์กระดานแล้ว!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count คะแนน',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'แชร์ผลลัพธ์';

  @override
  String get commonDone => 'เสร็จ';

  @override
  String get hiveNextRound => 'รอบถัดไป';

  @override
  String get commonLearn => 'เรียน';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'เรียนคำใหม่แล้ว $count คำ พรุ่งนี้จะกลับมาให้ทบทวน',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'ไว้ก่อน';

  @override
  String get learnKnowIt => 'รู้แล้ว';

  @override
  String get learnFlip => 'พลิก';

  @override
  String get learnPluralOnly => 'พหูพจน์เท่านั้น · ใช้ die เสมอ';

  @override
  String learnPlural(String plural) {
    return 'พหูพจน์ $plural';
  }

  @override
  String get onboardingIntro =>
      'เรียนคำศัพท์ภาษาเยอรมันผ่านการเล่น ระดับของคุณอยู่ตรงไหน';

  @override
  String get onboardingStart => 'เริ่มเลย';

  @override
  String get onboardingNotSure => 'ไม่แน่ใจ? เริ่มที่ A1';

  @override
  String get onboardingChangeLater => 'เปลี่ยนได้ทุกเมื่อในการตั้งค่า';

  @override
  String get practiceTitle => 'ฝึกฝน';

  @override
  String get practiceSpellDue => 'สะกดคำที่ถึงเวลาทบทวน';

  @override
  String get practiceLearnFirst => 'เรียนคำศัพท์สักหน่อยก่อน';

  @override
  String get practiceCaughtUp => 'ทบทวนครบแล้ว พรุ่งนี้มาใหม่นะ!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count คำ',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'เกม';

  @override
  String get practiceHiveSub => 'ลากผ่านรังผึ้งเพื่อสะกดแต่ละคำ';

  @override
  String get practiceDddSub => 'เลือกคำนำหน้านามที่ถูก';

  @override
  String get practiceFalleeSub => 'เลือกความหมายก่อนคำจะตกถึงพื้น';

  @override
  String get settingsTitle => 'ตั้งค่า';

  @override
  String get settingsMadeBy => 'สร้างด้วย ❤️ โดย Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'ระดับ';

  @override
  String get settingsAutoSpeak => 'ออกเสียงคำอัตโนมัติ';

  @override
  String get settingsAutoSpeakSub => 'บนบัตรคำและหลังตอบ';

  @override
  String get settingsGamesAsPractice => 'นับเกมเป็นการฝึกฝน';

  @override
  String get settingsGamesAsPracticeSub =>
      'คำตอบในเกมจะเลื่อนคำที่เรียนแล้วขึ้นหรือลง';

  @override
  String get settingsSounds => 'เสียงและการสั่น';

  @override
  String get settingsSoundsSub => 'ในเกมและการฝึกฝน';

  @override
  String get settingsReset => 'รีเซ็ตความคืบหน้า';

  @override
  String get settingsResetTitle => 'รีเซ็ตความคืบหน้าไหม';

  @override
  String get settingsResetBody =>
      'คำที่เรียนแล้วทั้งหมด คะแนน และสตรีคของคุณจะถูกลบ';

  @override
  String get commonCancel => 'ยกเลิก';

  @override
  String get settingsResetConfirm => 'รีเซ็ต';

  @override
  String get settingsPrivacyChoices => 'ความเป็นส่วนตัวและโฆษณา';

  @override
  String get settingsPrivacyPolicy => 'นโยบายความเป็นส่วนตัว';

  @override
  String get settingsContact => 'ติดต่อฝ่ายช่วยเหลือ';

  @override
  String get settingsLicences => 'ใบอนุญาตโอเพนซอร์ส';

  @override
  String settingsAbout(int count) {
    return 'คำภาษาเยอรมันที่ใช้บ่อย $count คำ พร้อมคำแปลภาษาอังกฤษและเสียงอ่านที่บันทึกไว้ ไม่มีส่วนที่ต้องจ่ายเงิน ทุกคำและทุกเกมใช้ได้ฟรี';
  }

  @override
  String get settingsMailLastError =>
      'ข้อผิดพลาดล่าสุดบนอุปกรณ์นี้ (ลบออกได้ถ้าต้องการ):';

  @override
  String get spellingTitle => 'ฝึกฝน';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count คำ',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points คะแนน',
    );
    return 'ฝึกไปแล้ว $_temp0 และเก็บได้ $_temp1';
  }

  @override
  String get spellingNounHint => 'คำนาม — ใส่ der, die หรือ das ด้วย';

  @override
  String get spellingAnswerIs => 'คำตอบคือ';

  @override
  String get commonNext => 'ถัดไป';

  @override
  String get spellingSkip => 'ข้าม';

  @override
  String get spellingDelete => 'ลบ';

  @override
  String get spellingCheck => 'ตรวจ';

  @override
  String get wordListAllLearned => 'เรียนครบทุกคำในรายการนี้แล้ว';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'รายการนี้เหลืออีก $count คำ',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'คลังคำศัพท์ ($count)';
  }

  @override
  String get reminderBody =>
      'Daily Hive ของวันนี้พร้อมแล้ว มาเรียนภาษาเยอรมันสักห้านาทีไหม';

  @override
  String get reminderChannel => 'การแจ้งเตือนรายวัน';

  @override
  String get reminderChannelDesc => 'แจ้งเตือนวันละครั้ง ตามเวลาที่คุณเลือก';

  @override
  String get reminderSwitch => 'แจ้งเตือนรายวัน';

  @override
  String reminderOnAt(String time) {
    return 'แจ้งเตือนวันละครั้ง เวลา $time';
  }

  @override
  String get reminderOff => 'แจ้งเตือนวันละครั้ง ในเวลาที่คุณเลือก';

  @override
  String get reminderBlocked =>
      'อนุญาตการแจ้งเตือนของ Wortschatz ในการตั้งค่าโทรศัพท์เพื่อรับการแจ้งเตือน';

  @override
  String get reminderTime => 'เวลาแจ้งเตือน';

  @override
  String commonMastery(int level, int max) {
    return 'ความชำนาญ $level จาก $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return 'เรียนแล้ว $percent%';
  }

  @override
  String get commonListen => 'ฟัง';

  @override
  String get commonNoVoice =>
      'ไม่มีเสียงภาษาเยอรมันในเครื่อง เพิ่มได้ในการตั้งค่าการอ่านออกเสียงข้อความของอุปกรณ์';

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
    return 'มีข้อมูลคำศัพท์ใหม่ อัปเดต ($size)';
  }

  @override
  String get contentUpdating => 'กำลังอัปเดตคำศัพท์…';

  @override
  String get contentUpdatedBanner =>
      'อัปเดตคำศัพท์แล้ว คำใหม่จะแสดงเมื่อเปิดแอปครั้งถัดไป ส่วนเสียงบันทึกเล่นได้แล้ว';

  @override
  String get contentChecking => 'กำลังตรวจสอบ…';

  @override
  String get contentDownloading => 'กำลังดาวน์โหลดและตรวจสอบไฟล์…';

  @override
  String contentAvailable(int version, String size) {
    return 'มีเวอร์ชัน $version ขนาด $size';
  }

  @override
  String get contentUpdate => 'อัปเดต';

  @override
  String get contentUpdated => 'อัปเดตแล้ว คำใหม่จะแสดงเมื่อเปิดแอปครั้งถัดไป';

  @override
  String get contentUpToDate => 'เป็นเวอร์ชันล่าสุด';

  @override
  String get contentCheck => 'ตรวจสอบ';

  @override
  String get contentAppTooOld => 'อัปเดตแอปเพื่อรับเนื้อหาใหม่';

  @override
  String get contentStore => 'สโตร์';

  @override
  String get contentFailed => 'อัปเดตไม่สำเร็จ คำศัพท์ของคุณยังเหมือนเดิม';

  @override
  String get contentRetry => 'ลองอีกครั้ง';

  @override
  String contentTitle(int version) {
    return 'ข้อมูลคำศัพท์ · เวอร์ชัน $version';
  }

  @override
  String get contentAutoWifi => 'อัปเดตอัตโนมัติผ่าน Wi-Fi';

  @override
  String get contentAutoWifiSub => 'ไม่ใช้เน็ตมือถือเลย';

  @override
  String summaryCombo(int count) {
    return 'คอมโบ: ติดกัน $count ครั้ง';
  }

  @override
  String get summaryNewBest => 'สถิติใหม่!';

  @override
  String summaryBestCombo(int count) {
    return 'คอมโบสูงสุด: ติดกัน $count ครั้ง';
  }

  @override
  String get summaryPlayAgain => 'เล่นอีกครั้ง';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count จาก 3 ดาว',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'อ่านเรื่องเล่าภาษาเยอรมันจริงๆ ทีละคำ';

  @override
  String get siblingWordbit => 'คำภาษาเยอรมันทุกครั้งที่ปลดล็อกเครื่อง';

  @override
  String get siblingLeben => 'สอบผ่านการทดสอบขอสัญชาติ';

  @override
  String get siblingAudiobookName => 'หนังสือเสียงภาษาเยอรมัน';

  @override
  String get siblingAudiobook => 'ฟังเรื่องเล่าตามระดับ';
}
