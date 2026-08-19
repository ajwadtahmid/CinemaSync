import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_spacing.dart';

/// Builds [ThemeData] for CinemaSync from the design tokens.
///
/// The designed dark theme is the primary experience (quiet, premium, Apple
/// TV-first). A seeded light theme is provided so the theme toggle in Settings
/// is functional; full light-mode polish is a later task.
class AppTheme {
  const AppTheme._();

  static ThemeData get dark => _buildDark();

  static ThemeData get light => _buildLight();

  static ThemeData _buildLight() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primarySeed,
        secondary: AppColors.secondarySeed,
        brightness: Brightness.light,
      ),
      fontFamily: 'Inter',
      splashFactory: InkSparkle.splashFactory,
    );
    final cs = base.colorScheme;
    final text = _textTheme(base.textTheme);

    return base.copyWith(
      textTheme: text,
      appBarTheme: _appBarTheme(cs, text, SystemUiOverlayStyle.dark),
      navigationBarTheme: _navigationBarTheme(cs, cs.surface),
      filledButtonTheme: _filledButtonTheme(),
      outlinedButtonTheme: _outlinedButtonTheme(cs, cs.outlineVariant),
      textButtonTheme: _textButtonTheme(cs),
      inputDecorationTheme: _inputDecorationTheme(cs, cs.surfaceContainerHigh),
      chipTheme: _chipTheme(cs, cs.surfaceContainerHigh, cs.outlineVariant),
      cardTheme: _cardTheme(null, cs.outlineVariant),
      dividerTheme: DividerThemeData(
        color: cs.outlineVariant,
        thickness: 1,
        space: 1,
      ),
      bottomSheetTheme: _bottomSheetTheme(null),
      dialogTheme: _dialogTheme(null),
      snackBarTheme: _snackBarTheme(cs, cs.inverseSurface),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      ),
    );
  }

  static ThemeData _buildDark() {
    final colorScheme = _darkScheme();

    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      fontFamily: 'Inter',
      splashFactory: InkSparkle.splashFactory,
    );

    const surfaceContainer = AppColors.darkSurface;
    const surfaceHigh = AppColors.darkSurfaceHigh;
    const border = AppColors.darkBorder;
    final text = _textTheme(base.textTheme);

    return base.copyWith(
      textTheme: text,
      appBarTheme: _appBarTheme(colorScheme, text, SystemUiOverlayStyle.light),
      navigationBarTheme: _navigationBarTheme(
        colorScheme,
        AppColors.darkBackground.withValues(alpha: 0.92),
      ),
      cardTheme: _cardTheme(surfaceContainer, border),
      filledButtonTheme: _filledButtonTheme(),
      outlinedButtonTheme: _outlinedButtonTheme(colorScheme, border),
      textButtonTheme: _textButtonTheme(colorScheme),
      inputDecorationTheme: _inputDecorationTheme(colorScheme, surfaceHigh),
      chipTheme: _chipTheme(colorScheme, surfaceHigh, border),
      dividerTheme: const DividerThemeData(
        color: border,
        thickness: 1,
        space: 1,
      ),
      bottomSheetTheme: _bottomSheetTheme(surfaceContainer),
      dialogTheme: _dialogTheme(surfaceContainer),
      snackBarTheme: _snackBarTheme(colorScheme, surfaceHigh),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      ),
    );
  }

  static ColorScheme _darkScheme() {
    return const ColorScheme.dark(
      primary: AppColors.primarySeed,
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFF252848),
      onPrimaryContainer: Color(0xFFE0E2FF),
      secondary: AppColors.secondarySeed,
      onSecondary: Color(0xFF00201C),
      secondaryContainer: Color(0xFF003F38),
      onSecondaryContainer: Color(0xFFA7F3E9),
      surface: AppColors.darkBackground,
      onSurface: Color(0xFFEEF1F7),
      surfaceContainerLowest: Color(0xFF06070B),
      surfaceContainerLow: AppColors.darkSurface,
      surfaceContainer: AppColors.darkSurface,
      surfaceContainerHigh: AppColors.darkSurfaceHigh,
      surfaceContainerHighest: Color(0xFF242938),
      onSurfaceVariant: AppColors.darkMuted,
      outline: AppColors.darkBorder,
      outlineVariant: AppColors.darkBorder,
      error: Color(0xFFFF6B6B),
      onError: Color(0xFF3A0000),
      errorContainer: Color(0xFF5C1A1A),
      onErrorContainer: Color(0xFFFFD9D6),
    );
  }

  // ---- component themes, shared by both brightnesses ----

  static AppBarTheme _appBarTheme(
    ColorScheme cs,
    TextTheme text,
    SystemUiOverlayStyle overlay,
  ) {
    return AppBarTheme(
      centerTitle: false,
      backgroundColor: cs.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: text.titleLarge?.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: -0.4,
      ),
      systemOverlayStyle: overlay,
    );
  }

  static NavigationBarThemeData _navigationBarTheme(
    ColorScheme cs,
    Color background,
  ) {
    return NavigationBarThemeData(
      height: AppSizes.navBarHeight,
      elevation: 0,
      backgroundColor: background,
      surfaceTintColor: Colors.transparent,
      indicatorColor: cs.primary.withValues(alpha: 0.16),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return TextStyle(
          fontSize: 11.5,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          letterSpacing: 0.1,
          color: selected ? cs.primary : cs.onSurfaceVariant,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return IconThemeData(
          size: 24,
          color: selected ? cs.primary : cs.onSurfaceVariant,
        );
      }),
    );
  }

  static CardThemeData _cardTheme(Color? color, Color border) {
    return CardThemeData(
      clipBehavior: Clip.antiAlias,
      color: color,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: BorderSide(color: border),
      ),
    );
  }

  static FilledButtonThemeData _filledButtonTheme() {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(AppSizes.buttonHeightLg),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.2,
        ),
      ),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme(
    ColorScheme cs,
    Color border,
  ) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(AppSizes.buttonHeightMd),
        foregroundColor: cs.onSurface,
        side: BorderSide(color: border),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
        ),
      ),
    );
  }

  static TextButtonThemeData _textButtonTheme(ColorScheme cs) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: cs.primary,
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme(
    ColorScheme cs,
    Color fill,
  ) {
    return InputDecorationTheme(
      filled: true,
      fillColor: fill,
      hintStyle: TextStyle(color: cs.onSurfaceVariant),
      prefixIconColor: cs.onSurfaceVariant,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.pill),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.pill),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.pill),
        borderSide: BorderSide(color: cs.primary, width: 1.5),
      ),
    );
  }

  static ChipThemeData _chipTheme(ColorScheme cs, Color fill, Color border) {
    return ChipThemeData(
      backgroundColor: fill,
      selectedColor: cs.primary.withValues(alpha: 0.18),
      side: BorderSide(color: border),
      labelStyle: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: cs.onSurface,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
    );
  }

  static BottomSheetThemeData _bottomSheetTheme(Color? background) {
    return BottomSheetThemeData(
      backgroundColor: background,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
    );
  }

  static DialogThemeData _dialogTheme(Color? background) {
    return DialogThemeData(
      backgroundColor: background,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
    );
  }

  static SnackBarThemeData _snackBarTheme(ColorScheme cs, Color background) {
    return SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: background,
      contentTextStyle: TextStyle(color: cs.onSurface),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
    );
  }

  /// Tightens the type ramp for a more editorial, modern feel: bold headlines
  /// with negative tracking, comfortable body text.
  static TextTheme _textTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: base.displayLarge
          ?.copyWith(fontWeight: FontWeight.w800, letterSpacing: -1.2),
      displayMedium: base.displayMedium
          ?.copyWith(fontWeight: FontWeight.w800, letterSpacing: -1.0),
      displaySmall: base.displaySmall
          ?.copyWith(fontWeight: FontWeight.w700, letterSpacing: -0.6),
      headlineLarge: base.headlineLarge
          ?.copyWith(fontWeight: FontWeight.w800, letterSpacing: -0.8),
      headlineMedium: base.headlineMedium
          ?.copyWith(fontWeight: FontWeight.w700, letterSpacing: -0.6),
      headlineSmall: base.headlineSmall
          ?.copyWith(fontWeight: FontWeight.w700, letterSpacing: -0.4),
      titleLarge: base.titleLarge
          ?.copyWith(fontWeight: FontWeight.w700, letterSpacing: -0.3),
      titleMedium: base.titleMedium
          ?.copyWith(fontWeight: FontWeight.w700, letterSpacing: -0.2),
      titleSmall: base.titleSmall?.copyWith(fontWeight: FontWeight.w600),
      labelLarge: base.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      bodyLarge: base.bodyLarge?.copyWith(height: 1.45),
      bodyMedium: base.bodyMedium?.copyWith(height: 1.45),
    );
  }
}
