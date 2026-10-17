import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/progress_provider.dart';
import 'screens/home_screen.dart';
import 'screens/practice_screen.dart';
import 'screens/settings_screen.dart';
import 'theme/app_theme.dart';

const appTitle = 'Wortschatz';

class GermanWordsApp extends StatelessWidget {
  const GermanWordsApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: appTitle,
    debugShowCheckedModeBanner: false,
    theme: buildTheme(),
    home: const RootScreen(),
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

  @override
  Widget build(BuildContext context) {
    final due = ref.watch(dueWordsProvider).length;
    return Scaffold(
      body: IndexedStack(
        index: _tab,
        children: const [HomeScreen(), PracticeScreen(), SettingsScreen()],
      ),
      bottomNavigationBar: NavigationBar(
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
