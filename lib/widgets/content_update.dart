import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../content/content_client.dart';
import '../providers/content_update_provider.dart';
import '../providers/settings_provider.dart';
import '../theme/app_theme.dart';
import 'common.dart';
import '../l10n/l10n_ext.dart';

String _mb(AppLocalizations l, int bytes) => l.contentMb(bytes / 1048576);

/// Home: a non-blocking card when newer word data is available.
class ContentUpdateCard extends ConsumerWidget {
  const ContentUpdateCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final check = ref.watch(contentUpdateProvider);
    final l = context.l10n;
    final text = switch (check.state) {
      UpdateState.available => l.contentBanner(_mb(l, check.downloadBytes)),
      UpdateState.updating => l.contentUpdating,
      UpdateState.updated => l.contentUpdatedBanner,
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
    final l = context.l10n;
    final (subtitle, action, onTap) = switch (check.state) {
      UpdateState.checking => (l.contentChecking, null, null),
      UpdateState.updating => (l.contentDownloading, null, null),
      UpdateState.available => (
        l.contentAvailable(
          check.manifest!.contentVersion,
          _mb(l, check.downloadBytes),
        ),
        l.contentUpdate,
        notifier.update,
      ),
      UpdateState.updated => (l.contentUpdated, null, null),
      UpdateState.upToDate => (
        l.contentUpToDate,
        l.contentCheck,
        notifier.check,
      ),
      UpdateState.appTooOld => (
        l.contentAppTooOld,
        l.contentStore,
        () => launchUrl(
          Uri.parse(
            'https://play.google.com/store/apps/details?id=com.pratiyush.german_words',
          ),
          mode: LaunchMode.externalApplication,
        ),
      ),
      UpdateState.failed => (l.contentFailed, l.contentRetry, notifier.check),
      UpdateState.idle => (null, l.contentCheck, notifier.check),
    };
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Icon(Icons.cloud_sync_rounded),
          title: Text(l.contentTitle(version)),
          subtitle: subtitle == null ? null : Text(subtitle),
          trailing: action == null
              ? null
              : TextButton(onPressed: onTap, child: Text(action)),
        ),
        SwitchListTile(
          title: Text(l.contentAutoWifi),
          subtitle: Text(l.contentAutoWifiSub),
          value: ref.watch(settingsProvider).autoUpdateOnWifi,
          onChanged: ref.read(settingsProvider.notifier).setAutoUpdateOnWifi,
        ),
      ],
    );
  }
}
