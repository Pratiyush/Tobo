import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../content/content_client.dart';
import '../providers/content_update_provider.dart';
import '../theme/app_theme.dart';
import 'common.dart';

String _mb(int bytes) => '${(bytes / 1048576).toStringAsFixed(1)} MB';

/// Home: a non-blocking card when newer word data is available.
class ContentUpdateCard extends ConsumerWidget {
  const ContentUpdateCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final check = ref.watch(contentUpdateProvider);
    final text = switch (check.state) {
      UpdateState.available =>
        'New word data available. Update (${_mb(check.downloadBytes)})',
      UpdateState.updating => 'Updating words…',
      UpdateState.updated =>
        'Words updated. They appear next time you open '
            'the app; recordings already play.',
      _ => null,
    };
    if (text == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: WhiteCard(
        onTap: check.state == UpdateState.available
            ? ref.read(contentUpdateProvider.notifier).update
            : null,
        child: Row(
          children: [
            const Icon(
              Icons.cloud_download_rounded,
              color: AppColors.blueBottom,
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(text)),
          ],
        ),
      ),
    );
  }
}

/// Settings: installed version and the manual check / update button.
class ContentUpdateTile extends ConsumerWidget {
  const ContentUpdateTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Hidden while the CDN client is off (no store).
    if (ref.watch(contentStoreProvider) == null) return const SizedBox.shrink();
    final check = ref.watch(contentUpdateProvider);
    final notifier = ref.read(contentUpdateProvider.notifier);
    final version = check.state == UpdateState.updated
        ? check.manifest!.contentVersion
        : notifier.installedVersion;
    final (subtitle, action, onTap) = switch (check.state) {
      UpdateState.checking => ('Checking…', null, null),
      UpdateState.updating => ('Downloading and checking files…', null, null),
      UpdateState.available => (
        'Version ${check.manifest!.contentVersion} available, '
            '${_mb(check.downloadBytes)}',
        'Update',
        notifier.update,
      ),
      UpdateState.updated => (
        'Updated. New words appear next time you open the app.',
        null,
        null,
      ),
      UpdateState.upToDate => ('Up to date', 'Check', notifier.check),
      UpdateState.appTooOld => (
        'Update the app to get new content',
        'Store',
        () => launchUrl(
          Uri.parse(
            'https://play.google.com/store/apps/details?id=com.pratiyush.german_words',
          ),
          mode: LaunchMode.externalApplication,
        ),
      ),
      UpdateState.failed => (
        'Couldn’t update. Your words are unchanged.',
        'Retry',
        notifier.check,
      ),
      UpdateState.idle => (null, 'Check', notifier.check),
    };
    return ListTile(
      leading: const Icon(Icons.cloud_sync_rounded),
      title: Text('Word content · version $version'),
      subtitle: subtitle == null ? null : Text(subtitle),
      trailing: action == null
          ? null
          : TextButton(onPressed: onTap, child: Text(action)),
    );
  }
}
