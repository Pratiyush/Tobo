// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get settingsLanguage => 'Bahasa aplikasi';

  @override
  String get languageSearchHint => 'Cari bahasa';

  @override
  String get languageSystemDefault => 'Bawaan sistem';

  @override
  String languageFollowsDevice(String language) {
    return 'Mengikuti perangkat · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz tidak bisa dimulai.\n\n$error';
  }

  @override
  String get navWords => 'Kata';

  @override
  String get navPractice => 'Latihan';

  @override
  String get navSettings => 'Pengaturan';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Runtunan: $count hari',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Poin';

  @override
  String get homeToPractise => 'Siap dilatih';

  @override
  String get homeVocabulary => 'Kosakata';

  @override
  String homeLevel(int level) {
    return 'Level $level';
  }

  @override
  String get homeLevelCaps => 'LEVEL';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kata',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Level $level: $learned dari $total kata sudah dipelajari';
  }

  @override
  String get homeStartHere => 'Mulai di sini';

  @override
  String get homeStartHereBody =>
      'Pelajari 10 kata pertamamu dengan suara, lalu mainkan dalam permainan.';

  @override
  String get homeLearn10 => 'PELAJARI 10 KATA';

  @override
  String get homeGoal => 'Target hari ini';

  @override
  String get homeGoalReached => 'Target hari ini tercapai!';

  @override
  String get homeGoalReachedBody =>
      'Sampai jumpa besok, atau terus main untuk kumpulkan poin.';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$done dari $goal kata dipelajari atau dijawab benar';
  }

  @override
  String get adsOutOfHints => 'Petunjuk habis';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tonton iklan singkat untuk $count petunjuk lagi?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Nanti saja';

  @override
  String get adsWatchAd => 'Tonton iklan';

  @override
  String adsDoublePoints(int points) {
    return 'Gandakan poin (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Pulihkan runtunan $days harimu',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Aplikasi bahasa Jerman lain dari Pratiyush';

  @override
  String get rulePluralOnly =>
      'Kata benda khusus jamak: bentuk jamak selalu memakai die.';

  @override
  String ruleCompound(String head) {
    return 'Kata majemuk memakai artikel bagian terakhirnya: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'Sebagian besar kata benda berakhiran -$suffix memakai $article.';
  }

  @override
  String get levelBeginner => 'Pemula';

  @override
  String get levelElementary => 'Dasar';

  @override
  String get levelIntermediate => 'Menengah';

  @override
  String get levelUpperIntermediate => 'Menengah atas';

  @override
  String get levelAllInSequence => 'Semua level berurutan';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · disarankan';

  @override
  String get levelOrChoose => 'Atau pilih satu level atau lebih';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kata',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Level $level';
  }

  @override
  String get levelsKeepProgress =>
      'Kemajuanmu disimpan untuk setiap level, jadi ganti level tidak akan menghilangkan kata yang sudah dipelajari.';

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
      zero: 'tanpa petunjuk',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Papan hari ini, sama untuk semua pelajar';

  @override
  String practiceDailyDone(String stars) {
    return 'Selesai hari ini: $stars. Ketuk untuk berbagi';
  }

  @override
  String get dddPerfect => 'Perfekt! Semua artikel benar.';

  @override
  String get dddTip => 'Warna jadi pengingat: der hitam, die merah, das emas.';

  @override
  String dddItsArticle(String article) {
    return 'Artikelnya $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Secepat kilat.';

  @override
  String get falleeKeepGoing =>
      'Terus main: makin sering bermain, makin cepat kamu membaca.';

  @override
  String hiveRound(int round) {
    return 'Ronde $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Kata $n dari $total';
  }

  @override
  String get hiveCoach =>
      'Ketuk atau seret melewati huruf yang bersebelahan untuk mengeja kata Jerman';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sisa $count huruf',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Petunjuk';

  @override
  String get hiveBoardCleared => 'Papan bersih!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count poin',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'BAGIKAN HASIL';

  @override
  String get commonDone => 'Selesai';

  @override
  String get hiveNextRound => 'RONDE BERIKUTNYA';

  @override
  String get commonLearn => 'Belajar';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Kamu mempelajari $count kata baru. Besok kata-kata itu muncul lagi untuk latihan.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'NANTI';

  @override
  String get learnKnowIt => 'SUDAH TAHU';

  @override
  String get learnFlip => 'BALIKKAN';

  @override
  String get learnPluralOnly => 'hanya jamak · selalu die';

  @override
  String learnPlural(String plural) {
    return 'jamak: $plural';
  }

  @override
  String get onboardingIntro =>
      'Belajar kata-kata bahasa Jerman sambil bermain. Di level mana kamu?';

  @override
  String get onboardingStart => 'MULAI';

  @override
  String get onboardingNotSure => 'Tidak yakin? Mulai dari A1';

  @override
  String get onboardingChangeLater =>
      'Kamu bisa mengubahnya kapan saja di Pengaturan.';

  @override
  String get practiceTitle => 'LATIHAN';

  @override
  String get practiceSpellDue => 'Eja kata-kata yang sudah waktunya diulang';

  @override
  String get practiceLearnFirst => 'Pelajari beberapa kata dulu';

  @override
  String get practiceCaughtUp => 'Semua beres. Kembali lagi besok!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kata',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'PERMAINAN';

  @override
  String get practiceHiveSub =>
      'Usap di atas sarang lebah untuk mengeja tiap kata';

  @override
  String get practiceDddSub => 'Pilih artikel yang benar';

  @override
  String get practiceFalleeSub => 'Pilih artinya sebelum katanya mendarat';

  @override
  String get settingsTitle => 'PENGATURAN';

  @override
  String get settingsMadeBy => 'Dibuat dengan ❤️ oleh Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Level';

  @override
  String get settingsAutoSpeak => 'Pelafalan kata otomatis';

  @override
  String get settingsAutoSpeakSub => 'Di kartu kata dan setelah menjawab';

  @override
  String get settingsGamesAsPractice => 'Hitung permainan sebagai latihan';

  @override
  String get settingsGamesAsPracticeSub =>
      'Jawaban di permainan menaikkan atau menurunkan kata yang sudah dipelajari';

  @override
  String get settingsSounds => 'Suara & getaran';

  @override
  String get settingsSoundsSub => 'Di permainan dan latihan';

  @override
  String get settingsReset => 'Reset kemajuan';

  @override
  String get settingsResetTitle => 'Reset kemajuan?';

  @override
  String get settingsResetBody =>
      'Ini menghapus semua kata yang sudah dipelajari, poin, dan runtunanmu.';

  @override
  String get commonCancel => 'Batal';

  @override
  String get settingsResetConfirm => 'Reset';

  @override
  String get settingsPrivacyChoices => 'Privasi & pilihan iklan';

  @override
  String get settingsPrivacyPolicy => 'Kebijakan privasi';

  @override
  String get settingsContact => 'Hubungi dukungan';

  @override
  String get settingsLicences => 'Lisensi sumber terbuka';

  @override
  String settingsAbout(int count) {
    return '$count kata bahasa Jerman yang umum, dengan terjemahan bahasa Inggris dan pelafalan rekaman. Tanpa konten berbayar: semua kata dan permainan gratis.';
  }

  @override
  String get settingsMailLastError =>
      'Kesalahan terakhir di perangkat ini (hapus kalau mau):';

  @override
  String get spellingTitle => 'Latihan';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kata',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points poin',
    );
    return 'Kamu sudah berlatih $_temp0 dan mengumpulkan $_temp1.';
  }

  @override
  String get spellingNounHint => 'kata benda — sertakan der, die, atau das';

  @override
  String get spellingAnswerIs => 'Jawabannya';

  @override
  String get commonNext => 'LANJUT';

  @override
  String get spellingSkip => 'Lewati';

  @override
  String get spellingDelete => 'Hapus';

  @override
  String get spellingCheck => 'Periksa';

  @override
  String get wordListAllLearned =>
      'Kamu sudah mempelajari semua kata di daftar ini.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Masih ada $count kata di daftar ini.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'KOSAKATA ($count)';
  }

  @override
  String get reminderBody =>
      'Daily Hive hari ini sudah siap. Lima menit bahasa Jerman?';

  @override
  String get reminderChannel => 'Pengingat harian';

  @override
  String get reminderChannelDesc =>
      'Satu pengingat sehari, pada jam pilihanmu.';

  @override
  String get reminderSwitch => 'Pengingat harian';

  @override
  String reminderOnAt(String time) {
    return 'Satu pengingat sehari pukul $time';
  }

  @override
  String get reminderOff => 'Satu pengingat sehari, pada jam pilihanmu';

  @override
  String get reminderBlocked =>
      'Izinkan notifikasi untuk Wortschatz di pengaturan ponselmu agar dapat pengingat.';

  @override
  String get reminderTime => 'Waktu pengingat';

  @override
  String commonMastery(int level, int max) {
    return 'Penguasaan $level dari $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent% dipelajari';
  }

  @override
  String get commonListen => 'Dengarkan';

  @override
  String get commonNoVoice =>
      'Belum ada suara bahasa Jerman. Tambahkan di pengaturan teks-ke-ucapan perangkatmu.';

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
    return 'Data kata baru tersedia. Perbarui ($size)';
  }

  @override
  String get contentUpdating => 'Memperbarui kata…';

  @override
  String get contentUpdatedBanner =>
      'Kata sudah diperbarui. Kata baru muncul saat aplikasi dibuka lagi; rekaman sudah bisa diputar.';

  @override
  String get contentChecking => 'Memeriksa…';

  @override
  String get contentDownloading => 'Mengunduh dan memeriksa file…';

  @override
  String contentAvailable(int version, String size) {
    return 'Versi $version tersedia, $size';
  }

  @override
  String get contentUpdate => 'Perbarui';

  @override
  String get contentUpdated =>
      'Sudah diperbarui. Kata baru muncul saat aplikasi dibuka lagi.';

  @override
  String get contentUpToDate => 'Sudah terbaru';

  @override
  String get contentCheck => 'Periksa';

  @override
  String get contentAppTooOld => 'Perbarui aplikasi untuk mendapat konten baru';

  @override
  String get contentStore => 'Toko';

  @override
  String get contentFailed => 'Gagal memperbarui. Kata-katamu tidak berubah.';

  @override
  String get contentRetry => 'Coba lagi';

  @override
  String contentTitle(int version) {
    return 'Konten kata · versi $version';
  }

  @override
  String get contentAutoWifi => 'Perbarui otomatis lewat Wi-Fi';

  @override
  String get contentAutoWifiSub => 'Tidak pernah memakai data seluler';

  @override
  String summaryCombo(int count) {
    return 'Kombo: $count beruntun';
  }

  @override
  String get summaryNewBest => 'REKOR BARU!';

  @override
  String summaryBestCombo(int count) {
    return 'Kombo terbaik: $count beruntun';
  }

  @override
  String get summaryPlayAgain => 'MAIN LAGI';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dari 3 bintang',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle =>
      'Baca cerita asli berbahasa Jerman, kata demi kata';

  @override
  String get siblingWordbit =>
      'Satu kata Jerman setiap kali membuka kunci layar';

  @override
  String get siblingLeben => 'Lulus tes kewarganegaraan';

  @override
  String get siblingAudiobookName => 'Buku audio bahasa Jerman';

  @override
  String get siblingAudiobook => 'Dengarkan cerita sesuai level';
}
