import 'providers/onboarding_provider.dart';
import 'screens/onboarding_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ads/ads_service.dart';
import 'providers/content_update_provider.dart';
import 'providers/progress_provider.dart';
import 'providers/stats_provider.dart';
import 'screens/home_screen.dart';
import 'screens/practice_screen.dart';
import 'screens/settings_screen.dart';
import 'theme/app_theme.dart';

const appTitle = 'Wortschatz';

class GermanWordsApp extends ConsumerWidget {
  const GermanWordsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp(
    title: appTitle,
    debugShowCheckedModeBanner: false,
    theme: buildTheme(),
    // First run asks for the level; then the app proper.
    home: ref.watch(onboardedProvider)
        ? const RootScreen()
        : const OnboardingScreen(),
  );
}

/// Bottom navigation: Words, Practice, Settings.
class RootScreen extends ConsumerStatefulWidget {
  const RootScreen({super.key});

  @override
  ConsumerState<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends ConsumerState<RootScreen> {
  int _tab = 0;

  /// Recomputes what depends on today's date when the app comes back to the
  /// foreground, e.g. the next morning after a night in the background.
  late final AppLifecycleListener _lifecycle;

  @override
  void initState() {
    super.initState();
    // Consent (UMP, then ATT) needs a visible app, so start after frame one.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(adsServiceProvider).start();
      // At most once a day; silent when offline.
      ref.read(contentUpdateProvider.notifier).checkDaily();
    });
    _lifecycle = AppLifecycleListener(
      onResume: () => ref
        ..invalidate(dueWordsProvider)
        ..invalidate(currentStreakProvider),
    );
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final due = ref.watch(dueWordsProvider).length;
    return Scaffold(
      body: IndexedStack(
        index: _tab,
        children: const [HomeScreen(), PracticeScreen(), SettingsScreen()],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // One banner for all three tabs (menus only, per the placement map).
          const AdBanner(),
          // The bar has a fixed height; very large fonts would push its
          // labels out, so they stop growing at 1.3x (content still scales).
          MediaQuery.withClampedTextScaling(
            maxScaleFactor: 1.3,
            child: NavigationBar(
              selectedIndex: _tab,
              onDestinationSelected: (i) => setState(() => _tab = i),
              destinations: [
                const NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home_rounded),
                  label: 'Words',
                ),
                NavigationDestination(
                  icon: Badge(
                    isLabelVisible: due > 0,
                    label: Text('$due'),
                    child: const Icon(Icons.rocket_launch_outlined),
                  ),
                  selectedIcon: const Icon(Icons.rocket_launch_rounded),
                  label: 'Practice',
                ),
                const NavigationDestination(
                  icon: Icon(Icons.person_outline_rounded),
                  selectedIcon: Icon(Icons.person_rounded),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Shown instead of the app if startup fails.
class StartupErrorApp extends StatelessWidget {
  const StartupErrorApp({super.key, required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: appTitle,
    debugShowCheckedModeBanner: false,
    theme: buildTheme(),
    home: Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'Wortschatz couldn’t start.\n\n$error',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );
}
