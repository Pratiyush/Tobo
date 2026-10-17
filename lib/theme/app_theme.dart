import 'package:flutter/material.dart';

import '../models/word.dart';

/// Every colour in the app. Arcade style: blue ground, white cards,
/// orange calls to action, green to confirm.
abstract final class AppColors {
  static const blueTop = Color(0xFF2E7BC4);
  static const blueBottom = Color(0xFF1B3FA0);
  static const orange = Color(0xFFF2A03D);
  static const orangeDeep = Color(0xFFD9822B);
  static const green = Color(0xFF34B36B);
  static const red = Color(0xFFE5484D);
  static const ink = Color(0xFF1F2A44);
  static const inkSoft = Color(0xFF66718A);
  static const card = Colors.white;
  static const track = Color(0xFFE3E8F2);
  static const hexTile = Color(0xFFFFF4E0);
  static const hexSelected = orange;
  static const hexHint = Color(0xFFFFD58A);
  static const gold = Color(0xFFFFC83D);

  /// The German flag as an article mnemonic.
  static const der = Color(0xFF1A1A1A);
  static const die = Color(0xFFDD1F26);
  static const das = Color(0xFFFFCE00);

  static Color article(Gender g) => switch (g) {
    Gender.der => der,
    Gender.die => die,
    Gender.das => das,
  };

  /// Text colour readable on [article].
  static Color onArticle(Gender g) => switch (g) {
    Gender.der || Gender.die => Colors.white,
    Gender.das => ink,
  };

  static const background = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [blueTop, blueBottom],
  );
}

ThemeData buildTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: AppColors.blueTop,
    primary: AppColors.orange,
    onPrimary: Colors.white,
    secondary: AppColors.green,
    surface: AppColors.card,
    onSurface: AppColors.ink,
  );
  final base = ThemeData(colorScheme: scheme, useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.blueBottom,
    textTheme: base.textTheme.apply(
      bodyColor: AppColors.ink,
      displayColor: AppColors.ink,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    cardTheme: CardThemeData(
      color: AppColors.card,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.orange,
        foregroundColor: Colors.white,
        minimumSize: const Size(48, 52),
        textStyle: base.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white,
      indicatorColor: AppColors.orange.withValues(alpha: 0.2),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (s) => s.contains(WidgetState.selected) ? Colors.white : null,
      ),
      trackColor: WidgetStateProperty.resolveWith(
        (s) => s.contains(WidgetState.selected) ? AppColors.green : null,
      ),
    ),
  );
}
