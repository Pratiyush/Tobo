import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/level.dart';
import '../providers/onboarding_provider.dart';
import '../providers/settings_provider.dart';
import '../widgets/blue_scaffold.dart';
import '../widgets/level_picker.dart';
import '../l10n/l10n_ext.dart';

/// First run: what level? One question, then straight to the games.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  LevelChoice _choice = const LevelChoice.sequence();

  void _finish(LevelChoice choice) {
    ref.read(settingsProvider.notifier).setLevels(choice);
    ref.read(onboardedProvider.notifier).complete();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final white = theme.textTheme.headlineSmall?.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w900,
    );
    return BlueScaffold(
      // Pinned so both choices are visible on the smallest phones.
      bottom: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton(
              onPressed: () => _finish(_choice),
              child: Text(context.l10n.onboardingStart),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () => _finish(const LevelChoice.sequence()),
              child: Text(context.l10n.onboardingNotSure),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        children: [
          Text('Willkommen!', style: white, textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text(
            context.l10n.onboardingIntro,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 20),
          LevelPicker(
            value: _choice,
            onChanged: (c) => setState(() => _choice = c),
          ),
          const SizedBox(height: 12),
          Text(
            context.l10n.onboardingChangeLater,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
