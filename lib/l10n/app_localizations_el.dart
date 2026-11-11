// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get settingsLanguage => 'Γλώσσα εφαρμογής';

  @override
  String get languageSearchHint => 'Αναζήτηση γλώσσας';

  @override
  String get languageSystemDefault => 'Γλώσσα συστήματος';

  @override
  String languageFollowsDevice(String language) {
    return 'Όπως η συσκευή σου · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Το Wortschatz δεν μπόρεσε να ξεκινήσει.\n\n$error';
  }

  @override
  String get navWords => 'Λέξεις';

  @override
  String get navPractice => 'Εξάσκηση';

  @override
  String get navSettings => 'Ρυθμίσεις';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Σερί: $count μέρες',
      one: 'Σερί: $count μέρα',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Πόντοι';

  @override
  String get homeToPractise => 'Για εξάσκηση';

  @override
  String get homeVocabulary => 'Λεξιλόγιο';

  @override
  String homeLevel(int level) {
    return 'Επίπεδο $level';
  }

  @override
  String get homeLevelCaps => 'ΕΠΙΠΕΔΟ';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count λέξεις',
      one: '$count λέξη',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Επίπεδο $level: έμαθες $learned από $total λέξεις';
  }

  @override
  String get homeStartHere => 'Ξεκίνα εδώ';

  @override
  String get homeStartHereBody =>
      'Μάθε τις πρώτες σου 10 λέξεις με ήχο και μετά παίξε μαζί τους στα παιχνίδια.';

  @override
  String get homeLearn10 => 'ΜΑΘΕ 10 ΛΕΞΕΙΣ';

  @override
  String get homeGoal => 'Στόχος ημέρας';

  @override
  String get homeGoalReached => 'Στόχος ημέρας: έγινε!';

  @override
  String get homeGoalReachedBody =>
      'Τα λέμε αύριο ή συνέχισε να παίζεις για πόντους.';

  @override
  String homeGoalProgress(int done, int goal) {
    return 'Μαθημένες λέξεις ή σωστές απαντήσεις: $done από $goal';
  }

  @override
  String get adsOutOfHints => 'Τελείωσαν οι υποδείξεις';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Βλέπεις μια σύντομη διαφήμιση για $count ακόμη υποδείξεις;',
      one: 'Βλέπεις μια σύντομη διαφήμιση για $count ακόμη υπόδειξη;',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Όχι τώρα';

  @override
  String get adsWatchAd => 'Δες διαφήμιση';

  @override
  String adsDoublePoints(int points) {
    return 'Διπλοί πόντοι (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Επανάφερε το σερί $days ημερών',
      one: 'Επανάφερε το σερί $days μέρας',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Περισσότερα γερμανικά από τον Pratiyush';

  @override
  String get rulePluralOnly => 'Μόνο στον πληθυντικό: παίρνει πάντα die.';

  @override
  String ruleCompound(String head) {
    return 'Οι σύνθετες λέξεις παίρνουν το άρθρο του τελευταίου τους μέρους: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'Τα περισσότερα ουσιαστικά σε -$suffix παίρνουν $article.';
  }

  @override
  String get levelBeginner => 'Στοιχειώδης γνώση';

  @override
  String get levelElementary => 'Βασική γνώση';

  @override
  String get levelIntermediate => 'Μέτρια γνώση';

  @override
  String get levelUpperIntermediate => 'Καλή γνώση';

  @override
  String get levelAllInSequence => 'Όλα τα επίπεδα με τη σειρά';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · προτείνεται';

  @override
  String get levelOrChoose => 'Ή διάλεξε ένα ή περισσότερα επίπεδα';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count λέξεις',
      one: '$count λέξη',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Επίπεδο $level';
  }

  @override
  String get levelsKeepProgress =>
      'Η πρόοδός σου κρατιέται για κάθε επίπεδο, οπότε με την αλλαγή δεν χάνεις καμία λέξη που έμαθες.';

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
      other: '$count υποδείξεις',
      one: '$count υπόδειξη',
      zero: 'χωρίς υποδείξεις',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Το σημερινό ταμπλό, ίδιο για όλους';

  @override
  String practiceDailyDone(String stars) {
    return 'Έγινε σήμερα: $stars. Πάτα για κοινοποίηση';
  }

  @override
  String get dddPerfect => 'Perfekt! Όλα τα άρθρα σωστά.';

  @override
  String get dddTip =>
      'Το χρώμα σε βοηθά να θυμάσαι: der μαύρο, die κόκκινο, das χρυσό.';

  @override
  String dddItsArticle(String article) {
    return 'Το σωστό: $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Αστραπιαία.';

  @override
  String get falleeKeepGoing =>
      'Συνέχισε: όσο περισσότερο παίζεις, τόσο πιο γρήγορα διαβάζεις.';

  @override
  String hiveRound(int round) {
    return 'Γύρος $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Λέξη $n από $total';
  }

  @override
  String get hiveCoach =>
      'Πάτα ή σύρε πάνω σε γειτονικά γράμματα για να γράψεις τη γερμανική λέξη';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Μένουν $count γράμματα',
      one: 'Μένει $count γράμμα',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Υπόδειξη';

  @override
  String get hiveBoardCleared => 'Το ταμπλό καθάρισε!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count πόντοι',
      one: '+$count πόντος',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'ΚΟΙΝΟΠΟΙΗΣΗ';

  @override
  String get commonDone => 'Τέλος';

  @override
  String get hiveNextRound => 'ΕΠΟΜΕΝΟΣ ΓΥΡΟΣ';

  @override
  String get commonLearn => 'Μάθε';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Έμαθες $count νέες λέξεις. Θα ξαναέρθουν για εξάσκηση αύριο.',
      one: 'Έμαθες $count νέα λέξη. Θα ξαναέρθει για εξάσκηση αύριο.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'ΑΡΓΟΤΕΡΑ';

  @override
  String get learnKnowIt => 'ΤΗΝ ΞΕΡΩ';

  @override
  String get learnFlip => 'ΓΥΡΙΣΕ ΤΗΝ';

  @override
  String get learnPluralOnly => 'μόνο πληθ. · πάντα die';

  @override
  String learnPlural(String plural) {
    return 'πληθ. $plural';
  }

  @override
  String get onboardingIntro =>
      'Μάθε γερμανικές λέξεις παίζοντας. Ποιο είναι το επίπεδό σου;';

  @override
  String get onboardingStart => 'ΞΕΚΙΝΑ';

  @override
  String get onboardingNotSure => 'Δεν ξέρεις; Ξεκίνα από το A1';

  @override
  String get onboardingChangeLater =>
      'Μπορείς να το αλλάξεις όποτε θέλεις στις Ρυθμίσεις.';

  @override
  String get practiceTitle => 'ΕΞΑΣΚΗΣΗ';

  @override
  String get practiceSpellDue => 'Γράψε τις λέξεις που είναι για επανάληψη';

  @override
  String get practiceLearnFirst => 'Μάθε πρώτα μερικές λέξεις';

  @override
  String get practiceCaughtUp => 'Όλα έτοιμα. Τα λέμε αύριο!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count λέξεις',
      one: '$count λέξη',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'ΠΑΙΧΝΙΔΙΑ';

  @override
  String get practiceHiveSub =>
      'Σύρε πάνω στην κηρήθρα για να γράψεις κάθε λέξη';

  @override
  String get practiceDddSub => 'Διάλεξε το σωστό άρθρο';

  @override
  String get practiceFalleeSub => 'Διάλεξε τη σημασία πριν πέσει η λέξη';

  @override
  String get settingsTitle => 'ΡΥΘΜΙΣΕΙΣ';

  @override
  String get settingsMadeBy => 'Φτιαγμένο με ❤️ από τον Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Επίπεδα';

  @override
  String get settingsAutoSpeak => 'Αυτόματη εκφώνηση λέξεων';

  @override
  String get settingsAutoSpeakSub => 'Στις κάρτες και μετά τις απαντήσεις';

  @override
  String get settingsGamesAsPractice => 'Τα παιχνίδια μετράνε ως εξάσκηση';

  @override
  String get settingsGamesAsPracticeSub =>
      'Οι απαντήσεις στα παιχνίδια ανεβάζουν ή κατεβάζουν τις μαθημένες λέξεις';

  @override
  String get settingsSounds => 'Ήχοι και δόνηση';

  @override
  String get settingsSoundsSub => 'Στα παιχνίδια και στην εξάσκηση';

  @override
  String get settingsReset => 'Μηδενισμός προόδου';

  @override
  String get settingsResetTitle => 'Μηδενισμός προόδου;';

  @override
  String get settingsResetBody =>
      'Θα σβηστούν όλες οι λέξεις που έμαθες, οι πόντοι και το σερί σου.';

  @override
  String get commonCancel => 'Ακύρωση';

  @override
  String get settingsResetConfirm => 'Μηδενισμός';

  @override
  String get settingsPrivacyChoices => 'Απόρρητο και διαφημίσεις';

  @override
  String get settingsPrivacyPolicy => 'Πολιτική απορρήτου';

  @override
  String get settingsContact => 'Επικοινωνία με την υποστήριξη';

  @override
  String get settingsLicences => 'Άδειες ανοιχτού κώδικα';

  @override
  String settingsAbout(int count) {
    return 'Συχνές γερμανικές λέξεις ($count) με αγγλική μετάφραση και ηχογραφημένη προφορά. Τίποτα επί πληρωμή: όλες οι λέξεις και τα παιχνίδια είναι δωρεάν.';
  }

  @override
  String get settingsMailLastError =>
      'Τελευταίο σφάλμα σε αυτή τη συσκευή (σβήσ\' το αν θέλεις):';

  @override
  String get spellingTitle => 'Εξάσκηση';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count λέξεις',
      one: '$count λέξη',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points πόντους',
      one: '$points πόντο',
    );
    return 'Εξασκήθηκες σε $_temp0 και μάζεψες $_temp1.';
  }

  @override
  String get spellingNounHint => 'ουσιαστικό — με der, die ή das';

  @override
  String get spellingAnswerIs => 'Η απάντηση είναι';

  @override
  String get commonNext => 'ΕΠΟΜΕΝΟ';

  @override
  String get spellingSkip => 'Παράλειψη';

  @override
  String get spellingDelete => 'Διαγραφή';

  @override
  String get spellingCheck => 'Έλεγχος';

  @override
  String get wordListAllLearned => 'Έμαθες κάθε λέξη αυτής της λίστας.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Μένουν $count λέξεις σε αυτή τη λίστα.',
      one: 'Μένει $count λέξη σε αυτή τη λίστα.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'ΛΕΞΙΛΟΓΙΟ ($count)';
  }

  @override
  String get reminderBody =>
      'Το σημερινό Daily Hive είναι έτοιμο. Πέντε λεπτά γερμανικά;';

  @override
  String get reminderChannel => 'Καθημερινή υπενθύμιση';

  @override
  String get reminderChannelDesc =>
      'Μία υπενθύμιση τη μέρα, την ώρα που διαλέγεις.';

  @override
  String get reminderSwitch => 'Καθημερινή υπενθύμιση';

  @override
  String reminderOnAt(String time) {
    return 'Μία υπενθύμιση τη μέρα στις $time';
  }

  @override
  String get reminderOff => 'Μία υπενθύμιση τη μέρα, την ώρα που θέλεις';

  @override
  String get reminderBlocked =>
      'Επίτρεψε τις ειδοποιήσεις για το Wortschatz στις ρυθμίσεις του κινητού για να λαμβάνεις υπενθύμιση.';

  @override
  String get reminderTime => 'Ώρα υπενθύμισης';

  @override
  String commonMastery(int level, int max) {
    return 'Εξοικείωση $level από $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent% μαθημένα';
  }

  @override
  String get commonListen => 'Άκου';

  @override
  String get commonNoVoice =>
      'Δεν υπάρχει γερμανική φωνή. Πρόσθεσε μία στις ρυθμίσεις μετατροπής κειμένου σε ομιλία της συσκευής.';

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
    return 'Νέα δεδομένα λέξεων. Ενημέρωση ($size)';
  }

  @override
  String get contentUpdating => 'Ενημέρωση λέξεων…';

  @override
  String get contentUpdatedBanner =>
      'Οι λέξεις ενημερώθηκαν. Θα εμφανιστούν την επόμενη φορά που θα ανοίξεις την εφαρμογή. Οι ηχογραφήσεις παίζουν ήδη.';

  @override
  String get contentChecking => 'Έλεγχος…';

  @override
  String get contentDownloading => 'Λήψη και έλεγχος αρχείων…';

  @override
  String contentAvailable(int version, String size) {
    return 'Διαθέσιμη η έκδοση $version, $size';
  }

  @override
  String get contentUpdate => 'Ενημέρωση';

  @override
  String get contentUpdated =>
      'Ενημερώθηκε. Οι νέες λέξεις εμφανίζονται την επόμενη φορά που θα ανοίξεις την εφαρμογή.';

  @override
  String get contentUpToDate => 'Όλα ενημερωμένα';

  @override
  String get contentCheck => 'Έλεγχος';

  @override
  String get contentAppTooOld => 'Ενημέρωσε την εφαρμογή για νέο περιεχόμενο';

  @override
  String get contentStore => 'Κατάστημα';

  @override
  String get contentFailed => 'Η ενημέρωση απέτυχε. Οι λέξεις σου δεν άλλαξαν.';

  @override
  String get contentRetry => 'Δοκίμασε ξανά';

  @override
  String contentTitle(int version) {
    return 'Λέξεις · έκδοση $version';
  }

  @override
  String get contentAutoWifi => 'Αυτόματη ενημέρωση μέσω Wi-Fi';

  @override
  String get contentAutoWifiSub => 'Ποτέ με δεδομένα κινητής';

  @override
  String summaryCombo(int count) {
    return 'Κόμπο: $count στη σειρά';
  }

  @override
  String get summaryNewBest => 'ΡΕΚΟΡ!';

  @override
  String summaryBestCombo(int count) {
    return 'Καλύτερο κόμπο: $count στη σειρά';
  }

  @override
  String get summaryPlayAgain => 'ΠΑΙΞΕ ΞΑΝΑ';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αστέρια από 3',
      one: '$count αστέρι από 3',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle =>
      'Διάβασε αληθινές γερμανικές ιστορίες, λέξη προς λέξη';

  @override
  String get siblingWordbit => 'Μια γερμανική λέξη κάθε φορά που ξεκλειδώνεις';

  @override
  String get siblingLeben => 'Πέρασε το τεστ πολιτογράφησης';

  @override
  String get siblingAudiobookName => 'Γερμανικό ηχοβιβλίο';

  @override
  String get siblingAudiobook => 'Άκου ιστορίες ανά επίπεδο';
}
