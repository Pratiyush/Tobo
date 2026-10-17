import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app.dart';
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
                  '$words German words with English translations, from the '
                  'Lernle word deck. No ads, no paywall.',
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
