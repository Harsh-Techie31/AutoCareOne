import 'package:flutter/material.dart';

class AppColorScheme {
  // Light Theme Colors
  static const Color lightPrimary = Color(0xFF0EA5E9); // Sky Blue
  static const Color lightPrimaryContainer = Color(0xFFE0F2FE);
  static const Color lightSecondary = Color(0xFF6366F1); // Indigo
  static const Color lightSecondaryContainer = Color(0xFFEEF2FF);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFF1F5F9);
  static const Color lightBackground = Color(0xFFFAFBFC);
  static const Color lightError = Color(0xFFEF4444);
  static const Color lightErrorContainer = Color(0xFFFEE2E2);
  static const Color lightOnPrimary = Color(0xFFFFFFFF);
  static const Color lightOnSecondary = Color(0xFFFFFFFF);
  static const Color lightOnSurface = Color(0xFF1E293B);
  static const Color lightOnBackground = Color(0xFF1E293B);
  static const Color lightOnError = Color(0xFFFFFFFF);
  
  // Accent Colors (work in both themes)
  static const Color success = Color(0xFF10B981); // Green
  static const Color warning = Color(0xFFF59E0B); // Amber
  static const Color info = Color(0xFF3B82F6); // Blue
  static const Color danger = Color(0xFFEF4444); // Red
  
  // Dark Theme Colors
  static const Color darkPrimary = Color(0xFF38BDF8); // Lighter Sky Blue
  static const Color darkPrimaryContainer = Color(0xFF0C4A6E);
  static const Color darkSecondary = Color(0xFF818CF8); // Lighter Indigo
  static const Color darkSecondaryContainer = Color(0xFF312E81);
  static const Color darkSurface = Color(0xFF1E293B);
  static const Color darkSurfaceVariant = Color(0xFF334155);
  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkError = Color(0xFFF87171);
  static const Color darkErrorContainer = Color(0xFF7F1D1D);
  static const Color darkOnPrimary = Color(0xFF0F172A);
  static const Color darkOnSecondary = Color(0xFF0F172A);
  static const Color darkOnSurface = Color(0xFFF1F5F9);
  static const Color darkOnBackground = Color(0xFFF1F5F9);
  static const Color darkOnError = Color(0xFF0F172A);
  
  // Gradient Colors
  static const List<Color> lightGradient = [
    Color(0xFF0EA5E9),
    Color(0xFF6366F1),
  ];
  
  static const List<Color> darkGradient = [
    Color(0xFF38BDF8),
    Color(0xFF818CF8),
  ];
  
  // Card Colors
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color darkCard = Color(0xFF1E293B);
  
  // Text Colors
  static const Color lightTextPrimary = Color(0xFF1E293B);
  static const Color lightTextSecondary = Color(0xFF64748B);
  static const Color darkTextPrimary = Color(0xFFF1F5F9);
  static const Color darkTextSecondary = Color(0xFF94A3B8);
  
  // Border Colors
  static const Color lightBorder = Color(0xFFE2E8F0);
  static const Color darkBorder = Color(0xFF334155);
  
  // Shadow Colors
  static const Color lightShadow = Color(0x1A000000);
  static const Color darkShadow = Color(0x40000000);
  
  // Status Colors (work in both themes)
  static const Color statusSuccess = Color(0xFF10B981);
  static const Color statusWarning = Color(0xFFF59E0B);
  static const Color statusError = Color(0xFFEF4444);
  static const Color statusInfo = Color(0xFF3B82F6);
  
  // Get Light Theme
  static ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: lightPrimary,
        primaryContainer: lightPrimaryContainer,
        secondary: lightSecondary,
        secondaryContainer: lightSecondaryContainer,
        surface: lightSurface,
        surfaceVariant: lightSurfaceVariant,
        background: lightBackground,
        error: lightError,
        errorContainer: lightErrorContainer,
        onPrimary: lightOnPrimary,
        onSecondary: lightOnSecondary,
        onSurface: lightOnSurface,
        onBackground: lightOnBackground,
        onError: lightOnError,
      ),
      scaffoldBackgroundColor: lightBackground,
      cardTheme: CardTheme(
        elevation: 2,
        color: lightCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: lightPrimaryContainer,
        foregroundColor: lightTextPrimary,
        centerTitle: false,
      ),
    );
  }
  
  // Get Dark Theme
  static ThemeData getDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: darkPrimary,
        primaryContainer: darkPrimaryContainer,
        secondary: darkSecondary,
        secondaryContainer: darkSecondaryContainer,
        surface: darkSurface,
        surfaceVariant: darkSurfaceVariant,
        background: darkBackground,
        error: darkError,
        errorContainer: darkErrorContainer,
        onPrimary: darkOnPrimary,
        onSecondary: darkOnSecondary,
        onSurface: darkOnSurface,
        onBackground: darkOnBackground,
        onError: darkOnError,
      ),
      scaffoldBackgroundColor: darkBackground,
      cardTheme: CardTheme(
        elevation: 2,
        color: darkCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: darkPrimaryContainer,
        foregroundColor: darkTextPrimary,
        centerTitle: false,
      ),
    );
  }
}

