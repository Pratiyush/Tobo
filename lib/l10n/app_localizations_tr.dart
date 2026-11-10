// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get settingsLanguage => 'Uygulama dili';

  @override
  String get languageSearchHint => 'Dil ara';

  @override
  String get languageSystemDefault => 'Sistem varsayılanı';

  @override
  String languageFollowsDevice(String language) {
    return 'Cihazına uyar · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz başlatılamadı.\n\n$error';
  }

  @override
  String get navWords => 'Kelimeler';

  @override
  String get navPractice => 'Pratik';

  @override
  String get navSettings => 'Ayarlar';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Seri: $count gün',
      one: 'Seri: $count gün',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Puan';

  @override
  String get homeToPractise => 'Çalışılacak';

  @override
  String get homeVocabulary => 'Öğrenilen';

  @override
  String homeLevel(int level) {
    return 'Seviye $level';
  }

  @override
  String get homeLevelCaps => 'SEVİYE';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kelime',
      one: '$count kelime',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Seviye $level: $total kelimeden $learned tanesi öğrenildi';
  }

  @override
  String get homeStartHere => 'Buradan başla';

  @override
  String get homeStartHereBody =>
      'İlk 10 kelimeni sesli öğren, sonra onlarla oyunlarda oyna.';

  @override
  String get homeLearn10 => '10 KELİME ÖĞREN';

  @override
  String get homeGoal => 'Bugünün hedefi';

  @override
  String get homeGoalReached => 'Bugünün hedefi tamam!';

  @override
  String get homeGoalReachedBody =>
      'Yarın görüşürüz, ya da puan için oynamaya devam et.';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$goal kelimeden $done tanesi öğrenildi ya da doğru cevaplandı';
  }

  @override
  String get adsOutOfHints => 'İpucu kalmadı';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ipucu daha için kısa bir reklam izler misin?',
      one: '$count ipucu daha için kısa bir reklam izler misin?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Şimdi değil';

  @override
  String get adsWatchAd => 'Reklam izle';

  @override
  String adsDoublePoints(int points) {
    return 'Puanı ikiye katla (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days günlük serini geri getir',
      one: '$days günlük serini geri getir',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Pratiyush’tan daha fazla Almanca';

  @override
  String get rulePluralOnly => 'Yalnız çoğul isim: çoğul her zaman die alır.';

  @override
  String ruleCompound(String head) {
    return 'Birleşik kelimeler son parçalarının artikelini alır: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return '-$suffix ile biten isimlerin çoğu $article alır.';
  }

  @override
  String get levelBeginner => 'Başlangıç';

  @override
  String get levelElementary => 'Temel';

  @override
  String get levelIntermediate => 'Orta';

  @override
  String get levelUpperIntermediate => 'Orta üstü';

  @override
  String get levelAllInSequence => 'Tüm seviyeler sırayla';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · önerilen';

  @override
  String get levelOrChoose => 'Ya da bir veya birkaç seviye seç';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kelime',
      one: '$count kelime',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Seviye $level';
  }

  @override
  String get levelsKeepProgress =>
      'İlerlemen her seviye için saklanır; seviye değiştirince öğrendiğin hiçbir kelime kaybolmaz.';

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
      other: '$count ipucu',
      one: '$count ipucu',
      zero: 'ipucu yok',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Bugünün tahtası, herkes için aynı';

  @override
  String practiceDailyDone(String stars) {
    return 'Bugün bitti: $stars. Paylaşmak için dokun';
  }

  @override
  String get dddPerfect => 'Perfekt! Tüm artikeller doğru.';

  @override
  String get dddTip =>
      'Renkler hatırlamanı kolaylaştırır: der siyah, die kırmızı, das altın.';

  @override
  String dddItsArticle(String article) {
    return 'Doğrusu: $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Şimşek gibi hızlı.';

  @override
  String get falleeKeepGoing =>
      'Devam et: ne kadar çok oynarsan o kadar hızlı okursun.';

  @override
  String hiveRound(int round) {
    return 'Tur $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Kelime $n/$total';
  }

  @override
  String get hiveCoach =>
      'Almanca kelimeyi yazmak için komşu harflere dokun ya da üzerlerinde kaydır';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count harf kaldı',
      one: '$count harf kaldı',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'İpucu';

  @override
  String get hiveBoardCleared => 'Tahta tamamlandı!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count puan',
      one: '+$count puan',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'SONUCU PAYLAŞ';

  @override
  String get commonDone => 'Tamam';

  @override
  String get hiveNextRound => 'SONRAKİ TUR';

  @override
  String get commonLearn => 'Öğren';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yeni kelime öğrendin. Yarın pratik için geri gelecekler.',
      one: '$count yeni kelime öğrendin. Yarın pratik için geri gelecek.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'SONRA';

  @override
  String get learnKnowIt => 'BİLİYORUM';

  @override
  String get learnFlip => 'ÇEVİR';

  @override
  String get learnPluralOnly => 'yalnız çoğul · her zaman die';

  @override
  String learnPlural(String plural) {
    return 'çoğ. $plural';
  }

  @override
  String get onboardingIntro =>
      'Almanca kelimeleri oynayarak öğren. Seviyen ne?';

  @override
  String get onboardingStart => 'BAŞLA';

  @override
  String get onboardingNotSure => 'Emin değil misin? A1’den başla';

  @override
  String get onboardingChangeLater =>
      'Bunu istediğin zaman Ayarlar’dan değiştirebilirsin.';

  @override
  String get practiceTitle => 'PRATİK';

  @override
  String get practiceSpellDue => 'Sırası gelen kelimeleri yaz';

  @override
  String get practiceLearnFirst => 'Önce birkaç kelime öğren';

  @override
  String get practiceCaughtUp => 'Hepsi tamam. Yarın yine gel!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kelime',
      one: '$count kelime',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'OYUNLAR';

  @override
  String get practiceHiveSub => 'Her kelimeyi yazmak için petekte kaydır';

  @override
  String get practiceDddSub => 'Doğru artikeli seç';

  @override
  String get practiceFalleeSub => 'Kelime düşmeden anlamını seç';

  @override
  String get settingsTitle => 'AYARLAR';

  @override
  String get settingsMadeBy =>
      'Pratiyush Kumar Singh tarafından ❤️ ile yapıldı';

  @override
  String get settingsLevels => 'Seviyeler';

  @override
  String get settingsAutoSpeak => 'Kelimeleri otomatik seslendir';

  @override
  String get settingsAutoSpeakSub => 'Kartlarda ve cevaplardan sonra';

  @override
  String get settingsGamesAsPractice => 'Oyunlar pratik sayılsın';

  @override
  String get settingsGamesAsPracticeSub =>
      'Oyundaki cevaplar öğrenilen kelimeleri yukarı ya da aşağı taşır';

  @override
  String get settingsSounds => 'Ses ve titreşim';

  @override
  String get settingsSoundsSub => 'Oyunlarda ve pratikte';

  @override
  String get settingsReset => 'İlerlemeyi sıfırla';

  @override
  String get settingsResetTitle => 'İlerleme sıfırlansın mı?';

  @override
  String get settingsResetBody =>
      'Bu, öğrendiğin tüm kelimeleri, puanlarını ve serini siler.';

  @override
  String get commonCancel => 'İptal';

  @override
  String get settingsResetConfirm => 'Sıfırla';

  @override
  String get settingsPrivacyChoices => 'Gizlilik ve reklam seçenekleri';

  @override
  String get settingsPrivacyPolicy => 'Gizlilik politikası';

  @override
  String get settingsContact => 'Destekle iletişime geç';

  @override
  String get settingsLicences => 'Açık kaynak lisansları';

  @override
  String settingsAbout(int count) {
    return 'İngilizce çevirileri ve kayıtlı telaffuzlarıyla $count yaygın Almanca kelime. Ödeme duvarı yok: her kelime ve her oyun ücretsiz.';
  }

  @override
  String get settingsMailLastError => 'Bu cihazdaki son hata (istersen sil):';

  @override
  String get spellingTitle => 'Pratik';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kelime',
      one: '$count kelime',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points puan',
      one: '$points puan',
    );
    return '$_temp0 çalıştın ve $_temp1 kazandın.';
  }

  @override
  String get spellingNounHint => 'isim — der, die ya da das ile yaz';

  @override
  String get spellingAnswerIs => 'Doğru cevap';

  @override
  String get commonNext => 'SONRAKİ';

  @override
  String get spellingSkip => 'Geç';

  @override
  String get spellingDelete => 'Sil';

  @override
  String get spellingCheck => 'Kontrol et';

  @override
  String get wordListAllLearned => 'Bu listedeki tüm kelimeleri öğrendin.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bu listede $count kelime kaldı.',
      one: 'Bu listede $count kelime kaldı.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'KELİMELER ($count)';
  }

  @override
  String get reminderBody => 'Bugünkü Daily Hive hazır. Beş dakika Almanca?';

  @override
  String get reminderChannel => 'Günlük hatırlatıcı';

  @override
  String get reminderChannelDesc => 'Günde bir hatırlatma, seçtiğin saatte.';

  @override
  String get reminderSwitch => 'Günlük hatırlatıcı';

  @override
  String reminderOnAt(String time) {
    return 'Günde bir hatırlatma, saat $time';
  }

  @override
  String get reminderOff => 'Günde bir hatırlatma, seçtiğin saatte';

  @override
  String get reminderBlocked =>
      'Hatırlatma almak için telefon ayarlarından Wortschatz bildirimlerine izin ver.';

  @override
  String get reminderTime => 'Hatırlatma saati';

  @override
  String commonMastery(int level, int max) {
    return 'Ustalık $level/$max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '%$percent öğrenildi';
  }

  @override
  String get commonListen => 'Dinle';

  @override
  String get commonNoVoice =>
      'Almanca ses yüklü değil. Cihazının metin okuma ayarlarından bir tane ekle.';

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
    return 'Yeni kelime verisi var. Güncelle ($size)';
  }

  @override
  String get contentUpdating => 'Kelimeler güncelleniyor…';

  @override
  String get contentUpdatedBanner =>
      'Kelimeler güncellendi. Uygulamayı bir sonraki açışında görünecekler; ses kayıtları şimdiden çalışıyor.';

  @override
  String get contentChecking => 'Kontrol ediliyor…';

  @override
  String get contentDownloading => 'Dosyalar indiriliyor ve kontrol ediliyor…';

  @override
  String contentAvailable(int version, String size) {
    return 'Sürüm $version mevcut, $size';
  }

  @override
  String get contentUpdate => 'Güncelle';

  @override
  String get contentUpdated =>
      'Güncellendi. Yeni kelimeler uygulamayı bir sonraki açışında görünecek.';

  @override
  String get contentUpToDate => 'Güncel';

  @override
  String get contentCheck => 'Kontrol et';

  @override
  String get contentAppTooOld => 'Yeni içerik için uygulamayı güncelle';

  @override
  String get contentStore => 'Mağaza';

  @override
  String get contentFailed => 'Güncellenemedi. Kelimelerin değişmedi.';

  @override
  String get contentRetry => 'Tekrar dene';

  @override
  String contentTitle(int version) {
    return 'Kelime içeriği · sürüm $version';
  }

  @override
  String get contentAutoWifi => 'Wi-Fi’da otomatik güncelle';

  @override
  String get contentAutoWifiSub => 'Mobil veride asla';

  @override
  String summaryCombo(int count) {
    return 'Kombo: $count üst üste';
  }

  @override
  String get summaryNewBest => 'YENİ REKOR!';

  @override
  String summaryBestCombo(int count) {
    return 'En iyi kombo: $count üst üste';
  }

  @override
  String get summaryPlayAgain => 'TEKRAR OYNA';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '3 yıldızdan $count',
      one: '3 yıldızdan $count',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'Gerçek Almanca hikâyeleri kelime kelime oku';

  @override
  String get siblingWordbit => 'Kilidi her açışında bir Almanca kelime';

  @override
  String get siblingLeben => 'Vatandaşlık sınavını geç';

  @override
  String get siblingAudiobookName => 'Almanca sesli kitap';

  @override
  String get siblingAudiobook => 'Seviyelere göre hikâyeler dinle';
}
