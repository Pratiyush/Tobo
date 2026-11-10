// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get settingsLanguage => 'Idioma do app';

  @override
  String get languageSearchHint => 'Buscar idiomas';

  @override
  String get languageSystemDefault => 'Padrão do sistema';

  @override
  String languageFollowsDevice(String language) {
    return 'Segue o seu aparelho · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Não foi possível iniciar o Wortschatz.\n\n$error';
  }

  @override
  String get navWords => 'Palavras';

  @override
  String get navPractice => 'Prática';

  @override
  String get navSettings => 'Ajustes';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sequência: $count dias',
      one: 'Sequência: $count dia',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Pontos';

  @override
  String get homeToPractise => 'Para praticar';

  @override
  String get homeVocabulary => 'Vocabulário';

  @override
  String homeLevel(int level) {
    return 'Nível $level';
  }

  @override
  String get homeLevelCaps => 'NÍVEL';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palavras',
      one: '$count palavra',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Nível $level: $learned de $total palavras aprendidas';
  }

  @override
  String get homeStartHere => 'Comece aqui';

  @override
  String get homeStartHereBody =>
      'Aprenda suas primeiras 10 palavras com áudio e depois jogue com elas.';

  @override
  String get homeLearn10 => 'APRENDA 10 PALAVRAS';

  @override
  String get homeGoal => 'Meta de hoje';

  @override
  String get homeGoalReached => 'Meta de hoje cumprida!';

  @override
  String get homeGoalReachedBody =>
      'Até amanhã, ou continue jogando para ganhar pontos.';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$done de $goal palavras aprendidas ou acertadas';
  }

  @override
  String get adsOutOfHints => 'Sem dicas';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ver um anúncio curto para ganhar mais $count dicas?',
      one: 'Ver um anúncio curto para ganhar mais $count dica?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Agora não';

  @override
  String get adsWatchAd => 'Ver anúncio';

  @override
  String adsDoublePoints(int points) {
    return 'Dobrar pontos (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Recuperar sua sequência de $days dias',
      one: 'Recuperar sua sequência de $days dia',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Mais alemão do Pratiyush';

  @override
  String get rulePluralOnly =>
      'Substantivo só no plural: o plural sempre leva die.';

  @override
  String ruleCompound(String head) {
    return 'Palavras compostas usam o artigo da última parte: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'A maioria dos substantivos terminados em -$suffix leva $article.';
  }

  @override
  String get levelBeginner => 'Iniciante';

  @override
  String get levelElementary => 'Básico';

  @override
  String get levelIntermediate => 'Intermediário';

  @override
  String get levelUpperIntermediate => 'Intermediário avançado';

  @override
  String get levelAllInSequence => 'Todos os níveis em ordem';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · recomendado';

  @override
  String get levelOrChoose => 'Ou escolha um ou mais níveis';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palavras',
      one: '$count palavra',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Nível $level';
  }

  @override
  String get levelsKeepProgress =>
      'Seu progresso fica salvo em cada nível, então trocar nunca faz você perder uma palavra aprendida.';

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
      other: '$count dicas',
      one: '$count dica',
      zero: 'nenhuma dica',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'O tabuleiro de hoje, igual para todos';

  @override
  String practiceDailyDone(String stars) {
    return 'Feito hoje: $stars. Toque para compartilhar';
  }

  @override
  String get dddPerfect => 'Perfekt! Todos os artigos certos.';

  @override
  String get dddTip =>
      'A cor ajuda a lembrar: der preto, die vermelho, das dourado.';

  @override
  String dddItsArticle(String article) {
    return 'É $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Rápido como um raio.';

  @override
  String get falleeKeepGoing =>
      'Continue: quanto mais você joga, mais rápido você lê.';

  @override
  String hiveRound(int round) {
    return 'Rodada $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Palavra $n de $total';
  }

  @override
  String get hiveCoach =>
      'Toque ou arraste por letras vizinhas para escrever a palavra em alemão';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Faltam $count letras',
      one: 'Falta $count letra',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Dica';

  @override
  String get hiveBoardCleared => 'Tabuleiro concluído!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count pontos',
      one: '+$count ponto',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'COMPARTILHAR';

  @override
  String get commonDone => 'Pronto';

  @override
  String get hiveNextRound => 'PRÓXIMA RODADA';

  @override
  String get commonLearn => 'Aprender';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Você aprendeu $count palavras novas. Elas voltam amanhã para você praticar.',
      one:
          'Você aprendeu $count palavra nova. Ela volta amanhã para você praticar.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'DEPOIS';

  @override
  String get learnKnowIt => 'JÁ SEI';

  @override
  String get learnFlip => 'VIRAR';

  @override
  String get learnPluralOnly => 'só plural · sempre die';

  @override
  String learnPlural(String plural) {
    return 'pl. $plural';
  }

  @override
  String get onboardingIntro =>
      'Aprenda palavras em alemão jogando. Qual é o seu nível?';

  @override
  String get onboardingStart => 'COMEÇAR';

  @override
  String get onboardingNotSure => 'Na dúvida? Comece no A1';

  @override
  String get onboardingChangeLater =>
      'Você pode mudar isso quando quiser em Ajustes.';

  @override
  String get practiceTitle => 'PRÁTICA';

  @override
  String get practiceSpellDue => 'Escreva as palavras pendentes';

  @override
  String get practiceLearnFirst => 'Aprenda algumas palavras primeiro';

  @override
  String get practiceCaughtUp => 'Tudo em dia. Volte amanhã!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palavras',
      one: '$count palavra',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'JOGOS';

  @override
  String get practiceHiveSub =>
      'Deslize pela colmeia para escrever cada palavra';

  @override
  String get practiceDddSub => 'Escolha o artigo certo';

  @override
  String get practiceFalleeSub =>
      'Escolha o significado antes que a palavra caia';

  @override
  String get settingsTitle => 'AJUSTES';

  @override
  String get settingsMadeBy => 'Feito com ❤️ por Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Níveis';

  @override
  String get settingsAutoSpeak => 'Falar as palavras automaticamente';

  @override
  String get settingsAutoSpeakSub => 'Nos cartões e depois das respostas';

  @override
  String get settingsGamesAsPractice => 'Contar jogos como prática';

  @override
  String get settingsGamesAsPracticeSub =>
      'Respostas nos jogos fazem as palavras aprendidas subir ou descer';

  @override
  String get settingsSounds => 'Sons e vibração';

  @override
  String get settingsSoundsSub => 'Nos jogos e na prática';

  @override
  String get settingsReset => 'Redefinir progresso';

  @override
  String get settingsResetTitle => 'Redefinir o progresso?';

  @override
  String get settingsResetBody =>
      'Isso apaga todas as palavras aprendidas, seus pontos e sua sequência.';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get settingsResetConfirm => 'Redefinir';

  @override
  String get settingsPrivacyChoices => 'Privacidade e anúncios';

  @override
  String get settingsPrivacyPolicy => 'Política de privacidade';

  @override
  String get settingsContact => 'Falar com o suporte';

  @override
  String get settingsLicences => 'Licenças de código aberto';

  @override
  String settingsAbout(int count) {
    return '$count palavras comuns em alemão com tradução para o inglês e pronúncia gravada. Sem paywall: todas as palavras e jogos são grátis.';
  }

  @override
  String get settingsMailLastError =>
      'Último erro neste aparelho (apague se preferir):';

  @override
  String get spellingTitle => 'Prática';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palavras',
      one: '$count palavra',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points pontos',
      one: '$points ponto',
    );
    return 'Você praticou $_temp0 e ganhou $_temp1.';
  }

  @override
  String get spellingNounHint => 'substantivo: inclua der, die ou das';

  @override
  String get spellingAnswerIs => 'A resposta é';

  @override
  String get commonNext => 'PRÓXIMA';

  @override
  String get spellingSkip => 'Pular';

  @override
  String get spellingDelete => 'Apagar';

  @override
  String get spellingCheck => 'Verificar';

  @override
  String get wordListAllLearned =>
      'Você aprendeu todas as palavras desta lista.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Faltam $count palavras nesta lista.',
      one: 'Falta $count palavra nesta lista.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'VOCABULÁRIO ($count)';
  }

  @override
  String get reminderBody =>
      'O Daily Hive de hoje está pronto. Cinco minutos de alemão?';

  @override
  String get reminderChannel => 'Lembrete diário';

  @override
  String get reminderChannelDesc =>
      'Um lembrete por dia, no horário que você escolher.';

  @override
  String get reminderSwitch => 'Lembrete diário';

  @override
  String reminderOnAt(String time) {
    return 'Um lembrete por dia às $time';
  }

  @override
  String get reminderOff => 'Um lembrete por dia, no horário que você escolher';

  @override
  String get reminderBlocked =>
      'Permita as notificações do Wortschatz nas configurações do celular para receber um lembrete.';

  @override
  String get reminderTime => 'Horário do lembrete';

  @override
  String commonMastery(int level, int max) {
    return 'Domínio $level de $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent% aprendido';
  }

  @override
  String get commonListen => 'Ouvir';

  @override
  String get commonNoVoice =>
      'Nenhuma voz em alemão instalada. Adicione uma nas configurações de texto para fala do seu aparelho.';

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
    return 'Novos dados de palavras disponíveis. Atualizar ($size)';
  }

  @override
  String get contentUpdating => 'Atualizando palavras…';

  @override
  String get contentUpdatedBanner =>
      'Palavras atualizadas. Elas aparecem na próxima vez que você abrir o app; as gravações já funcionam.';

  @override
  String get contentChecking => 'Verificando…';

  @override
  String get contentDownloading => 'Baixando e verificando arquivos…';

  @override
  String contentAvailable(int version, String size) {
    return 'Versão $version disponível, $size';
  }

  @override
  String get contentUpdate => 'Atualizar';

  @override
  String get contentUpdated =>
      'Atualizado. As palavras novas aparecem na próxima vez que você abrir o app.';

  @override
  String get contentUpToDate => 'Tudo atualizado';

  @override
  String get contentCheck => 'Verificar';

  @override
  String get contentAppTooOld => 'Atualize o app para receber conteúdo novo';

  @override
  String get contentStore => 'Loja';

  @override
  String get contentFailed =>
      'Não foi possível atualizar. Suas palavras não mudaram.';

  @override
  String get contentRetry => 'Repetir';

  @override
  String contentTitle(int version) {
    return 'Conteúdo das palavras · versão $version';
  }

  @override
  String get contentAutoWifi => 'Atualizar automaticamente no Wi-Fi';

  @override
  String get contentAutoWifiSub => 'Nunca nos dados móveis';

  @override
  String summaryCombo(int count) {
    return 'Combo: $count seguidas';
  }

  @override
  String get summaryNewBest => 'RECORDE!';

  @override
  String summaryBestCombo(int count) {
    return 'Melhor combo: $count seguidas';
  }

  @override
  String get summaryPlayAgain => 'JOGAR DE NOVO';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de 3 estrelas',
      one: '$count de 3 estrelas',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle =>
      'Leia histórias reais em alemão, palavra por palavra';

  @override
  String get siblingWordbit => 'Uma palavra em alemão a cada desbloqueio';

  @override
  String get siblingLeben => 'Passe no teste de cidadania';

  @override
  String get siblingAudiobookName => 'Audiolivro em alemão';

  @override
  String get siblingAudiobook => 'Ouça histórias por nível';
}

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class AppLocalizationsPtPt extends AppLocalizationsPt {
  AppLocalizationsPtPt() : super('pt_PT');

  @override
  String get settingsLanguage => 'Idioma da app';

  @override
  String get languageSearchHint => 'Pesquisar idiomas';

  @override
  String get languageSystemDefault => 'Idioma do sistema';

  @override
  String languageFollowsDevice(String language) {
    return 'Segue o teu dispositivo · $language';
  }

  @override
  String appStartFailed(String error) {
    return 'Não foi possível iniciar o Wortschatz.\n\n$error';
  }

  @override
  String get navWords => 'Palavras';

  @override
  String get navPractice => 'Prática';

  @override
  String get navSettings => 'Definições';

  @override
  String homeStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sequência: $count dias',
      one: 'Sequência: $count dia',
    );
    return '$_temp0';
  }

  @override
  String get homePoints => 'Pontos';

  @override
  String get homeToPractise => 'Para praticar';

  @override
  String get homeVocabulary => 'Vocabulário';

  @override
  String homeLevel(int level) {
    return 'Nível $level';
  }

  @override
  String get homeLevelCaps => 'NÍVEL';

  @override
  String homeListSummary(int count, String first, String last) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palavras',
      one: '$count palavra',
    );
    return '$_temp0 · $first … $last';
  }

  @override
  String homeLevelProgress(String level, int learned, int total) {
    return 'Nível $level: $learned de $total palavras aprendidas';
  }

  @override
  String get homeStartHere => 'Começa aqui';

  @override
  String get homeStartHereBody =>
      'Aprende as tuas primeiras 10 palavras com som e depois joga com elas.';

  @override
  String get homeLearn10 => 'APRENDE 10 PALAVRAS';

  @override
  String get homeGoal => 'Objetivo de hoje';

  @override
  String get homeGoalReached => 'Objetivo cumprido!';

  @override
  String get homeGoalReachedBody =>
      'Até amanhã, ou continua a jogar para ganhar pontos.';

  @override
  String homeGoalProgress(int done, int goal) {
    return '$done de $goal palavras aprendidas ou acertadas';
  }

  @override
  String get adsOutOfHints => 'Sem dicas';

  @override
  String adsWatchForHints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ver um anúncio curto para ganhar mais $count dicas?',
      one: 'Ver um anúncio curto para ganhar mais $count dica?',
    );
    return '$_temp0';
  }

  @override
  String get commonNotNow => 'Agora não';

  @override
  String get adsWatchAd => 'Ver anúncio';

  @override
  String adsDoublePoints(int points) {
    return 'Duplicar pontos (+$points)';
  }

  @override
  String adsRestoreStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Recuperar a tua sequência de $days dias',
      one: 'Recuperar a tua sequência de $days dia',
    );
    return '$_temp0';
  }

  @override
  String get adsMoreGerman => 'Mais alemão do Pratiyush';

  @override
  String get rulePluralOnly =>
      'Substantivo só no plural: o plural leva sempre die.';

  @override
  String ruleCompound(String head) {
    return 'As palavras compostas usam o artigo da última parte: $head.';
  }

  @override
  String ruleSuffix(String suffix, String article) {
    return 'A maioria dos substantivos terminados em -$suffix leva $article.';
  }

  @override
  String get levelBeginner => 'Iniciante';

  @override
  String get levelElementary => 'Elementar';

  @override
  String get levelIntermediate => 'Intermédio';

  @override
  String get levelUpperIntermediate => 'Intermédio avançado';

  @override
  String get levelAllInSequence => 'Todos os níveis por ordem';

  @override
  String get levelSequenceSub => 'A1 → A2 → B1 → B2 · recomendado';

  @override
  String get levelOrChoose => 'Ou escolhe um ou mais níveis';

  @override
  String levelWordCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palavras',
      one: '$count palavra',
    );
    return '$_temp0';
  }

  @override
  String levelBadge(String level) {
    return 'Nível $level';
  }

  @override
  String get levelsKeepProgress =>
      'O teu progresso fica guardado em cada nível, por isso mudar nunca te faz perder uma palavra aprendida.';

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
      other: '$count dicas',
      one: '$count dica',
      zero: 'nenhuma dica',
    );
    return '$_temp0';
  }

  @override
  String get practiceDailySub => 'O tabuleiro de hoje, igual para todos';

  @override
  String practiceDailyDone(String stars) {
    return 'Feito hoje: $stars. Toca para partilhar';
  }

  @override
  String get dddPerfect => 'Perfekt! Todos os artigos certos.';

  @override
  String get dddTip =>
      'A cor ajuda a memorizar: der preto, die vermelho, das dourado.';

  @override
  String dddItsArticle(String article) {
    return 'É $article';
  }

  @override
  String get falleePerfect => 'Blitzschnell! Rápido como um relâmpago.';

  @override
  String get falleeKeepGoing =>
      'Continua: quanto mais jogas, mais depressa lês.';

  @override
  String hiveRound(int round) {
    return 'Ronda $round';
  }

  @override
  String hiveWordOf(int n, int total) {
    return 'Palavra $n de $total';
  }

  @override
  String get hiveCoach =>
      'Toca ou arrasta por letras vizinhas para escrever a palavra em alemão';

  @override
  String hiveLettersLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Faltam $count letras',
      one: 'Falta $count letra',
    );
    return '$_temp0';
  }

  @override
  String get commonHint => 'Dica';

  @override
  String get hiveBoardCleared => 'Tabuleiro concluído!';

  @override
  String commonPlusPoints(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count pontos',
      one: '+$count ponto',
    );
    return '$_temp0';
  }

  @override
  String get hiveShareResult => 'PARTILHAR';

  @override
  String get commonDone => 'Concluído';

  @override
  String get hiveNextRound => 'PRÓXIMA RONDA';

  @override
  String get commonLearn => 'Aprender';

  @override
  String learnDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Aprendeste $count palavras novas. Voltam amanhã para praticares.',
      one: 'Aprendeste $count palavra nova. Volta amanhã para praticares.',
    );
    return '$_temp0';
  }

  @override
  String get learnLater => 'DEPOIS';

  @override
  String get learnKnowIt => 'JÁ SEI';

  @override
  String get learnFlip => 'VIRAR';

  @override
  String get learnPluralOnly => 'só plural · sempre die';

  @override
  String learnPlural(String plural) {
    return 'pl. $plural';
  }

  @override
  String get onboardingIntro =>
      'Aprende palavras em alemão a jogar. Qual é o teu nível?';

  @override
  String get onboardingStart => 'COMEÇAR';

  @override
  String get onboardingNotSure => 'Na dúvida? Começa no A1';

  @override
  String get onboardingChangeLater =>
      'Podes mudar isto quando quiseres nas Definições.';

  @override
  String get practiceTitle => 'PRÁTICA';

  @override
  String get practiceSpellDue => 'Escreve as palavras pendentes';

  @override
  String get practiceLearnFirst => 'Aprende primeiro algumas palavras';

  @override
  String get practiceCaughtUp => 'Está tudo em dia. Volta amanhã!';

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palavras',
      one: '$count palavra',
    );
    return '$_temp0';
  }

  @override
  String get practiceGames => 'JOGOS';

  @override
  String get practiceHiveSub =>
      'Desliza pela colmeia para escrever cada palavra';

  @override
  String get practiceDddSub => 'Escolhe o artigo certo';

  @override
  String get practiceFalleeSub =>
      'Escolhe o significado antes de a palavra cair';

  @override
  String get settingsTitle => 'DEFINIÇÕES';

  @override
  String get settingsMadeBy => 'Feito com ❤️ por Pratiyush Kumar Singh';

  @override
  String get settingsLevels => 'Níveis';

  @override
  String get settingsAutoSpeak => 'Pronunciar as palavras automaticamente';

  @override
  String get settingsAutoSpeakSub => 'Nos cartões e depois das respostas';

  @override
  String get settingsGamesAsPractice => 'Contar os jogos como prática';

  @override
  String get settingsGamesAsPracticeSub =>
      'As respostas nos jogos fazem subir ou descer as palavras aprendidas';

  @override
  String get settingsSounds => 'Sons e vibração';

  @override
  String get settingsSoundsSub => 'Nos jogos e na prática';

  @override
  String get settingsReset => 'Repor progresso';

  @override
  String get settingsResetTitle => 'Repor o progresso?';

  @override
  String get settingsResetBody =>
      'Isto apaga todas as palavras aprendidas, os teus pontos e a tua sequência.';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get settingsResetConfirm => 'Repor';

  @override
  String get settingsPrivacyChoices => 'Privacidade e anúncios';

  @override
  String get settingsPrivacyPolicy => 'Política de privacidade';

  @override
  String get settingsContact => 'Contactar o suporte';

  @override
  String get settingsLicences => 'Licenças de código aberto';

  @override
  String settingsAbout(int count) {
    return '$count palavras comuns em alemão com tradução para inglês e pronúncia gravada. Sem paywall: todas as palavras e jogos são gratuitos.';
  }

  @override
  String get settingsMailLastError =>
      'Último erro neste dispositivo (apaga-o se preferires):';

  @override
  String get spellingTitle => 'Prática';

  @override
  String spellingDone(int count, int points) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count palavras',
      one: '$count palavra',
    );
    String _temp1 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points pontos',
      one: '$points ponto',
    );
    return 'Praticaste $_temp0 e ganhaste $_temp1.';
  }

  @override
  String get spellingNounHint => 'substantivo: inclui der, die ou das';

  @override
  String get spellingAnswerIs => 'A resposta é';

  @override
  String get commonNext => 'SEGUINTE';

  @override
  String get spellingSkip => 'Saltar';

  @override
  String get spellingDelete => 'Apagar';

  @override
  String get spellingCheck => 'Verificar';

  @override
  String get wordListAllLearned => 'Aprendeste todas as palavras desta lista.';

  @override
  String wordListWordsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Faltam $count palavras nesta lista.',
      one: 'Falta $count palavra nesta lista.',
    );
    return '$_temp0';
  }

  @override
  String wordListVocabulary(int count) {
    return 'VOCABULÁRIO ($count)';
  }

  @override
  String get reminderBody =>
      'O Daily Hive de hoje está pronto. Cinco minutos de alemão?';

  @override
  String get reminderChannel => 'Lembrete diário';

  @override
  String get reminderChannelDesc =>
      'Um lembrete por dia, à hora que escolheres.';

  @override
  String get reminderSwitch => 'Lembrete diário';

  @override
  String reminderOnAt(String time) {
    return 'Um lembrete por dia às $time';
  }

  @override
  String get reminderOff => 'Um lembrete por dia, à hora que escolheres';

  @override
  String get reminderBlocked =>
      'Permite as notificações do Wortschatz nas definições do telemóvel para receberes um lembrete.';

  @override
  String get reminderTime => 'Hora do lembrete';

  @override
  String commonMastery(int level, int max) {
    return 'Domínio $level de $max';
  }

  @override
  String commonPercentLearned(int percent) {
    return '$percent% aprendido';
  }

  @override
  String get commonListen => 'Ouvir';

  @override
  String get commonNoVoice =>
      'Nenhuma voz alemã instalada. Adiciona uma nas definições de texto para voz do teu dispositivo.';

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
    return 'Novos dados de palavras disponíveis. Atualizar ($size)';
  }

  @override
  String get contentUpdating => 'A atualizar palavras…';

  @override
  String get contentUpdatedBanner =>
      'Palavras atualizadas. Aparecem da próxima vez que abrires a app; as gravações já funcionam.';

  @override
  String get contentChecking => 'A verificar…';

  @override
  String get contentDownloading => 'A transferir e verificar ficheiros…';

  @override
  String contentAvailable(int version, String size) {
    return 'Versão $version disponível, $size';
  }

  @override
  String get contentUpdate => 'Atualizar';

  @override
  String get contentUpdated =>
      'Atualizado. As palavras novas aparecem da próxima vez que abrires a app.';

  @override
  String get contentUpToDate => 'Tudo atualizado';

  @override
  String get contentCheck => 'Verificar';

  @override
  String get contentAppTooOld => 'Atualiza a app para receber conteúdo novo';

  @override
  String get contentStore => 'Loja';

  @override
  String get contentFailed =>
      'Não foi possível atualizar. As tuas palavras não mudaram.';

  @override
  String get contentRetry => 'Repetir';

  @override
  String contentTitle(int version) {
    return 'Conteúdo das palavras · versão $version';
  }

  @override
  String get contentAutoWifi => 'Atualizar automaticamente por Wi-Fi';

  @override
  String get contentAutoWifiSub => 'Nunca com dados móveis';

  @override
  String summaryCombo(int count) {
    return 'Combo: $count seguidas';
  }

  @override
  String get summaryNewBest => 'RECORDE!';

  @override
  String summaryBestCombo(int count) {
    return 'Melhor combo: $count seguidas';
  }

  @override
  String get summaryPlayAgain => 'JOGAR DE NOVO';

  @override
  String summaryStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de 3 estrelas',
      one: '$count de 3 estrelas',
    );
    return '$_temp0';
  }

  @override
  String get siblingLernle => 'Lê histórias reais em alemão, palavra a palavra';

  @override
  String get siblingWordbit => 'Uma palavra em alemão sempre que desbloqueias';

  @override
  String get siblingLeben => 'Passa no teste de cidadania';

  @override
  String get siblingAudiobookName => 'Audiolivro em alemão';

  @override
  String get siblingAudiobook => 'Ouve histórias por nível';
}
