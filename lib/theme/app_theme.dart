import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ---------------------------------------------------------------------------
// FitTrack — Kinetic Pulse design system
// Colors sourced directly from the Stitch export DESIGN.md token table.
// ---------------------------------------------------------------------------
class AppColors {
  AppColors._();

  // --- Core surfaces ---
  static const background = Color(0xFF111316);
  static const surface = Color(0xFF111316);
  static const surfaceContainerLowest = Color(0xFF0C0E11);
  static const surfaceContainerLow = Color(0xFF1A1C1F);
  static const surfaceContainer = Color(0xFF1E2023);
  static const surfaceContainerHigh = Color(0xFF282A2D);
  static const surfaceContainerHighest = Color(0xFF333538);
  static const surfaceBright = Color(0xFF37393D);

  // --- On-surface text ---
  static const onSurface = Color(0xFFE2E2E6);
  static const onSurfaceVariant = Color(0xFFB9CBBE);

  // --- Primary — Hyper Emerald ---
  static const primary = Color(0xFFB6FFD4);
  static const primaryContainer = Color(0xFF00F0A0);
  static const onPrimary = Color(0xFF003822);
  static const onPrimaryContainer = Color(0xFF006843);

  // --- Secondary — Kinetic Orange ---
  static const secondary = Color(0xFFFFB59D);
  static const secondaryContainer = Color(0xFFB83900);
  static const onSecondary = Color(0xFF5D1900);
  static const onSecondaryContainer = Color(0xFFFFDDD2);

  // --- Tertiary — Cyan Velocity ---
  static const tertiary = Color(0xFFD0F6FF);
  static const tertiaryContainer = Color(0xFF53E5FF);
  static const onTertiary = Color(0xFF00363E);
  static const onTertiaryContainer = Color(0xFF006472);

  // --- Outline ---
  static const outline = Color(0xFF849589);
  static const outlineVariant = Color(0xFF3B4A40);

  // --- Misc ---
  static const error = Color(0xFFFFB4AB);
  static const onError = Color(0xFF690005);
  static const errorContainer = Color(0xFF93000A);
}

// ---------------------------------------------------------------------------
// Typography — Lexend for headlines/metrics, Manrope for body/labels
// ---------------------------------------------------------------------------
class AppTextStyles {
  AppTextStyles._();

  // Lexend styles
  static TextStyle displayLg({Color? color}) => GoogleFonts.lexend(
        fontSize: 56, fontWeight: FontWeight.w700, height: 64 / 56,
        letterSpacing: -0.03 * 56, color: color ?? AppColors.onSurface,
      );

  static TextStyle displayLgMobile({Color? color}) => GoogleFonts.lexend(
        fontSize: 40, fontWeight: FontWeight.w700, height: 48 / 40,
        letterSpacing: -0.02 * 40, color: color ?? AppColors.onSurface,
      );

  static TextStyle headlineLg({Color? color}) => GoogleFonts.lexend(
        fontSize: 32, fontWeight: FontWeight.w600, height: 40 / 32,
        letterSpacing: -0.02 * 32, color: color ?? AppColors.onSurface,
      );

  static TextStyle headlineLgMobile({Color? color}) => GoogleFonts.lexend(
        fontSize: 26, fontWeight: FontWeight.w600, height: 34 / 26,
        letterSpacing: -0.01 * 26, color: color ?? AppColors.onSurface,
      );

  static TextStyle headlineMd({Color? color}) => GoogleFonts.lexend(
        fontSize: 22, fontWeight: FontWeight.w600, height: 28 / 22,
        color: color ?? AppColors.onSurface,
      );

  static TextStyle labelLg({Color? color}) => GoogleFonts.lexend(
        fontSize: 14, fontWeight: FontWeight.w600, height: 18 / 14,
        letterSpacing: 0.02 * 14, color: color ?? AppColors.onSurface,
      );

  static TextStyle labelMd({Color? color}) => GoogleFonts.lexend(
        fontSize: 12, fontWeight: FontWeight.w500, height: 16 / 12,
        letterSpacing: 0.04 * 12, color: color ?? AppColors.onSurface,
      );

  static TextStyle labelSm({Color? color}) => GoogleFonts.lexend(
        fontSize: 10, fontWeight: FontWeight.w500, height: 14 / 10,
        letterSpacing: 0.05 * 10, color: color ?? AppColors.onSurface,
      );

  // Manrope styles
  static TextStyle titleLg({Color? color}) => GoogleFonts.manrope(
        fontSize: 18, fontWeight: FontWeight.w600, height: 24 / 18,
        color: color ?? AppColors.onSurface,
      );

  static TextStyle titleMd({Color? color}) => GoogleFonts.manrope(
        fontSize: 16, fontWeight: FontWeight.w600, height: 22 / 16,
        color: color ?? AppColors.onSurface,
      );

  static TextStyle bodyLg({Color? color}) => GoogleFonts.manrope(
        fontSize: 16, fontWeight: FontWeight.w400, height: 24 / 16,
        color: color ?? AppColors.onSurface,
      );

  static TextStyle bodyMd({Color? color}) => GoogleFonts.manrope(
        fontSize: 14, fontWeight: FontWeight.w400, height: 20 / 14,
        color: color ?? AppColors.onSurface,
      );
}

// ---------------------------------------------------------------------------
// Border radius tokens
// ---------------------------------------------------------------------------
class AppRadius {
  AppRadius._();
  static const sm = BorderRadius.all(Radius.circular(8));
  static const md = BorderRadius.all(Radius.circular(16));
  static const lg = BorderRadius.all(Radius.circular(24)); // rounded-2xl
  static const xl = BorderRadius.all(Radius.circular(32)); // rounded-3xl
  static const full = BorderRadius.all(Radius.circular(9999));
}

// ---------------------------------------------------------------------------
// Spacing tokens (4px base grid)
// ---------------------------------------------------------------------------
class AppSpacing {
  AppSpacing._();
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 36.0;
}

// ---------------------------------------------------------------------------
// ThemeData factory
// ---------------------------------------------------------------------------
ThemeData buildAppTheme() {
  const colorScheme = ColorScheme(
    brightness: Brightness.dark,
    // Primary — Hyper Emerald
    primary: AppColors.primaryContainer,        // #00F0A0 — main emerald
    onPrimary: AppColors.onPrimary,
    primaryContainer: AppColors.primary,        // #B6FFD4
    onPrimaryContainer: AppColors.onPrimaryContainer,
    // Secondary — Kinetic Orange
    secondary: AppColors.secondary,             // #FFB59D
    onSecondary: AppColors.onSecondary,
    secondaryContainer: AppColors.secondaryContainer,
    onSecondaryContainer: AppColors.onSecondaryContainer,
    // Tertiary — Cyan Velocity
    tertiary: AppColors.tertiaryContainer,      // #53E5FF
    onTertiary: AppColors.onTertiary,
    tertiaryContainer: AppColors.tertiary,
    onTertiaryContainer: AppColors.onTertiaryContainer,
    // Surface
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    surfaceContainerLowest: AppColors.surfaceContainerLowest,
    surfaceContainerLow: AppColors.surfaceContainerLow,
    surfaceContainer: AppColors.surfaceContainer,
    surfaceContainerHigh: AppColors.surfaceContainerHigh,
    surfaceContainerHighest: AppColors.surfaceContainerHighest,
    onSurfaceVariant: AppColors.onSurfaceVariant,
    // Outline
    outline: AppColors.outline,
    outlineVariant: AppColors.outlineVariant,
    // Error
    error: AppColors.error,
    onError: AppColors.onError,
    errorContainer: AppColors.errorContainer,
    onErrorContainer: Color(0xFFFFDAD6),
  );

  final textTheme = TextTheme(
    displayLarge: AppTextStyles.displayLg(),
    headlineLarge: AppTextStyles.headlineLg(),
    headlineMedium: AppTextStyles.headlineMd(),
    titleLarge: AppTextStyles.titleLg(),
    titleMedium: AppTextStyles.titleMd(),
    bodyLarge: AppTextStyles.bodyLg(),
    bodyMedium: AppTextStyles.bodyMd(),
    labelLarge: AppTextStyles.labelLg(),
    labelMedium: AppTextStyles.labelMd(),
    labelSmall: AppTextStyles.labelSm(),
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surface.withValues(alpha: 0.85),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: AppTextStyles.titleMd(),
      iconTheme: const IconThemeData(color: AppColors.onSurface),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.surfaceContainerLow.withValues(alpha: 0.92),
      surfaceTintColor: Colors.transparent,
      indicatorColor: AppColors.primaryContainer,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppTextStyles.labelSm(color: AppColors.primaryContainer);
        }
        return AppTextStyles.labelSm(color: AppColors.onSurfaceVariant);
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: AppColors.onPrimary, size: 22);
        }
        return const IconThemeData(color: AppColors.onSurfaceVariant, size: 22);
      }),
      elevation: 0,
      height: 64,
    ),
    cardTheme: const CardThemeData(
      color: AppColors.surfaceContainerLow,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
    ),
    dividerTheme: const DividerThemeData(color: Colors.transparent),
  );
}
