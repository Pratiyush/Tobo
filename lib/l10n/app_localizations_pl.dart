// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get settingsLanguage => 'Język aplikacji';

  @override
  String get languageSearchHint => 'Szukaj języków';

  @override
  String get languageSystemDefault => 'Język systemu';

  @override
  String languageFollowsDevice(String language) {
    return 'Jak w urządzeniu · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Nie udało się uruchomić aplikacji Wortschatz.\n\n$error';
  }

  @override
  String get navWords => 'Słowa';

  @override
  String get navPractice => 'Ćwiczenia';

  @override
  String get navSettings => 'Ustawienia';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Seria: $count dni',
      many: 'Seria: $count dni',
      few: 'Seria: $count dni',
      one: 'Seria: $count dzień',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Punkty';

  @override
  String get homeToPractise => 'Do ćwiczeń';

  @override
  String get homeVocabulary => 'Słownictwo';

  @override
  String homeLevel(int level) {
    return 'Poziom $level';
  }

  @override
  String get homeLevelCaps => 'POZIOM';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count słów',
      many: '$count słów',
      few: '$count słowa',
      one: '$count słowo',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Poziom $level: nauczono $learned z $total słów';
  }

  @override
  String get homeStartHere => 'Zacznij tutaj';

  @override
  String get homeStartHereBody =>
      'Naucz się pierwszych 10 słów z wymową, a potem użyj ich w grach.';

  @override
  String get homeLearn10 => 'NAUCZ SIĘ 10 SŁÓW';

  @override
  String get homeGoal => 'Cel na dziś';

  @override
  String get homeGoalReached => 'Cel na dziś osiągnięty!';

  @override
  String get homeGoalReachedBody =>
      'Do jutra! Albo graj dalej i zbieraj punkty.';

  @override
  String homeGoalProgress(int done, int goal) {
    return 'Nauczone słowa lub dobre odpowiedzi: $done z $goal';
  }

  @override
  String get adsOutOfHints => 'Brak podpowiedzi';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Obejrzysz krótką reklamę za $count podpowiedzi więcej?',
      many: 'Obejrzysz krótką reklamę za $count podpowiedzi więcej?',
      few: 'Obejrzysz krótką reklamę za $count podpowiedzi więcej?',
      one: 'Obejrzysz krótką reklamę za $count podpowiedź więcej?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Nie teraz';

  @override
  String get adsWatchAd => 'Zobacz reklamę';

  @override
  String adsDoublePoints(int points) {
    return 'Podwój punkty (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Przywróć swoją $days-dniową serię',
      many: 'Przywróć swoją $days-dniową serię',
      few: 'Przywróć swoją $days-dniową serię',
      one: 'Przywróć swoją $days-dniową serię',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Więcej niemieckiego od Pratiyusha';

  @override
  String get rulePluralOnly =>
      'Rzeczownik tylko w liczbie mnogiej: liczba mnoga ma zawsze die.';

  @override
  String ruleCompound(String head) {
    return 'Wyrazy złożone mają rodzajnik ostatniego członu: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'Większość rzeczowników zakończonych na -$suffix ma $article.';
  }

  @override
  String get levelBeginner => 'Początkujący';

  @override
  String get levelElementary => 'Podstawowy';

  @override
  String get levelIntermediate => 'Średnio zaawansowany';

  @override
  String get levelUpperIntermediate => 'Wyższy średni';

  @override
  String get levelAllInSequence => 'Wszystkie poziomy po kolei';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · polecane';

  @override
  String get levelOrChoose => 'Albo wybierz jeden lub więcej poziomów';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count słów',
      many: '$count słów',
      few: '$count słowa',
      one: '$count słowo',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Poziom $level';
  }

  @override
  String get levelsKeepProgress =>
      'Twoje postępy są zapisane dla każdego poziomu, więc zmiana nigdy nie kasuje nauczonych słów.';

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
      other: '$count podpowiedzi',
      many: '$count podpowiedzi',
      few: '$count podpowiedzi',
      one: '$count podpowiedź',
      zero: 'bez podpowiedzi',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Dzisiejsza plansza, taka sama dla wszystkich';

  @override
  String practiceDailyDone(String stars) {
    return 'Zrobione dziś: $stars. Dotknij, by udostępnić';
  }

  @override
  String get dddPerfect => 'Perfekt! Wszystkie rodzajniki poprawne.';

  @override
  String get dddTip =>
      'Kolor pomaga zapamiętać: der czarny, die czerwony, das złoty.';

  @override
  String dddItsArticle(String article) {
    return 'To $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Szybko jak błyskawica.';

  @override
  String get falleeKeepGoing =>
      'Tak trzymaj: im więcej grasz, tym szybciej czytasz.';

  @override
  String hiveRound(int round) {
    return 'Runda $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Słowo $n z $total';
  }

  @override
  String get hiveCoach =>
      'Dotknij lub przeciągnij po sąsiednich literach, by ułożyć niemieckie słowo';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zostało $count liter',
      many: 'Zostało $count liter',
      few: 'Zostały $count litery',
      one: 'Została $count litera',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Podpowiedź';

  @override
  String get hiveBoardCleared => 'Plansza ukończona!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count punktów',
      many: '+$count punktów',
      few: '+$count punkty',
      one: '+$count punkt',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'UDOSTĘPNIJ';

  @override
  String get commonDone => 'Gotowe';

  @override
  String get hiveNextRound => 'NASTĘPNA RUNDA';

  @override
  String get commonLearn => 'Nauka';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Znasz $count nowych słów. Jutro wrócą do powtórki.',
      many: 'Znasz $count nowych słów. Jutro wrócą do powtórki.',
      few: 'Znasz $count nowe słowa. Jutro wrócą do powtórki.',
      one: 'Znasz $count nowe słowo. Jutro wróci do powtórki.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'PÓŹNIEJ';

  @override
  String get learnKnowIt => 'ZNAM';

  @override
  String get learnFlip => 'ODWRÓĆ';

  @override
  String get learnPluralOnly => 'tylko liczba mnoga · zawsze die';

  @override
  String learnPlural(String plural) {
    return 'lm. $plural';
  }

  @override
  String get onboardingIntro =>
      'Ucz się niemieckich słów, grając. Jaki masz poziom?';

  @override
  String get onboardingStart => 'START';

  @override
  String get onboardingNotSure => 'Nie wiesz? Zacznij od A1';

  @override
  String get onboardingChangeLater =>
      'Możesz to zmienić w każdej chwili w Ustawieniach.';

  @override
  String get practiceTitle => 'ĆWICZENIA';

  @override
  String get practiceSpellDue => 'Napisz słowa do powtórki';

  @override
  String get practiceLearnFirst => 'Najpierw naucz się kilku słów';

  @override
  String get practiceCaughtUp => 'Wszystko zrobione. Wróć jutro!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count słów',
      many: '$count słów',
      few: '$count słowa',
      one: '$count słowo',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'GRY';

  @override
  String get practiceHiveSub =>
      'Przesuwaj po plastrze miodu, by ułożyć każde słowo';

  @override
  String get practiceDddSub => 'Wybierz właściwy rodzajnik';

  @override
  String get practiceFalleeSub => 'Wybierz znaczenie, zanim słowo spadnie';

  @override
  String get settingsTitle => 'USTAWIENIA';

  @override
  String get settingsMadeBy => 'Stworzone z ❤️ przez Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Poziomy';

  @override
  String get settingsAutoSpeak => 'Automatycznie wymawiaj słowa';

  @override
  String get settingsAutoSpeakSub => 'Na fiszkach i po odpowiedziach';

  @override
  String get settingsGamesAsPractice => 'Gry liczą się jako ćwiczenia';

  @override
  String get settingsGamesAsPracticeSub =>
      'Odpowiedzi w grach przesuwają nauczone słowa w górę lub w dół';

  @override
  String get settingsSounds => 'Dźwięki i wibracje';

  @override
  String get settingsSoundsSub => 'W grach i ćwiczeniach';

  @override
  String get settingsReset => 'Resetuj postępy';

  @override
  String get settingsResetTitle => 'Zresetować postępy?';

  @override
  String get settingsResetBody =>
      'To usunie wszystkie nauczone słowa, twoje punkty i serię.';

  @override
  String get commonCancel => 'Anuluj';

  @override
  String get settingsResetConfirm => 'Resetuj';

  @override
  String get settingsPrivacyChoices => 'Prywatność i reklamy';

  @override
  String get settingsPrivacyPolicy => 'Polityka prywatności';

  @override
  String get settingsContact => 'Kontakt z pomocą techniczną';

  @override
  String get settingsLicences => 'Licencje open source';

  @override
  String settingsAbout(int count) {
    return 'Popularne niemieckie słowa ($count) z angielskimi tłumaczeniami i nagraną wymową. Bez płatnych treści: każde słowo i każda gra są za darmo.';
  }

  @override
  String get settingsMailLastError =>
      'Ostatni błąd na tym urządzeniu (usuń, jeśli wolisz):';

  @override
  String get spellingTitle => 'Ćwiczenia';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count słów',
      many: '$count słów',
      few: '$count słowa',
      one: '$count słowo',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points punktów',
      many: '$points punktów',
      few: '$points punkty',
      one: '$points punkt',
    );
    return 'Przećwiczono $_temp0 i zdobyto $_temp1.';
  }

  @override
  String get spellingNounHint => 'rzeczownik — z der, die lub das';

  @override
  String get spellingAnswerIs => 'Poprawna odpowiedź to';

  @override
  String get commonNext => 'DALEJ';

  @override
  String get spellingSkip => 'Pomiń';

  @override
  String get spellingDelete => 'Usuń';

  @override
  String get spellingCheck => 'Sprawdź';

  @override
  String get wordListAllLearned => 'Znasz już każde słowo z tej listy.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Na tej liście zostało jeszcze $count słów.',
      many: 'Na tej liście zostało jeszcze $count słów.',
      few: 'Na tej liście zostały jeszcze $count słowa.',
      one: 'Na tej liście zostało jeszcze $count słowo.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'SŁOWNICTWO ($count)';
  }

  @override
  String get reminderBody =>
      'Dzisiejszy Daily Hive czeka. Pięć minut niemieckiego?';

  @override
  String get reminderChannel => 'Codzienne przypomnienie';

  @override
  String get reminderChannelDesc =>
      'Jedno przypomnienie dziennie, o wybranej porze.';

  @override
  String get reminderSwitch => 'Codzienne przypomnienie';

  @override
  String reminderOnAt(String time) {
    return 'Jedno przypomnienie dziennie o $time';
  }

  @override
  String get reminderOff => 'Jedno przypomnienie dziennie, o wybranej porze';

  @override
  String get reminderBlocked =>
      'Zezwól na powiadomienia z Wortschatz w ustawieniach telefonu, aby dostać przypomnienie.';

  @override
  String get reminderTime => 'Godzina przypomnienia';

  @override
  String commonMastery(int level, int max) {
    return 'Opanowanie $level z $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return 'Nauczone: $percent%';
  }

  @override
  String get commonListen => 'Posłuchaj';

  @override
  String get commonNoVoice =>
      'Brak niemieckiego głosu. Dodaj go w ustawieniach zamiany tekstu na mowę na swoim urządzeniu.';

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
    return 'Dostępne nowe dane słów. Aktualizuj ($size)';
  }

  @override
  String get contentUpdating => 'Aktualizowanie słów…';

  @override
  String get contentUpdatedBanner =>
      'Słowa zaktualizowane. Pojawią się przy następnym uruchomieniu aplikacji; nagrania już działają.';

  @override
  String get contentChecking => 'Sprawdzanie…';

  @override
  String get contentDownloading => 'Pobieranie i sprawdzanie plików…';

  @override
  String contentAvailable(int version, String size) {
    return 'Dostępna wersja $version, $size';
  }

  @override
  String get contentUpdate => 'Aktualizuj';

  @override
  String get contentUpdated =>
      'Zaktualizowano. Nowe słowa pojawią się przy następnym uruchomieniu aplikacji.';

  @override
  String get contentUpToDate => 'Aktualne';

  @override
  String get contentCheck => 'Sprawdź';

  @override
  String get contentAppTooOld => 'Zaktualizuj aplikację, by dostać nowe treści';

  @override
  String get contentStore => 'Sklep';

  @override
  String get contentFailed =>
      'Nie udało się zaktualizować. Twoje słowa się nie zmieniły.';

  @override
  String get contentRetry => 'Ponów';

  @override
  String contentTitle(int version) {
    return 'Zestaw słów · wersja $version';
  }

  @override
  String get contentAutoWifi => 'Aktualizuj automatycznie przez Wi-Fi';

  @override
  String get contentAutoWifiSub => 'Nigdy przez dane komórkowe';

  @override
  String summaryCombo(int count) {
    return 'Combo: $count z rzędu';
  }

  @override
  String get summaryNewBest => 'REKORD!';

  @override
  String summaryBestCombo(int count) {
    return 'Najlepsze combo: $count z rzędu';
  }

  @override
  String get summaryPlayAgain => 'ZAGRAJ JESZCZE';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count z 3 gwiazdek',
      many: '$count z 3 gwiazdek',
      few: '$count z 3 gwiazdek',
      one: '$count z 3 gwiazdek',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle =>
      'Czytaj prawdziwe niemieckie historie, słowo po słowie';

  @override
  String get siblingWordbit => 'Niemieckie słowo przy każdym odblokowaniu';

  @override
  String get siblingLeben => 'Zdaj test na obywatelstwo';

  @override
  String get siblingAudiobookName => 'Niemiecki audiobook';

  @override
  String get siblingAudiobook => 'Słuchaj historii według poziomu';
}
