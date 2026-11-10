// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get settingsLanguage => 'Langue de l’app';

  @override
  String get languageSearchHint => 'Rechercher une langue';

  @override
  String get languageSystemDefault => 'Langue du système';

  @override
  String languageFollowsDevice(String language) {
    return 'Suit ton appareil · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz n’a pas pu démarrer.\n\n$error';
  }

  @override
  String get navWords => 'Mots';

  @override
  String get navPractice => 'Entraînement';

  @override
  String get navSettings => 'Réglages';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Série : $count jours',
      one: 'Série : $count jour',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Points';

  @override
  String get homeToPractise => 'À réviser';

  @override
  String get homeVocabulary => 'Vocabulaire';

  @override
  String homeLevel(int level) {
    return 'Niveau $level';
  }

  @override
  String get homeLevelCaps => 'NIVEAU';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mots',
      one: '$count mot',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Niveau $level : $learned mots appris sur $total';
  }

  @override
  String get homeStartHere => 'Commence ici';

  @override
  String get homeStartHereBody =>
      'Apprends tes 10 premiers mots avec le son, puis retrouve-les dans les jeux.';

  @override
  String get homeLearn10 => 'APPRENDRE 10 MOTS';

  @override
  String get homeGoal => 'Objectif du jour';

  @override
  String get homeGoalReached => 'Objectif atteint !';

  @override
  String get homeGoalReachedBody =>
      'À demain, ou continue à jouer pour gagner des points.';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$done mots sur $goal appris ou réussis';
  }

  @override
  String get adsOutOfHints => 'Plus aucun indice';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Regarder une courte pub pour $count indices de plus ?',
      one: 'Regarder une courte pub pour $count indice de plus ?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Plus tard';

  @override
  String get adsWatchAd => 'Voir la pub';

  @override
  String adsDoublePoints(int points) {
    return 'Doubler les points (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Récupère ta série de $days jours',
      one: 'Récupère ta série de $days jour',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Plus d’allemand par Pratiyush';

  @override
  String get rulePluralOnly =>
      'Nom seulement au pluriel : le pluriel prend toujours die.';

  @override
  String ruleCompound(String head) {
    return 'Les mots composés prennent l’article de leur dernière partie : $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'La plupart des noms en -$suffix prennent $article.';
  }

  @override
  String get levelBeginner => 'Débutant';

  @override
  String get levelElementary => 'Élémentaire';

  @override
  String get levelIntermediate => 'Intermédiaire';

  @override
  String get levelUpperIntermediate => 'Intermédiaire avancé';

  @override
  String get levelAllInSequence => 'Tous les niveaux à la suite';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · recommandé';

  @override
  String get levelOrChoose => 'Ou choisis un ou plusieurs niveaux';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mots',
      one: '$count mot',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Niveau $level';
  }

  @override
  String get levelsKeepProgress =>
      'Ta progression est gardée pour chaque niveau : en changeant, tu ne perds jamais un mot appris.';

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
      other: '$count indices',
      one: '$count indice',
      zero: 'aucun indice',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'La grille du jour, la même pour tous';

  @override
  String practiceDailyDone(String stars) {
    return 'Fait aujourd’hui : $stars. Touche pour partager';
  }

  @override
  String get dddPerfect => 'Perfekt! Tous les articles sont justes.';

  @override
  String get dddTip =>
      'La couleur aide à retenir : der noir, die rouge, das doré.';

  @override
  String dddItsArticle(String article) {
    return 'C’est $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Rapide comme l’éclair.';

  @override
  String get falleeKeepGoing => 'Continue : plus tu joues, plus tu lis vite.';

  @override
  String hiveRound(int round) {
    return 'Manche $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Mot $n sur $total';
  }

  @override
  String get hiveCoach =>
      'Touche ou glisse sur des lettres voisines pour écrire le mot allemand';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Encore $count lettres',
      one: 'Encore $count lettre',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Indice';

  @override
  String get hiveBoardCleared => 'Grille terminée !';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count points',
      one: '+$count point',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'PARTAGER';

  @override
  String get commonDone => 'Terminé';

  @override
  String get hiveNextRound => 'MANCHE SUIVANTE';

  @override
  String get commonLearn => 'Apprendre';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Tu as appris $count nouveaux mots. Ils reviendront demain pour une révision.',
      one:
          'Tu as appris $count nouveau mot. Il reviendra demain pour une révision.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'PLUS TARD';

  @override
  String get learnKnowIt => 'JE SAIS';

  @override
  String get learnFlip => 'RETOURNER';

  @override
  String get learnPluralOnly => 'pluriel seulement · toujours die';

  @override
  String learnPlural(String plural) {
    return 'pl. $plural';
  }

  @override
  String get onboardingIntro =>
      'Apprends des mots allemands en jouant. Quel est ton niveau ?';

  @override
  String get onboardingStart => 'COMMENCER';

  @override
  String get onboardingNotSure => 'Tu hésites ? Commence en A1';

  @override
  String get onboardingChangeLater =>
      'Tu peux changer ça à tout moment dans les Réglages.';

  @override
  String get practiceTitle => 'ENTRAÎNEMENT';

  @override
  String get practiceSpellDue => 'Écris les mots à réviser';

  @override
  String get practiceLearnFirst => 'Apprends d’abord quelques mots';

  @override
  String get practiceCaughtUp => 'Tout est à jour. Reviens demain !';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mots',
      one: '$count mot',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'JEUX';

  @override
  String get practiceHiveSub =>
      'Glisse sur les alvéoles pour écrire chaque mot';

  @override
  String get practiceDddSub => 'Choisis le bon article';

  @override
  String get practiceFalleeSub =>
      'Choisis le sens avant que le mot ne touche le sol';

  @override
  String get settingsTitle => 'RÉGLAGES';

  @override
  String get settingsMadeBy => 'Fait avec ❤️ par Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Niveaux';

  @override
  String get settingsAutoSpeak => 'Prononcer les mots automatiquement';

  @override
  String get settingsAutoSpeakSub => 'Sur les cartes et après les réponses';

  @override
  String get settingsGamesAsPractice => 'Les jeux comptent comme révision';

  @override
  String get settingsGamesAsPracticeSub =>
      'Tes réponses dans les jeux font monter ou descendre les mots appris';

  @override
  String get settingsSounds => 'Sons et vibrations';

  @override
  String get settingsSoundsSub => 'Dans les jeux et l’entraînement';

  @override
  String get settingsReset => 'Réinitialiser la progression';

  @override
  String get settingsResetTitle => 'Réinitialiser la progression ?';

  @override
  String get settingsResetBody =>
      'Cela efface tous les mots appris, tes points et ta série.';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get settingsResetConfirm => 'Réinitialiser';

  @override
  String get settingsPrivacyChoices => 'Confidentialité et pubs';

  @override
  String get settingsPrivacyPolicy => 'Politique de confidentialité';

  @override
  String get settingsContact => 'Contacter le support';

  @override
  String get settingsLicences => 'Licences open source';

  @override
  String settingsAbout(int count) {
    return '$count mots allemands courants avec traductions en anglais et prononciations enregistrées. Pas de paywall : chaque mot et chaque jeu est gratuit.';
  }

  @override
  String get settingsMailLastError =>
      'Dernière erreur sur cet appareil (supprime-la si tu préfères) :';

  @override
  String get spellingTitle => 'Entraînement';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mots',
      one: '$count mot',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points points',
      one: '$points point',
    );
    return 'Tu as révisé $_temp0 et gagné $_temp1.';
  }

  @override
  String get spellingNounHint => 'nom — avec der, die ou das';

  @override
  String get spellingAnswerIs => 'La réponse est';

  @override
  String get commonNext => 'SUIVANT';

  @override
  String get spellingSkip => 'Passer';

  @override
  String get spellingDelete => 'Effacer';

  @override
  String get spellingCheck => 'Vérifier';

  @override
  String get wordListAllLearned => 'Tu as appris tous les mots de cette liste.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Il reste $count mots dans cette liste.',
      one: 'Il reste $count mot dans cette liste.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'VOCABULAIRE ($count)';
  }

  @override
  String get reminderBody =>
      'Le Daily Hive du jour est prêt. Cinq minutes d’allemand ?';

  @override
  String get reminderChannel => 'Rappel quotidien';

  @override
  String get reminderChannelDesc =>
      'Un rappel par jour, à l’heure que tu choisis.';

  @override
  String get reminderSwitch => 'Rappel quotidien';

  @override
  String reminderOnAt(String time) {
    return 'Un petit rappel par jour à $time';
  }

  @override
  String get reminderOff => 'Un petit rappel par jour, à l’heure de ton choix';

  @override
  String get reminderBlocked =>
      'Autorise les notifications de Wortschatz dans les réglages du téléphone pour recevoir un rappel.';

  @override
  String get reminderTime => 'Heure du rappel';

  @override
  String commonMastery(int level, int max) {
    return 'Maîtrise $level sur $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent % appris';
  }

  @override
  String get commonListen => 'Écouter';

  @override
  String get commonNoVoice =>
      'Aucune voix allemande installée. Ajoutes-en une dans les réglages de synthèse vocale de ton appareil.';

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
    return 'Nouvelles données de mots disponibles. Mettre à jour ($size)';
  }

  @override
  String get contentUpdating => 'Mise à jour des mots…';

  @override
  String get contentUpdatedBanner =>
      'Mots mis à jour. Ils apparaîtront à la prochaine ouverture de l’app ; les enregistrements marchent déjà.';

  @override
  String get contentChecking => 'Vérification…';

  @override
  String get contentDownloading =>
      'Téléchargement et vérification des fichiers…';

  @override
  String contentAvailable(int version, String size) {
    return 'Version $version disponible, $size';
  }

  @override
  String get contentUpdate => 'Mettre à jour';

  @override
  String get contentUpdated =>
      'Mis à jour. Les nouveaux mots apparaîtront à la prochaine ouverture de l’app.';

  @override
  String get contentUpToDate => 'À jour';

  @override
  String get contentCheck => 'Vérifier';

  @override
  String get contentAppTooOld =>
      'Mets à jour l’app pour avoir du nouveau contenu';

  @override
  String get contentStore => 'Store';

  @override
  String get contentFailed =>
      'Échec de la mise à jour. Tes mots n’ont pas changé.';

  @override
  String get contentRetry => 'Réessayer';

  @override
  String contentTitle(int version) {
    return 'Contenu des mots · version $version';
  }

  @override
  String get contentAutoWifi => 'Mettre à jour automatiquement en Wi-Fi';

  @override
  String get contentAutoWifiSub => 'Jamais en données mobiles';

  @override
  String summaryCombo(int count) {
    return 'Combo : $count d’affilée';
  }

  @override
  String get summaryNewBest => 'RECORD !';

  @override
  String summaryBestCombo(int count) {
    return 'Meilleur combo : $count d’affilée';
  }

  @override
  String get summaryPlayAgain => 'REJOUER';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count étoiles sur 3',
      one: '$count étoile sur 3',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'Lis de vraies histoires en allemand, mot à mot';

  @override
  String get siblingWordbit => 'Un mot allemand à chaque déverrouillage';

  @override
  String get siblingLeben => 'Réussis le test de naturalisation';

  @override
  String get siblingAudiobookName => 'Livre audio en allemand';

  @override
  String get siblingAudiobook => 'Écoute des histoires par niveau';
}
