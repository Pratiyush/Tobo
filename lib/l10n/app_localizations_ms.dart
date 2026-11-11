// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get settingsLanguage => 'Bahasa aplikasi';

  @override
  String get languageSearchHint => 'Cari bahasa';

  @override
  String get languageSystemDefault => 'Lalai sistem';

  @override
  String languageFollowsDevice(String language) {
    return 'Ikut peranti anda · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz tidak dapat dimulakan.\n\n$error';
  }

  @override
  String get navWords => 'Perkataan';

  @override
  String get navPractice => 'Latihan';

  @override
  String get navSettings => 'Tetapan';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Rentetan: $count hari',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Mata';

  @override
  String get homeToPractise => 'Ulang kaji';

  @override
  String get homeVocabulary => 'Kosa kata';

  @override
  String homeLevel(int level) {
    return 'Tahap $level';
  }

  @override
  String get homeLevelCaps => 'TAHAP';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perkataan',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Tahap $level: $learned daripada $total perkataan dipelajari';
  }

  @override
  String get homeStartHere => 'Mula di sini';

  @override
  String get homeStartHereBody =>
      'Pelajari 10 perkataan pertama anda dengan audio, kemudian mainkannya dalam permainan.';

  @override
  String get homeLearn10 => 'BELAJAR 10 PERKATAAN';

  @override
  String get homeGoal => 'Sasaran hari ini';

  @override
  String get homeGoalReached => 'Sasaran hari ini tercapai!';

  @override
  String get homeGoalReachedBody =>
      'Jumpa lagi esok, atau teruskan bermain untuk mengumpul mata.';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$done daripada $goal perkataan dipelajari atau dijawab betul';
  }

  @override
  String get adsOutOfHints => 'Petunjuk sudah habis';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tonton iklan pendek untuk $count petunjuk lagi?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Lain kali';

  @override
  String get adsWatchAd => 'Tonton iklan';

  @override
  String adsDoublePoints(int points) {
    return 'Gandakan mata (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Pulihkan rentetan $days hari anda',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Lagi aplikasi bahasa Jerman oleh Pratiyush';

  @override
  String get rulePluralOnly =>
      'Kata nama jamak sahaja: bentuk jamak sentiasa guna die.';

  @override
  String ruleCompound(String head) {
    return 'Kata majmuk mengambil artikel bahagian terakhirnya: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'Kebanyakan kata nama yang berakhir dengan -$suffix guna $article.';
  }

  @override
  String get levelBeginner => 'Permulaan';

  @override
  String get levelElementary => 'Asas';

  @override
  String get levelIntermediate => 'Pertengahan';

  @override
  String get levelUpperIntermediate => 'Pertengahan atas';

  @override
  String get levelAllInSequence => 'Semua tahap mengikut urutan';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · disyorkan';

  @override
  String get levelOrChoose => 'Atau pilih satu tahap atau lebih';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perkataan',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Tahap $level';
  }

  @override
  String get levelsKeepProgress =>
      'Kemajuan anda disimpan untuk setiap tahap, jadi menukar tahap tidak akan menghilangkan perkataan yang telah dipelajari.';

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
      other: '$count petunjuk',
      zero: 'tiada petunjuk',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Papan hari ini, sama untuk semua pelajar';

  @override
  String practiceDailyDone(String stars) {
    return 'Selesai hari ini: $stars. Ketik untuk kongsi';
  }

  @override
  String get dddPerfect => 'Perfekt! Semua artikel betul.';

  @override
  String get dddTip =>
      'Warna membantu ingatan: der hitam, die merah, das emas.';

  @override
  String dddItsArticle(String article) {
    return 'Artikelnya ialah $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Sepantas kilat.';

  @override
  String get falleeKeepGoing =>
      'Teruskan: lebih banyak anda bermain, lebih pantas anda membaca.';

  @override
  String hiveRound(int round) {
    return 'Pusingan $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Perkataan $n daripada $total';
  }

  @override
  String get hiveCoach =>
      'Ketik atau seret huruf yang bersebelahan untuk mengeja perkataan Jerman';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tinggal $count huruf',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Petunjuk';

  @override
  String get hiveBoardCleared => 'Papan selesai!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count mata',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'KONGSI KEPUTUSAN';

  @override
  String get commonDone => 'Selesai';

  @override
  String get hiveNextRound => 'PUSINGAN BERIKUT';

  @override
  String get commonLearn => 'Belajar';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Anda telah mempelajari $count perkataan baharu. Perkataan itu akan muncul semula untuk latihan esok.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'NANTI';

  @override
  String get learnKnowIt => 'SAYA TAHU';

  @override
  String get learnFlip => 'BALIKKAN';

  @override
  String get learnPluralOnly => 'jamak sahaja · sentiasa die';

  @override
  String learnPlural(String plural) {
    return 'jamak: $plural';
  }

  @override
  String get onboardingIntro =>
      'Belajar perkataan bahasa Jerman sambil bermain. Apakah tahap anda?';

  @override
  String get onboardingStart => 'MULA';

  @override
  String get onboardingNotSure => 'Tidak pasti? Mula di A1';

  @override
  String get onboardingChangeLater =>
      'Anda boleh menukarnya bila-bila masa dalam Tetapan.';

  @override
  String get practiceTitle => 'LATIHAN';

  @override
  String get practiceSpellDue => 'Eja perkataan yang perlu diulang kaji';

  @override
  String get practiceLearnFirst => 'Pelajari beberapa perkataan dahulu';

  @override
  String get practiceCaughtUp => 'Semua sudah selesai. Datang lagi esok!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perkataan',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'PERMAINAN';

  @override
  String get practiceHiveSub =>
      'Leret merentasi sarang lebah untuk mengeja setiap perkataan';

  @override
  String get practiceDddSub => 'Pilih artikel yang betul';

  @override
  String get practiceFalleeSub =>
      'Pilih maksudnya sebelum perkataan itu mendarat';

  @override
  String get settingsTitle => 'TETAPAN';

  @override
  String get settingsMadeBy => 'Dibuat dengan ❤️ oleh Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Tahap';

  @override
  String get settingsAutoSpeak => 'Sebutan perkataan automatik';

  @override
  String get settingsAutoSpeakSub => 'Pada kad imbas dan selepas menjawab';

  @override
  String get settingsGamesAsPractice => 'Kira permainan sebagai latihan';

  @override
  String get settingsGamesAsPracticeSub =>
      'Jawapan dalam permainan menaikkan atau menurunkan perkataan yang dipelajari';

  @override
  String get settingsSounds => 'Bunyi & getaran';

  @override
  String get settingsSoundsSub => 'Dalam permainan dan latihan';

  @override
  String get settingsReset => 'Set semula kemajuan';

  @override
  String get settingsResetTitle => 'Set semula kemajuan?';

  @override
  String get settingsResetBody =>
      'Ini akan memadam semua perkataan yang dipelajari, mata dan rentetan anda.';

  @override
  String get commonCancel => 'Batal';

  @override
  String get settingsResetConfirm => 'Set semula';

  @override
  String get settingsPrivacyChoices => 'Privasi & pilihan iklan';

  @override
  String get settingsPrivacyPolicy => 'Dasar privasi';

  @override
  String get settingsContact => 'Hubungi sokongan';

  @override
  String get settingsLicences => 'Lesen sumber terbuka';

  @override
  String settingsAbout(int count) {
    return '$count perkataan Jerman yang lazim, dengan terjemahan bahasa Inggeris dan sebutan yang dirakam. Tiada kandungan berbayar: setiap perkataan dan permainan adalah percuma.';
  }

  @override
  String get settingsMailLastError =>
      'Ralat terakhir pada peranti ini (padam jika mahu):';

  @override
  String get spellingTitle => 'Latihan';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perkataan',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points mata',
    );
    return 'Anda telah berlatih $_temp0 dan mengumpul $_temp1.';
  }

  @override
  String get spellingNounHint => 'kata nama — sertakan der, die atau das';

  @override
  String get spellingAnswerIs => 'Jawapannya ialah';

  @override
  String get commonNext => 'SETERUSNYA';

  @override
  String get spellingSkip => 'Langkau';

  @override
  String get spellingDelete => 'Padam';

  @override
  String get spellingCheck => 'Semak';

  @override
  String get wordListAllLearned =>
      'Anda telah mempelajari setiap perkataan dalam senarai ini.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tinggal $count perkataan lagi dalam senarai ini.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'KOSA KATA ($count)';
  }

  @override
  String get reminderBody =>
      'Daily Hive hari ini sudah sedia. Lima minit bahasa Jerman?';

  @override
  String get reminderChannel => 'Peringatan harian';

  @override
  String get reminderChannelDesc =>
      'Satu peringatan sehari, pada masa pilihan anda.';

  @override
  String get reminderSwitch => 'Peringatan harian';

  @override
  String reminderOnAt(String time) {
    return 'Satu peringatan sehari pada $time';
  }

  @override
  String get reminderOff => 'Satu peringatan sehari, pada masa pilihan anda';

  @override
  String get reminderBlocked =>
      'Benarkan pemberitahuan untuk Wortschatz dalam tetapan telefon anda untuk menerima peringatan.';

  @override
  String get reminderTime => 'Masa peringatan';

  @override
  String commonMastery(int level, int max) {
    return 'Penguasaan $level daripada $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent% dipelajari';
  }

  @override
  String get commonListen => 'Dengar';

  @override
  String get commonNoVoice =>
      'Tiada suara bahasa Jerman dipasang. Tambahkan dalam tetapan teks ke pertuturan peranti anda.';

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
    return 'Data perkataan baharu tersedia. Kemas kini ($size)';
  }

  @override
  String get contentUpdating => 'Mengemas kini perkataan…';

  @override
  String get contentUpdatedBanner =>
      'Perkataan dikemas kini. Ia muncul apabila anda membuka aplikasi lagi; rakaman sudah boleh dimainkan.';

  @override
  String get contentChecking => 'Menyemak…';

  @override
  String get contentDownloading => 'Memuat turun dan menyemak fail…';

  @override
  String contentAvailable(int version, String size) {
    return 'Versi $version tersedia, $size';
  }

  @override
  String get contentUpdate => 'Kemas kini';

  @override
  String get contentUpdated =>
      'Dikemas kini. Perkataan baharu muncul apabila anda membuka aplikasi lagi.';

  @override
  String get contentUpToDate => 'Terkini';

  @override
  String get contentCheck => 'Semak';

  @override
  String get contentAppTooOld =>
      'Kemas kini aplikasi untuk mendapatkan kandungan baharu';

  @override
  String get contentStore => 'Gedung';

  @override
  String get contentFailed =>
      'Tidak dapat dikemas kini. Perkataan anda tidak berubah.';

  @override
  String get contentRetry => 'Cuba lagi';

  @override
  String contentTitle(int version) {
    return 'Kandungan perkataan · versi $version';
  }

  @override
  String get contentAutoWifi => 'Kemas kini secara automatik melalui Wi-Fi';

  @override
  String get contentAutoWifiSub => 'Tidak sekali-kali guna data mudah alih';

  @override
  String summaryCombo(int count) {
    return 'Kombo: $count berturut-turut';
  }

  @override
  String get summaryNewBest => 'REKOD BARU!';

  @override
  String summaryBestCombo(int count) {
    return 'Kombo terbaik: $count berturut-turut';
  }

  @override
  String get summaryPlayAgain => 'MAIN LAGI';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count daripada 3 bintang',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle =>
      'Baca cerita Jerman sebenar, perkataan demi perkataan';

  @override
  String get siblingWordbit =>
      'Satu perkataan Jerman setiap kali anda membuka kunci';

  @override
  String get siblingLeben => 'Lulus ujian kewarganegaraan';

  @override
  String get siblingAudiobookName => 'Buku audio bahasa Jerman';

  @override
  String get siblingAudiobook => 'Dengar cerita mengikut tahap';
}
