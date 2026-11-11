// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get settingsLanguage => 'App-Sprache';

  @override
  String get languageSearchHint => 'Sprachen suchen';

  @override
  String get languageSystemDefault => 'Systemsprache';

  @override
  String languageFollowsDevice(String language) {
    return 'Folgt deinem Gerät · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz konnte nicht starten.\n\n$error';
  }

  @override
  String get navWords => 'Wörter';

  @override
  String get navPractice => 'Üben';

  @override
  String get navSettings => 'Einstellungen';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Serie: $count Tage',
      one: 'Serie: $count Tag',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Punkte';

  @override
  String get homeToPractise => 'Zu üben';

  @override
  String get homeVocabulary => 'Wortschatz';

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
      other: '$count Wörter',
      one: '$count Wort',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Level $level: $learned von $total Wörtern gelernt';
  }

  @override
  String get homeStartHere => 'Hier starten';

  @override
  String get homeStartHereBody =>
      'Lerne deine ersten 10 Wörter mit Ton – dann geht’s damit in die Spiele.';

  @override
  String get homeLearn10 => '10 WÖRTER LERNEN';

  @override
  String get homeGoal => 'Tagesziel';

  @override
  String get homeGoalReached => 'Tagesziel erreicht!';

  @override
  String get homeGoalReachedBody =>
      'Bis morgen – oder spiel weiter und sammle Punkte.';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$done von $goal Wörtern gelernt oder richtig beantwortet';
  }

  @override
  String get adsOutOfHints => 'Keine Tipps mehr';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Kurzes Werbevideo für $count weitere Tipps ansehen?',
      one: 'Kurzes Werbevideo für $count weiteren Tipp ansehen?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Jetzt nicht';

  @override
  String get adsWatchAd => 'Werbung sehen';

  @override
  String adsDoublePoints(int points) {
    return 'Doppelte Punkte (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Deine Serie von $days Tagen retten',
      one: 'Deine Serie von $days Tag retten',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Mehr Deutsch von Pratiyush';

  @override
  String get rulePluralOnly => 'Nur-Plural-Nomen: Im Plural steht immer die.';

  @override
  String ruleCompound(String head) {
    return 'Zusammengesetzte Wörter haben den Artikel ihres letzten Teils: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'Die meisten Nomen auf -$suffix haben $article.';
  }

  @override
  String get levelBeginner => 'Anfänger';

  @override
  String get levelElementary => 'Grundkenntnisse';

  @override
  String get levelIntermediate => 'Mittelstufe';

  @override
  String get levelUpperIntermediate => 'Obere Mittelstufe';

  @override
  String get levelAllInSequence => 'Alle Level nacheinander';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · empfohlen';

  @override
  String get levelOrChoose => 'Oder wähle ein oder mehrere Level';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Wörter',
      one: '$count Wort',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Level $level';
  }

  @override
  String get levelsKeepProgress =>
      'Dein Fortschritt bleibt für jedes Level erhalten – beim Wechseln geht kein gelerntes Wort verloren.';

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
      other: '$count Tipps',
      one: '$count Tipp',
      zero: 'keine Tipps',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Das heutige Spielfeld, für alle gleich';

  @override
  String practiceDailyDone(String stars) {
    return 'Heute geschafft: $stars. Tippen zum Teilen';
  }

  @override
  String get dddPerfect => 'Perfekt! Jeder Artikel richtig.';

  @override
  String get dddTip =>
      'Farben helfen beim Merken: der schwarz, die rot, das gold.';

  @override
  String dddItsArticle(String article) {
    return 'Es heißt $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Rasend schnell.';

  @override
  String get falleeKeepGoing =>
      'Weiter so: Je mehr du spielst, desto schneller liest du.';

  @override
  String hiveRound(int round) {
    return 'Runde $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Wort $n von $total';
  }

  @override
  String get hiveCoach =>
      'Tippe oder ziehe über benachbarte Buchstaben, um das deutsche Wort zu bilden';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Noch $count Buchstaben',
      one: 'Noch $count Buchstabe',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Tipp';

  @override
  String get hiveBoardCleared => 'Feld geschafft!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count Punkte',
      one: '+$count Punkt',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'ERGEBNIS TEILEN';

  @override
  String get commonDone => 'Fertig';

  @override
  String get hiveNextRound => 'NÄCHSTE RUNDE';

  @override
  String get commonLearn => 'Lernen';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Du hast $count neue Wörter gelernt. Morgen kommen sie zum Üben wieder.',
      one:
          'Du hast $count neues Wort gelernt. Morgen kommt es zum Üben wieder.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'SPÄTER';

  @override
  String get learnKnowIt => 'KANN ICH';

  @override
  String get learnFlip => 'UMDREHEN';

  @override
  String get learnPluralOnly => 'nur Plural · immer die';

  @override
  String learnPlural(String plural) {
    return 'Pl. $plural';
  }

  @override
  String get onboardingIntro =>
      'Lerne deutsche Wörter spielerisch. Welches Level hast du?';

  @override
  String get onboardingStart => 'LOS GEHT’S';

  @override
  String get onboardingNotSure => 'Unsicher? Starte mit A1';

  @override
  String get onboardingChangeLater =>
      'Das kannst du jederzeit in den Einstellungen ändern.';

  @override
  String get practiceTitle => 'ÜBEN';

  @override
  String get practiceSpellDue => 'Fällige Wörter schreiben';

  @override
  String get practiceLearnFirst => 'Lerne zuerst ein paar Wörter';

  @override
  String get practiceCaughtUp => 'Alles erledigt. Komm morgen wieder!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Wörter',
      one: '$count Wort',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'SPIELE';

  @override
  String get practiceHiveSub =>
      'Wische über die Waben, um jedes Wort zu bilden';

  @override
  String get practiceDddSub => 'Wähle den richtigen Artikel';

  @override
  String get practiceFalleeSub => 'Wähle die Bedeutung, bevor das Wort landet';

  @override
  String get settingsTitle => 'EINSTELLUNGEN';

  @override
  String get settingsMadeBy => 'Mit ❤️ gemacht von Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Level';

  @override
  String get settingsAutoSpeak => 'Wörter automatisch vorlesen';

  @override
  String get settingsAutoSpeakSub => 'Auf Lernkarten und nach Antworten';

  @override
  String get settingsGamesAsPractice => 'Spiele zählen als Übung';

  @override
  String get settingsGamesAsPracticeSub =>
      'Antworten in Spielen schieben gelernte Wörter vor oder zurück';

  @override
  String get settingsSounds => 'Töne & Vibration';

  @override
  String get settingsSoundsSub => 'In Spielen und beim Üben';

  @override
  String get settingsReset => 'Fortschritt zurücksetzen';

  @override
  String get settingsResetTitle => 'Fortschritt zurücksetzen?';

  @override
  String get settingsResetBody =>
      'Damit vergisst die App jedes gelernte Wort, deine Punkte und deine Serie.';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get settingsResetConfirm => 'Zurücksetzen';

  @override
  String get settingsPrivacyChoices => 'Datenschutz & Werbung';

  @override
  String get settingsPrivacyPolicy => 'Datenschutzerklärung';

  @override
  String get settingsContact => 'Support kontaktieren';

  @override
  String get settingsLicences => 'Open-Source-Lizenzen';

  @override
  String settingsAbout(int count) {
    return '$count häufige deutsche Wörter mit englischen Übersetzungen und eingesprochener Aussprache. Keine Bezahlschranke: Jedes Wort und jedes Spiel ist kostenlos.';
  }

  @override
  String get settingsMailLastError =>
      'Letzter Fehler auf diesem Gerät (lösch ihn gern):';

  @override
  String get spellingTitle => 'Üben';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Wörter',
      one: '$count Wort',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points Punkte',
      one: '$points Punkt',
    );
    return 'Du hast $_temp0 geübt und $_temp1 gesammelt.';
  }

  @override
  String get spellingNounHint => 'Nomen – mit der, die oder das';

  @override
  String get spellingAnswerIs => 'Die Antwort lautet';

  @override
  String get commonNext => 'WEITER';

  @override
  String get spellingSkip => 'Überspringen';

  @override
  String get spellingDelete => 'Löschen';

  @override
  String get spellingCheck => 'Prüfen';

  @override
  String get wordListAllLearned =>
      'Du hast jedes Wort in dieser Liste gelernt.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'In dieser Liste sind noch $count Wörter übrig.',
      one: 'In dieser Liste ist noch $count Wort übrig.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'WORTSCHATZ ($count)';
  }

  @override
  String get reminderBody =>
      'Das heutige Daily Hive ist bereit. Fünf Minuten Deutsch?';

  @override
  String get reminderChannel => 'Tägliche Erinnerung';

  @override
  String get reminderChannelDesc =>
      'Eine Erinnerung am Tag, zu deiner Wunschzeit.';

  @override
  String get reminderSwitch => 'Tägliche Erinnerung';

  @override
  String reminderOnAt(String time) {
    return 'Ein Stupser am Tag um $time';
  }

  @override
  String get reminderOff => 'Ein Stupser am Tag, zu deiner Wunschzeit';

  @override
  String get reminderBlocked =>
      'Erlaube Benachrichtigungen für Wortschatz in den Handy-Einstellungen, um eine Erinnerung zu bekommen.';

  @override
  String get reminderTime => 'Erinnerungszeit';

  @override
  String commonMastery(int level, int max) {
    return 'Beherrschung $level von $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent % gelernt';
  }

  @override
  String get commonListen => 'Anhören';

  @override
  String get commonNoVoice =>
      'Keine deutsche Stimme installiert. Füge eine in den Text-in-Sprache-Einstellungen deines Geräts hinzu.';

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
    return 'Neue Wortdaten verfügbar. Aktualisieren ($size)';
  }

  @override
  String get contentUpdating => 'Wörter werden aktualisiert…';

  @override
  String get contentUpdatedBanner =>
      'Wörter aktualisiert. Sie erscheinen beim nächsten App-Start; Aufnahmen spielen schon jetzt.';

  @override
  String get contentChecking => 'Wird geprüft…';

  @override
  String get contentDownloading => 'Dateien werden geladen und geprüft…';

  @override
  String contentAvailable(int version, String size) {
    return 'Version $version verfügbar, $size';
  }

  @override
  String get contentUpdate => 'Aktualisieren';

  @override
  String get contentUpdated =>
      'Aktualisiert. Neue Wörter erscheinen beim nächsten App-Start.';

  @override
  String get contentUpToDate => 'Aktuell';

  @override
  String get contentCheck => 'Prüfen';

  @override
  String get contentAppTooOld => 'Aktualisiere die App für neue Inhalte';

  @override
  String get contentStore => 'Store';

  @override
  String get contentFailed =>
      'Update fehlgeschlagen. Deine Wörter sind unverändert.';

  @override
  String get contentRetry => 'Nochmal';

  @override
  String contentTitle(int version) {
    return 'Wortinhalte · Version $version';
  }

  @override
  String get contentAutoWifi => 'Automatisch im WLAN aktualisieren';

  @override
  String get contentAutoWifiSub => 'Nie über mobile Daten';

  @override
  String summaryCombo(int count) {
    return 'Combo: $count in Folge';
  }

  @override
  String get summaryNewBest => 'NEUER REKORD!';

  @override
  String summaryBestCombo(int count) {
    return 'Beste Combo: $count in Folge';
  }

  @override
  String get summaryPlayAgain => 'NOCHMAL';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count von 3 Sternen',
      one: '$count von 3 Sternen',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'Lies echte deutsche Geschichten, Wort für Wort';

  @override
  String get siblingWordbit => 'Ein deutsches Wort bei jedem Entsperren';

  @override
  String get siblingLeben => 'Besteh den Einbürgerungstest';

  @override
  String get siblingAudiobookName => 'Deutsches Hörbuch';

  @override
  String get siblingAudiobook => 'Hör Geschichten nach Level';
}
