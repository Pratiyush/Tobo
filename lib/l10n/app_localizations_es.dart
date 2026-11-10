// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get settingsLanguage => 'Idioma de la app';

  @override
  String get languageSearchHint => 'Buscar idiomas';

  @override
  String get languageSystemDefault => 'Idioma del sistema';

  @override
  String languageFollowsDevice(String language) {
    return 'Sigue tu dispositivo · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Wortschatz no pudo iniciarse.\n\n$error';
  }

  @override
  String get navWords => 'Palabras';

  @override
  String get navPractice => 'Práctica';

  @override
  String get navSettings => 'Ajustes';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Racha: $count días',
      one: 'Racha: $count día',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Puntos';

  @override
  String get homeToPractise => 'Por practicar';

  @override
  String get homeVocabulary => 'Vocabulario';

  @override
  String homeLevel(int level) {
    return 'Nivel $level';
  }

  @override
  String get homeLevelCaps => 'NIVEL';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palabras',
      one: '$count palabra',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Nivel $level: $learned de $total palabras aprendidas';
  }

  @override
  String get homeStartHere => 'Empieza aquí';

  @override
  String get homeStartHereBody =>
      'Aprende tus primeras 10 palabras con sonido y luego juega con ellas.';

  @override
  String get homeLearn10 => 'APRENDE 10 PALABRAS';

  @override
  String get homeGoal => 'Meta de hoy';

  @override
  String get homeGoalReached => '¡Meta de hoy cumplida!';

  @override
  String get homeGoalReachedBody =>
      'Hasta mañana, o sigue jugando para ganar puntos.';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$done de $goal palabras aprendidas o acertadas';
  }

  @override
  String get adsOutOfHints => 'Sin pistas';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '¿Ver un anuncio corto por $count pistas más?',
      one: '¿Ver un anuncio corto por $count pista más?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Ahora no';

  @override
  String get adsWatchAd => 'Ver anuncio';

  @override
  String adsDoublePoints(int points) {
    return 'Duplicar puntos (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Recupera tu racha de $days días',
      one: 'Recupera tu racha de $days día',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Más alemán de Pratiyush';

  @override
  String get rulePluralOnly =>
      'Sustantivo solo en plural: el plural siempre lleva die.';

  @override
  String ruleCompound(String head) {
    return 'Las palabras compuestas llevan el artículo de su última parte: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'La mayoría de los sustantivos terminados en -$suffix llevan $article.';
  }

  @override
  String get levelBeginner => 'Principiante';

  @override
  String get levelElementary => 'Elemental';

  @override
  String get levelIntermediate => 'Intermedio';

  @override
  String get levelUpperIntermediate => 'Intermedio alto';

  @override
  String get levelAllInSequence => 'Todos los niveles en orden';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · recomendado';

  @override
  String get levelOrChoose => 'O elige uno o más niveles';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palabras',
      one: '$count palabra',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Nivel $level';
  }

  @override
  String get levelsKeepProgress =>
      'Tu progreso se guarda en cada nivel, así que al cambiar nunca pierdes una palabra aprendida.';

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
      other: '$count pistas',
      one: '$count pista',
      zero: 'sin pistas',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'El tablero de hoy, igual para todos';

  @override
  String practiceDailyDone(String stars) {
    return 'Hecho hoy: $stars. Toca para compartir';
  }

  @override
  String get dddPerfect => 'Perfekt! Todos los artículos correctos.';

  @override
  String get dddTip =>
      'El color te ayuda a recordar: der negro, die rojo, das dorado.';

  @override
  String dddItsArticle(String article) {
    return 'Es $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Rápido como un rayo.';

  @override
  String get falleeKeepGoing =>
      'Sigue así: cuanto más juegues, más rápido leerás.';

  @override
  String hiveRound(int round) {
    return 'Ronda $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Palabra $n de $total';
  }

  @override
  String get hiveCoach =>
      'Toca o desliza por letras vecinas para escribir la palabra en alemán';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Quedan $count letras',
      one: 'Queda $count letra',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Pista';

  @override
  String get hiveBoardCleared => '¡Tablero completado!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count puntos',
      one: '+$count punto',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'COMPARTIR';

  @override
  String get commonDone => 'Listo';

  @override
  String get hiveNextRound => 'SIGUIENTE RONDA';

  @override
  String get commonLearn => 'Aprender';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Aprendiste $count palabras nuevas. Mañana volverán para que las practiques.',
      one:
          'Aprendiste $count palabra nueva. Mañana volverá para que la practiques.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'DESPUÉS';

  @override
  String get learnKnowIt => 'YA LA SÉ';

  @override
  String get learnFlip => 'GIRAR';

  @override
  String get learnPluralOnly => 'solo plural · siempre die';

  @override
  String learnPlural(String plural) {
    return 'pl. $plural';
  }

  @override
  String get onboardingIntro =>
      'Aprende palabras en alemán jugando. ¿Cuál es tu nivel?';

  @override
  String get onboardingStart => 'EMPEZAR';

  @override
  String get onboardingNotSure => '¿Dudas? Empieza en A1';

  @override
  String get onboardingChangeLater =>
      'Puedes cambiarlo cuando quieras en Ajustes.';

  @override
  String get practiceTitle => 'PRÁCTICA';

  @override
  String get practiceSpellDue => 'Escribe las palabras pendientes';

  @override
  String get practiceLearnFirst => 'Primero aprende algunas palabras';

  @override
  String get practiceCaughtUp => 'Todo al día. ¡Vuelve mañana!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palabras',
      one: '$count palabra',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'JUEGOS';

  @override
  String get practiceHiveSub =>
      'Desliza por el panal para escribir cada palabra';

  @override
  String get practiceDddSub => 'Elige el artículo correcto';

  @override
  String get practiceFalleeSub =>
      'Elige el significado antes de que la palabra caiga';

  @override
  String get settingsTitle => 'AJUSTES';

  @override
  String get settingsMadeBy => 'Hecho con ❤️ por Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Niveles';

  @override
  String get settingsAutoSpeak => 'Pronunciar palabras automáticamente';

  @override
  String get settingsAutoSpeakSub => 'En las tarjetas y después de responder';

  @override
  String get settingsGamesAsPractice => 'Contar los juegos como práctica';

  @override
  String get settingsGamesAsPracticeSub =>
      'Las respuestas en los juegos suben o bajan las palabras aprendidas';

  @override
  String get settingsSounds => 'Sonidos y vibración';

  @override
  String get settingsSoundsSub => 'En juegos y práctica';

  @override
  String get settingsReset => 'Restablecer progreso';

  @override
  String get settingsResetTitle => '¿Restablecer el progreso?';

  @override
  String get settingsResetBody =>
      'Esto borra todas las palabras aprendidas, tus puntos y tu racha.';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get settingsResetConfirm => 'Restablecer';

  @override
  String get settingsPrivacyChoices => 'Privacidad y anuncios';

  @override
  String get settingsPrivacyPolicy => 'Política de privacidad';

  @override
  String get settingsContact => 'Contactar con soporte';

  @override
  String get settingsLicences => 'Licencias de código abierto';

  @override
  String settingsAbout(int count) {
    return '$count palabras comunes en alemán con traducción al inglés y pronunciación grabada. Sin muro de pago: todas las palabras y los juegos son gratis.';
  }

  @override
  String get settingsMailLastError =>
      'Último error en este dispositivo (bórralo si prefieres):';

  @override
  String get spellingTitle => 'Práctica';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palabras',
      one: '$count palabra',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points puntos',
      one: '$points punto',
    );
    return 'Practicaste $_temp0 y ganaste $_temp1.';
  }

  @override
  String get spellingNounHint => 'sustantivo: incluye der, die o das';

  @override
  String get spellingAnswerIs => 'La respuesta es';

  @override
  String get commonNext => 'SIGUIENTE';

  @override
  String get spellingSkip => 'Saltar';

  @override
  String get spellingDelete => 'Borrar';

  @override
  String get spellingCheck => 'Comprobar';

  @override
  String get wordListAllLearned =>
      'Aprendiste todas las palabras de esta lista.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Quedan $count palabras en esta lista.',
      one: 'Queda $count palabra en esta lista.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'VOCABULARIO ($count)';
  }

  @override
  String get reminderBody =>
      'El Daily Hive de hoy está listo. ¿Cinco minutos de alemán?';

  @override
  String get reminderChannel => 'Recordatorio diario';

  @override
  String get reminderChannelDesc =>
      'Un recordatorio al día, a la hora que elijas.';

  @override
  String get reminderSwitch => 'Recordatorio diario';

  @override
  String reminderOnAt(String time) {
    return 'Un aviso al día a las $time';
  }

  @override
  String get reminderOff => 'Un aviso al día, a la hora que elijas';

  @override
  String get reminderBlocked =>
      'Permite las notificaciones de Wortschatz en los ajustes del teléfono para recibir un recordatorio.';

  @override
  String get reminderTime => 'Hora del recordatorio';

  @override
  String commonMastery(int level, int max) {
    return 'Dominio $level de $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent % aprendido';
  }

  @override
  String get commonListen => 'Escuchar';

  @override
  String get commonNoVoice =>
      'No hay ninguna voz en alemán instalada. Instala una en los ajustes de texto a voz de tu dispositivo.';

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
    return 'Hay nuevos datos de palabras. Actualizar ($size)';
  }

  @override
  String get contentUpdating => 'Actualizando palabras…';

  @override
  String get contentUpdatedBanner =>
      'Palabras actualizadas. Aparecerán la próxima vez que abras la app; las grabaciones ya funcionan.';

  @override
  String get contentChecking => 'Comprobando…';

  @override
  String get contentDownloading => 'Descargando y comprobando archivos…';

  @override
  String contentAvailable(int version, String size) {
    return 'Versión $version disponible, $size';
  }

  @override
  String get contentUpdate => 'Actualizar';

  @override
  String get contentUpdated =>
      'Actualizado. Las palabras nuevas aparecerán la próxima vez que abras la app.';

  @override
  String get contentUpToDate => 'Al día';

  @override
  String get contentCheck => 'Comprobar';

  @override
  String get contentAppTooOld =>
      'Actualiza la app para recibir contenido nuevo';

  @override
  String get contentStore => 'Tienda';

  @override
  String get contentFailed =>
      'No se pudo actualizar. Tus palabras no cambiaron.';

  @override
  String get contentRetry => 'Reintentar';

  @override
  String contentTitle(int version) {
    return 'Contenido de palabras · versión $version';
  }

  @override
  String get contentAutoWifi => 'Actualizar automáticamente con Wi-Fi';

  @override
  String get contentAutoWifiSub => 'Nunca con datos móviles';

  @override
  String summaryCombo(int count) {
    return 'Combo: $count seguidas';
  }

  @override
  String get summaryNewBest => '¡RÉCORD!';

  @override
  String summaryBestCombo(int count) {
    return 'Mejor combo: $count seguidas';
  }

  @override
  String get summaryPlayAgain => 'JUGAR OTRA VEZ';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de 3 estrellas',
      one: '$count de 3 estrellas',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle =>
      'Lee historias reales en alemán, palabra por palabra';

  @override
  String get siblingWordbit => 'Una palabra en alemán cada vez que desbloqueas';

  @override
  String get siblingLeben => 'Aprueba el examen de ciudadanía';

  @override
  String get siblingAudiobookName => 'Audiolibro en alemán';

  @override
  String get siblingAudiobook => 'Escucha historias por nivel';
}
