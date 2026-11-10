// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get settingsLanguage => 'Jezik aplikacije';

  @override
  String get languageSearchHint => 'Traži jezike';

  @override
  String get languageSystemDefault => 'Jezik sustava';

  @override
  String languageFollowsDevice(String language) {
    return 'Prema uređaju · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Aplikacija Wortschatz nije se mogla pokrenuti.\n\n$error';
  }

  @override
  String get navWords => 'Riječi';

  @override
  String get navPractice => 'Vježbanje';

  @override
  String get navSettings => 'Postavke';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Niz: $count dana',
      few: 'Niz: $count dana',
      one: 'Niz: $count dan',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Bodovi';

  @override
  String get homeToPractise => 'Za vježbu';

  @override
  String get homeVocabulary => 'Vokabular';

  @override
  String homeLevel(int level) {
    return 'Razina $level';
  }

  @override
  String get homeLevelCaps => 'RAZINA';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count riječi',
      few: '$count riječi',
      one: '$count riječ',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Razina $level: naučeno $learned od $total riječi';
  }

  @override
  String get homeStartHere => 'Počni ovdje';

  @override
  String get homeStartHereBody =>
      'Nauči svojih prvih 10 riječi uz zvuk, pa ih isprobaj u igrama.';

  @override
  String get homeLearn10 => 'NAUČI 10 RIJEČI';

  @override
  String get homeGoal => 'Današnji cilj';

  @override
  String get homeGoalReached => 'Današnji cilj ostvaren!';

  @override
  String get homeGoalReachedBody =>
      'Vidimo se sutra, ili igraj dalje i skupljaj bodove.';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$done od $goal riječi naučeno ili točno odgovoreno';
  }

  @override
  String get adsOutOfHints => 'Nema više savjeta';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pogledati kratki oglas za još $count savjeta?',
      few: 'Pogledati kratki oglas za još $count savjeta?',
      one: 'Pogledati kratki oglas za još $count savjet?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Ne sada';

  @override
  String get adsWatchAd => 'Pogledaj oglas';

  @override
  String adsDoublePoints(int points) {
    return 'Dvostruki bodovi (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Vrati svoj niz od $days dana',
      few: 'Vrati svoj niz od $days dana',
      one: 'Vrati svoj niz od $days dana',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Još njemačkog od Pratiyusha';

  @override
  String get rulePluralOnly =>
      'Imenica samo u množini: množina uvijek ima die.';

  @override
  String ruleCompound(String head) {
    return 'Složenice imaju član svog zadnjeg dijela: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'Većina imenica na -$suffix ima $article.';
  }

  @override
  String get levelBeginner => 'Početna razina';

  @override
  String get levelElementary => 'Osnovna razina';

  @override
  String get levelIntermediate => 'Srednja razina';

  @override
  String get levelUpperIntermediate => 'Viša srednja razina';

  @override
  String get levelAllInSequence => 'Sve razine redom';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · preporučeno';

  @override
  String get levelOrChoose => 'Ili odaberi jednu ili više razina';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count riječi',
      few: '$count riječi',
      one: '$count riječ',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Razina $level';
  }

  @override
  String get levelsKeepProgress =>
      'Napredak se čuva za svaku razinu, pa promjenom nikad ne gubiš naučenu riječ.';

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
      other: '$count savjeta',
      few: '$count savjeta',
      one: '$count savjet',
      zero: 'bez savjeta',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'Današnja ploča, ista za sve';

  @override
  String practiceDailyDone(String stars) {
    return 'Danas gotovo: $stars. Dodirni za dijeljenje';
  }

  @override
  String get dddPerfect => 'Perfekt! Svi članovi točni.';

  @override
  String get dddTip =>
      'Boja pomaže pamćenju: der crna, die crvena, das zlatna.';

  @override
  String dddItsArticle(String article) {
    return 'Točno je $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Munjevito brzo.';

  @override
  String get falleeKeepGoing => 'Samo naprijed: što više igraš, to brže čitaš.';

  @override
  String hiveRound(int round) {
    return 'Runda $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Riječ $n od $total';
  }

  @override
  String get hiveCoach =>
      'Dodirni ili povuci preko susjednih slova i složi njemačku riječ';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Još $count slova',
      few: 'Još $count slova',
      one: 'Još $count slovo',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Savjet';

  @override
  String get hiveBoardCleared => 'Ploča riješena!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count bodova',
      few: '+$count boda',
      one: '+$count bod',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'PODIJELI';

  @override
  String get commonDone => 'Gotovo';

  @override
  String get hiveNextRound => 'SLJEDEĆA RUNDA';

  @override
  String get commonLearn => 'Učenje';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Znaš $count novih riječi. Sutra se vraćaju na vježbu.',
      few: 'Znaš $count nove riječi. Sutra se vraćaju na vježbu.',
      one: 'Znaš $count novu riječ. Sutra se vraća na vježbu.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'KASNIJE';

  @override
  String get learnKnowIt => 'ZNAM';

  @override
  String get learnFlip => 'OKRENI';

  @override
  String get learnPluralOnly => 'samo množina · uvijek die';

  @override
  String learnPlural(String plural) {
    return 'mn. $plural';
  }

  @override
  String get onboardingIntro =>
      'Uči njemačke riječi kroz igru. Koja je tvoja razina?';

  @override
  String get onboardingStart => 'KRENI';

  @override
  String get onboardingNotSure => 'Ne znaš? Počni od A1';

  @override
  String get onboardingChangeLater =>
      'To možeš promijeniti bilo kad u Postavkama.';

  @override
  String get practiceTitle => 'VJEŽBANJE';

  @override
  String get practiceSpellDue => 'Napiši riječi koje su na redu';

  @override
  String get practiceLearnFirst => 'Najprije nauči nekoliko riječi';

  @override
  String get practiceCaughtUp => 'Sve je gotovo. Vrati se sutra!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count riječi',
      few: '$count riječi',
      one: '$count riječ',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'IGRE';

  @override
  String get practiceHiveSub => 'Prijeđi prstom preko saća i složi svaku riječ';

  @override
  String get practiceDddSub => 'Odaberi pravi član';

  @override
  String get practiceFalleeSub => 'Odaberi značenje prije nego riječ padne';

  @override
  String get settingsTitle => 'POSTAVKE';

  @override
  String get settingsMadeBy => 'S ❤️ izradio Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Razine';

  @override
  String get settingsAutoSpeak => 'Automatski izgovaraj riječi';

  @override
  String get settingsAutoSpeakSub => 'Na karticama i nakon odgovora';

  @override
  String get settingsGamesAsPractice => 'Računaj igre kao vježbanje';

  @override
  String get settingsGamesAsPracticeSub =>
      'Odgovori u igrama pomiču naučene riječi gore ili dolje';

  @override
  String get settingsSounds => 'Zvukovi i vibracija';

  @override
  String get settingsSoundsSub => 'U igrama i vježbanju';

  @override
  String get settingsReset => 'Poništi napredak';

  @override
  String get settingsResetTitle => 'Poništiti napredak?';

  @override
  String get settingsResetBody =>
      'Time se brišu sve naučene riječi, tvoji bodovi i niz.';

  @override
  String get commonCancel => 'Odustani';

  @override
  String get settingsResetConfirm => 'Poništi';

  @override
  String get settingsPrivacyChoices => 'Privatnost i oglasi';

  @override
  String get settingsPrivacyPolicy => 'Pravila privatnosti';

  @override
  String get settingsContact => 'Kontaktiraj podršku';

  @override
  String get settingsLicences => 'Licence otvorenog koda';

  @override
  String settingsAbout(int count) {
    return 'Česte njemačke riječi ($count) s engleskim prijevodima i snimljenim izgovorom. Ništa se ne plaća: sve riječi i igre su besplatne.';
  }

  @override
  String get settingsMailLastError =>
      'Zadnja pogreška na ovom uređaju (slobodno je obriši):';

  @override
  String get spellingTitle => 'Vježbanje';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count riječi',
      few: '$count riječi',
      one: '$count riječ',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points bodova',
      few: '$points boda',
      one: '$points bod',
    );
    return 'Uvježbano: $_temp0, skupljeno: $_temp1.';
  }

  @override
  String get spellingNounHint => 'imenica — s der, die ili das';

  @override
  String get spellingAnswerIs => 'Točan odgovor je';

  @override
  String get commonNext => 'DALJE';

  @override
  String get spellingSkip => 'Preskoči';

  @override
  String get spellingDelete => 'Obriši';

  @override
  String get spellingCheck => 'Provjeri';

  @override
  String get wordListAllLearned => 'Znaš već svaku riječ s ovog popisa.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Na ovom popisu ostaje još $count riječi.',
      few: 'Na ovom popisu ostaju još $count riječi.',
      one: 'Na ovom popisu ostaje još $count riječ.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'VOKABULAR ($count)';
  }

  @override
  String get reminderBody =>
      'Današnji Daily Hive je spreman. Pet minuta njemačkog?';

  @override
  String get reminderChannel => 'Dnevni podsjetnik';

  @override
  String get reminderChannelDesc =>
      'Jedan podsjetnik dnevno, u vrijeme koje odabereš.';

  @override
  String get reminderSwitch => 'Dnevni podsjetnik';

  @override
  String reminderOnAt(String time) {
    return 'Jedan mali poticaj dnevno u $time';
  }

  @override
  String get reminderOff => 'Jedan mali poticaj dnevno, kad ti odgovara';

  @override
  String get reminderBlocked =>
      'Dopusti obavijesti za Wortschatz u postavkama telefona da dobiješ podsjetnik.';

  @override
  String get reminderTime => 'Vrijeme podsjetnika';

  @override
  String commonMastery(int level, int max) {
    return 'Savladanost $level od $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return 'Naučeno $percent %';
  }

  @override
  String get commonListen => 'Poslušaj';

  @override
  String get commonNoVoice =>
      'Nije instaliran njemački glas. Dodaj ga u postavkama pretvaranja teksta u govor na uređaju.';

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
    return 'Novi podaci o riječima. Ažuriraj ($size)';
  }

  @override
  String get contentUpdating => 'Ažuriranje riječi…';

  @override
  String get contentUpdatedBanner =>
      'Riječi su ažurirane. Pojavit će se kad sljedeći put otvoriš aplikaciju; snimke već rade.';

  @override
  String get contentChecking => 'Provjera…';

  @override
  String get contentDownloading => 'Preuzimanje i provjera datoteka…';

  @override
  String contentAvailable(int version, String size) {
    return 'Dostupna verzija $version, $size';
  }

  @override
  String get contentUpdate => 'Ažuriraj';

  @override
  String get contentUpdated =>
      'Ažurirano. Nove riječi pojavit će se kad sljedeći put otvoriš aplikaciju.';

  @override
  String get contentUpToDate => 'Sve je ažurno';

  @override
  String get contentCheck => 'Provjeri';

  @override
  String get contentAppTooOld => 'Ažuriraj aplikaciju za novi sadržaj';

  @override
  String get contentStore => 'Trgovina';

  @override
  String get contentFailed =>
      'Ažuriranje nije uspjelo. Tvoje riječi su nepromijenjene.';

  @override
  String get contentRetry => 'Pokušaj opet';

  @override
  String contentTitle(int version) {
    return 'Sadržaj riječi · verzija $version';
  }

  @override
  String get contentAutoWifi => 'Automatski ažuriraj na Wi-Fi mreži';

  @override
  String get contentAutoWifiSub => 'Nikad na mobilnim podacima';

  @override
  String summaryCombo(int count) {
    return 'Kombo: $count zaredom';
  }

  @override
  String get summaryNewBest => 'NOVI REKORD!';

  @override
  String summaryBestCombo(int count) {
    return 'Najbolji kombo: $count zaredom';
  }

  @override
  String get summaryPlayAgain => 'IGRAJ OPET';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count od 3 zvjezdice',
      few: '$count od 3 zvjezdice',
      one: '$count od 3 zvjezdice',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'Čitaj prave njemačke priče, riječ po riječ';

  @override
  String get siblingWordbit => 'Njemačka riječ pri svakom otključavanju';

  @override
  String get siblingLeben => 'Položi test za državljanstvo';

  @override
  String get siblingAudiobookName => 'Njemačka audioknjiga';

  @override
  String get siblingAudiobook => 'Slušaj priče po razinama';
}
