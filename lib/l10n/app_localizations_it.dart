// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get settingsLanguage => 'Lingua dell’app';

  @override
  String get languageSearchHint => 'Cerca lingue';

  @override
  String get languageSystemDefault => 'Lingua di sistema';

  @override
  String languageFollowsDevice(String language) {
    return 'Segue il dispositivo · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Impossibile avviare Wortschatz.\n\n$error';
  }

  @override
  String get navWords => 'Parole';

  @override
  String get navPractice => 'Allenamento';

  @override
  String get navSettings => 'Impostazioni';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Serie: $count giorni',
      one: 'Serie: $count giorno',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Punti';

  @override
  String get homeToPractise => 'Da ripassare';

  @override
  String get homeVocabulary => 'Vocabolario';

  @override
  String homeLevel(int level) {
    return 'Livello $level';
  }

  @override
  String get homeLevelCaps => 'LIVELLO';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count parole',
      one: '$count parola',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Livello $level: $learned parole imparate su $total';
  }

  @override
  String get homeStartHere => 'Inizia da qui';

  @override
  String get homeStartHereBody =>
      'Impara le tue prime 10 parole con l’audio, poi usale nei giochi.';

  @override
  String get homeLearn10 => 'IMPARA 10 PAROLE';

  @override
  String get homeGoal => 'Obiettivo di oggi';

  @override
  String get homeGoalReached => 'Obiettivo raggiunto!';

  @override
  String get homeGoalReachedBody =>
      'A domani, oppure continua a giocare per fare punti.';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$done parole su $goal imparate o indovinate';
  }

  @override
  String get adsOutOfHints => 'Indizi finiti';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Guardare un breve annuncio per $count indizi in più?',
      one: 'Guardare un breve annuncio per $count indizio in più?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Non ora';

  @override
  String get adsWatchAd => 'Vedi annuncio';

  @override
  String adsDoublePoints(int points) {
    return 'Raddoppia i punti (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Recupera la tua serie di $days giorni',
      one: 'Recupera la tua serie di $days giorno',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Altro tedesco da Pratiyush';

  @override
  String get rulePluralOnly =>
      'Sostantivo solo plurale: al plurale si usa sempre die.';

  @override
  String ruleCompound(String head) {
    return 'Le parole composte prendono l’articolo dell’ultima parte: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'La maggior parte dei nomi in -$suffix prende $article.';
  }

  @override
  String get levelBeginner => 'Principiante';

  @override
  String get levelElementary => 'Elementare';

  @override
  String get levelIntermediate => 'Intermedio';

  @override
  String get levelUpperIntermediate => 'Intermedio superiore';

  @override
  String get levelAllInSequence => 'Tutti i livelli in ordine';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · consigliato';

  @override
  String get levelOrChoose => 'Oppure scegli uno o più livelli';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count parole',
      one: '$count parola',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Livello $level';
  }

  @override
  String get levelsKeepProgress =>
      'I tuoi progressi restano salvati per ogni livello: cambiando non perdi mai una parola imparata.';

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
      other: '$count indizi',
      one: '$count indizio',
      zero: 'nessun indizio',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'La griglia di oggi, uguale per tutti';

  @override
  String practiceDailyDone(String stars) {
    return 'Fatto oggi: $stars. Tocca per condividere';
  }

  @override
  String get dddPerfect => 'Perfekt! Tutti gli articoli giusti.';

  @override
  String get dddTip =>
      'Il colore aiuta a ricordare: der nero, die rosso, das oro.';

  @override
  String dddItsArticle(String article) {
    return 'È $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Veloce come un fulmine.';

  @override
  String get falleeKeepGoing => 'Continua così: più giochi, più leggi veloce.';

  @override
  String hiveRound(int round) {
    return 'Round $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Parola $n di $total';
  }

  @override
  String get hiveCoach =>
      'Tocca o trascina sulle lettere vicine per scrivere la parola tedesca';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mancano $count lettere',
      one: 'Manca $count lettera',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Indizio';

  @override
  String get hiveBoardCleared => 'Griglia completata!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count punti',
      one: '+$count punto',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'CONDIVIDI';

  @override
  String get commonDone => 'Fatto';

  @override
  String get hiveNextRound => 'PROSSIMO ROUND';

  @override
  String get commonLearn => 'Impara';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Hai imparato $count parole nuove. Domani torneranno per il ripasso.',
      one: 'Hai imparato $count parola nuova. Domani tornerà per il ripasso.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'DOPO';

  @override
  String get learnKnowIt => 'LA SO';

  @override
  String get learnFlip => 'GIRA';

  @override
  String get learnPluralOnly => 'solo plurale · sempre die';

  @override
  String learnPlural(String plural) {
    return 'pl. $plural';
  }

  @override
  String get onboardingIntro =>
      'Impara parole tedesche giocando. Qual è il tuo livello?';

  @override
  String get onboardingStart => 'INIZIA';

  @override
  String get onboardingNotSure => 'Nel dubbio, inizia da A1';

  @override
  String get onboardingChangeLater =>
      'Puoi cambiarlo quando vuoi nelle Impostazioni.';

  @override
  String get practiceTitle => 'ALLENAMENTO';

  @override
  String get practiceSpellDue => 'Scrivi le parole da ripassare';

  @override
  String get practiceLearnFirst => 'Prima impara qualche parola';

  @override
  String get practiceCaughtUp => 'Tutto in pari. Torna domani!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count parole',
      one: '$count parola',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'GIOCHI';

  @override
  String get practiceHiveSub => 'Scorri sul favo per scrivere ogni parola';

  @override
  String get practiceDddSub => 'Scegli l’articolo giusto';

  @override
  String get practiceFalleeSub =>
      'Scegli il significato prima che la parola atterri';

  @override
  String get settingsTitle => 'IMPOSTAZIONI';

  @override
  String get settingsMadeBy => 'Fatto con ❤️ da Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Livelli';

  @override
  String get settingsAutoSpeak => 'Pronuncia automatica delle parole';

  @override
  String get settingsAutoSpeakSub => 'Sulle flashcard e dopo le risposte';

  @override
  String get settingsGamesAsPractice => 'I giochi contano come ripasso';

  @override
  String get settingsGamesAsPracticeSub =>
      'Le risposte nei giochi fanno salire o scendere le parole imparate';

  @override
  String get settingsSounds => 'Suoni e vibrazione';

  @override
  String get settingsSoundsSub => 'Nei giochi e nell’allenamento';

  @override
  String get settingsReset => 'Azzera i progressi';

  @override
  String get settingsResetTitle => 'Azzerare i progressi?';

  @override
  String get settingsResetBody =>
      'Verranno cancellate tutte le parole imparate, i tuoi punti e la tua serie.';

  @override
  String get commonCancel => 'Annulla';

  @override
  String get settingsResetConfirm => 'Azzera';

  @override
  String get settingsPrivacyChoices => 'Privacy e annunci';

  @override
  String get settingsPrivacyPolicy => 'Informativa sulla privacy';

  @override
  String get settingsContact => 'Contatta l’assistenza';

  @override
  String get settingsLicences => 'Licenze open source';

  @override
  String settingsAbout(int count) {
    return '$count parole tedesche comuni con traduzione in inglese e pronuncia registrata. Nessun paywall: ogni parola e ogni gioco sono gratis.';
  }

  @override
  String get settingsMailLastError =>
      'Ultimo errore su questo dispositivo (cancellalo se preferisci):';

  @override
  String get spellingTitle => 'Allenamento';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count parole',
      one: '$count parola',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points punti',
      one: '$points punto',
    );
    return 'Hai ripassato $_temp0 e guadagnato $_temp1.';
  }

  @override
  String get spellingNounHint => 'sostantivo: con der, die o das';

  @override
  String get spellingAnswerIs => 'La risposta è';

  @override
  String get commonNext => 'AVANTI';

  @override
  String get spellingSkip => 'Salta';

  @override
  String get spellingDelete => 'Cancella';

  @override
  String get spellingCheck => 'Verifica';

  @override
  String get wordListAllLearned =>
      'Hai imparato tutte le parole di questa lista.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'In questa lista mancano ancora $count parole.',
      one: 'In questa lista manca ancora $count parola.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'VOCABOLARIO ($count)';
  }

  @override
  String get reminderBody =>
      'Il Daily Hive di oggi è pronto. Cinque minuti di tedesco?';

  @override
  String get reminderChannel => 'Promemoria giornaliero';

  @override
  String get reminderChannelDesc =>
      'Un promemoria al giorno, all’ora che scegli tu.';

  @override
  String get reminderSwitch => 'Promemoria giornaliero';

  @override
  String reminderOnAt(String time) {
    return 'Un promemoria al giorno alle $time';
  }

  @override
  String get reminderOff => 'Un promemoria al giorno, all’ora che preferisci';

  @override
  String get reminderBlocked =>
      'Consenti le notifiche di Wortschatz nelle impostazioni del telefono per ricevere un promemoria.';

  @override
  String get reminderTime => 'Ora del promemoria';

  @override
  String commonMastery(int level, int max) {
    return 'Padronanza $level su $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent% imparato';
  }

  @override
  String get commonListen => 'Ascolta';

  @override
  String get commonNoVoice =>
      'Nessuna voce tedesca installata. Aggiungine una nelle impostazioni di sintesi vocale del dispositivo.';

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
    return 'Nuovi dati delle parole disponibili. Aggiorna ($size)';
  }

  @override
  String get contentUpdating => 'Aggiornamento parole…';

  @override
  String get contentUpdatedBanner =>
      'Parole aggiornate. Compariranno alla prossima apertura dell’app; le registrazioni funzionano già.';

  @override
  String get contentChecking => 'Verifica in corso…';

  @override
  String get contentDownloading => 'Download e verifica dei file…';

  @override
  String contentAvailable(int version, String size) {
    return 'Versione $version disponibile, $size';
  }

  @override
  String get contentUpdate => 'Aggiorna';

  @override
  String get contentUpdated =>
      'Aggiornato. Le nuove parole compariranno alla prossima apertura dell’app.';

  @override
  String get contentUpToDate => 'Tutto aggiornato';

  @override
  String get contentCheck => 'Verifica';

  @override
  String get contentAppTooOld => 'Aggiorna l’app per avere nuovi contenuti';

  @override
  String get contentStore => 'Store';

  @override
  String get contentFailed =>
      'Aggiornamento non riuscito. Le tue parole non sono cambiate.';

  @override
  String get contentRetry => 'Riprova';

  @override
  String contentTitle(int version) {
    return 'Contenuto parole · versione $version';
  }

  @override
  String get contentAutoWifi => 'Aggiorna automaticamente con il Wi-Fi';

  @override
  String get contentAutoWifiSub => 'Mai con i dati mobili';

  @override
  String summaryCombo(int count) {
    return 'Combo: $count di fila';
  }

  @override
  String get summaryNewBest => 'RECORD!';

  @override
  String summaryBestCombo(int count) {
    return 'Combo migliore: $count di fila';
  }

  @override
  String get summaryPlayAgain => 'GIOCA ANCORA';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stelle su 3',
      one: '$count stella su 3',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'Leggi vere storie in tedesco, parola per parola';

  @override
  String get siblingWordbit => 'Una parola tedesca a ogni sblocco';

  @override
  String get siblingLeben => 'Supera il test di cittadinanza';

  @override
  String get siblingAudiobookName => 'Audiolibro in tedesco';

  @override
  String get siblingAudiobook => 'Ascolta storie per livello';
}
