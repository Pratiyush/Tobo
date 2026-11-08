import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:url_launcher/url_launcher.dart';

import '../widgets/content_update.dart';
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

const appVersion = '1.0.0';
const appCredit = 'Made with ❤️ by Pratiyush Kumar Singh';

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
          Center(child: Text('SETTINGS', style: heading)),
          const SizedBox(height: 16),
          WhiteCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Speak words automatically'),
                  subtitle: const Text('On flashcards and after answers'),
                  value: settings.autoSpeak,
                  onChanged: ref.read(settingsProvider.notifier).setAutoSpeak,
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: const Text('Count games as practice'),
                  subtitle: const Text(
                    'Game answers move learned words up or down',
                  ),
                  value: settings.countGamesAsPractice,
                  onChanged: ref
                      .read(settingsProvider.notifier)
                      .setCountGamesAsPractice,
                ),
                const Divider(height: 1),
                const ContentUpdateTile(),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(
                    Icons.restart_alt_rounded,
                    color: AppColors.red,
                  ),
                  title: const Text('Reset progress'),
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
                              title: const Text('Privacy & ad choices'),
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
                  title: 'Privacy policy',
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
                  title: 'Contact support',
                  url: Uri(
                    scheme: 'mailto',
                    path: supportEmail,
                    query: _supportQuery(
                      ErrorLog(ref.read(sharedPreferencesProvider)).latest,
                    ),
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.description_outlined),
                  title: const Text('Open-source licences'),
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
                  '$words common German words with English translations and '
                  'recorded pronunciations. No paywall: every word and game '
                  'is free.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.inkSoft,
                  ),
                ),
                const SizedBox(height: 12),
                Text(appCredit, style: theme.textTheme.bodyMedium),
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
        title: const Text('Reset progress?'),
        content: const Text(
          'This forgets every learned word, your points and your streak.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Reset'),
          ),
        ],
      ),
    );
    if (ok != true) return;
    ref.read(progressProvider.notifier).reset();
    ref.read(statsProvider.notifier).reset();
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
String _supportQuery(String? lastError) {
  final subject = Uri.encodeComponent('$appTitle $appVersion');
  if (lastError == null) return 'subject=$subject';
  final body = Uri.encodeComponent(
    '\n\n---\nLast error on this device (delete if you prefer):\n$lastError',
  );
  return 'subject=$subject&body=$body';
}
