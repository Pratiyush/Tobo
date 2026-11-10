import '../providers/feedback_provider.dart';
import '../providers/daily_goal_provider.dart';
import '../widgets/level_picker.dart';
import '../l10n/languages.dart';
import '../providers/language_provider.dart';
import 'language_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:url_launcher/url_launcher.dart';

import '../widgets/content_update.dart';
import '../widgets/reminder_tile.dart';
import '../services/error_log.dart';
import '../providers/preferences_provider.dart';
import '../ads/ads_service.dart';
import '../app.dart';
import '../app_links.dart';
import '../providers/progress_provider.dart';
import '../providers/settings_provider.dart';
import '../providers/stats_provider.dart';
import '../providers/words_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/blue_scaffold.dart';
import '../widgets/common.dart';
import '../l10n/l10n_ext.dart';

const appVersion = '1.0.0';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final settings = ref.watch(settingsProvider);
    final words = ref.watch(wordsProvider).length;
    final heading = theme.textTheme.titleMedium?.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w900,
      letterSpacing: 1.5,
    );
    return BlueScaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          Center(child: Text(context.l10n.settingsTitle, style: heading)),
          const SizedBox(height: 16),
          WhiteCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Builder(
                  builder: (context) {
                    final tag = ref.watch(appLanguageProvider);
                    final picked = tag == null ? null : languageForTag(tag);
                    final l = AppLocalizations.of(context);
                    return ListTile(
                      key: const ValueKey('settings-language'),
                      leading: const Icon(Icons.translate_rounded),
                      title: Text(l.settingsLanguage),
                      subtitle: Text(
                        picked == null
                            ? l.languageSystemDefault
                            : '${picked.flag} ${picked.name}',
                      ),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const LanguageScreen(),
                        ),
                      ),
                    );
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  key: const ValueKey('settings-levels'),
                  leading: const Icon(Icons.school_rounded),
                  title: Text(context.l10n.settingsLevels),
                  subtitle: Text(
                    levelChoiceLabel(context.l10n, settings.levels),
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const LevelSettingsScreen(),
                    ),
                  ),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: Text(context.l10n.settingsAutoSpeak),
                  subtitle: Text(context.l10n.settingsAutoSpeakSub),
                  value: settings.autoSpeak,
                  onChanged: ref.read(settingsProvider.notifier).setAutoSpeak,
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: Text(context.l10n.settingsGamesAsPractice),
                  subtitle: Text(context.l10n.settingsGamesAsPracticeSub),
                  value: settings.countGamesAsPractice,
                  onChanged: ref
                      .read(settingsProvider.notifier)
                      .setCountGamesAsPractice,
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: Text(context.l10n.settingsSounds),
                  subtitle: Text(context.l10n.settingsSoundsSub),
                  value: settings.soundEffects,
                  onChanged: ref
                      .read(settingsProvider.notifier)
                      .setSoundEffects,
                ),
                const Divider(height: 1),
                const ReminderTile(),
                const Divider(height: 1),
                const ContentUpdateTile(),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(
                    Icons.restart_alt_rounded,
                    color: AppColors.red,
                  ),
                  title: Text(context.l10n.settingsReset),
                  onTap: () => _confirmReset(context, ref),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          WhiteCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                ValueListenableBuilder<bool>(
                  valueListenable: ref
                      .watch(adsServiceProvider)
                      .privacyOptionsRequired,
                  builder: (context, required, _) => required
                      ? Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.tune_rounded),
                              title: Text(context.l10n.settingsPrivacyChoices),
                              onTap: ref
                                  .read(adsServiceProvider)
                                  .showPrivacyOptions,
                            ),
                            const Divider(height: 1),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
                _LinkTile(
                  icon: Icons.privacy_tip_outlined,
                  title: context.l10n.settingsPrivacyPolicy,
                  url: Uri.parse(privacyPolicyUrl),
                ),
                const Divider(height: 1),
                _LinkTile(
                  icon: Icons.info_outline_rounded,
                  title: 'Impressum',
                  url: Uri.parse(impressumUrl),
                ),
                const Divider(height: 1),
                _LinkTile(
                  icon: Icons.mail_outline_rounded,
                  title: context.l10n.settingsContact,
                  url: Uri(
                    scheme: 'mailto',
                    path: supportEmail,
                    query: _supportQuery(
                      ErrorLog(ref.read(sharedPreferencesProvider)).latest,
                      context.l10n.settingsMailLastError,
                    ),
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.description_outlined),
                  title: Text(context.l10n.settingsLicences),
                  onTap: () => showLicensePage(
                    context: context,
                    applicationName: appTitle,
                    applicationVersion: appVersion,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          WhiteCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$appTitle $appVersion',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  context.l10n.settingsAbout(words),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.inkSoft,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  context.l10n.settingsMadeBy,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmReset(BuildContext context, WidgetRef ref) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.settingsResetTitle),
        content: Text(context.l10n.settingsResetBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(context.l10n.commonCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(context.l10n.settingsResetConfirm),
          ),
        ],
      ),
    );
    if (ok != true) return;
    ref.read(progressProvider.notifier).reset();
    ref.read(statsProvider.notifier).reset();
    ref.read(bestScoresProvider.notifier).reset();
    ref.read(dailyGoalProvider.notifier).reset();
  }
}

class _LinkTile extends StatelessWidget {
  const _LinkTile({required this.icon, required this.title, required this.url});

  final IconData icon;
  final String title;
  final Uri url;

  @override
  Widget build(BuildContext context) => ListTile(
    leading: Icon(icon),
    title: Text(title),
    trailing: const Icon(Icons.open_in_new_rounded, size: 18),
    onTap: () => launchUrl(url, mode: LaunchMode.externalApplication),
  );
}

/// Mail subject, plus the newest local error (if any) for the user to send.
String _supportQuery(String? lastError, String lastErrorLine) {
  final subject = Uri.encodeComponent('$appTitle $appVersion');
  if (lastError == null) return 'subject=$subject';
  final body = Uri.encodeComponent('\n\n---\n$lastErrorLine\n$lastError');
  return 'subject=$subject&body=$body';
}

/// Settings › Levels: changes apply at once to the lists and all games.
class LevelSettingsScreen extends ConsumerWidget {
  const LevelSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => BlueScaffold(
    title: context.l10n.settingsLevels,
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        LevelPicker(
          value: ref.watch(settingsProvider).levels,
          onChanged: ref.read(settingsProvider.notifier).setLevels,
        ),
        const SizedBox(height: 12),
        Text(
          context.l10n.levelsKeepProgress,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium
              ?.copyWith(color: Colors.white),
        ),
      ],
    ),
  );
}
