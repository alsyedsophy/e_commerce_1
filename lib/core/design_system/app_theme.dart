import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_elevation.dart';
import 'app_radius.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';

/// Application themes built from the design system tokens.
///
/// Both a light and a dark [ThemeData] are provided. Every component reads from
/// [Theme.of], so it adapts to the active theme automatically.
class AppTheme {
  AppTheme._();

  static ThemeData get light => _buildTheme(Brightness.light);

  static ThemeData get dark => _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness) {
    final bool isLight = brightness == Brightness.light;

    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.brand,
      brightness: brightness,
    );

    final TextTheme textTheme =
        isLight ? AppTextStyles.lightTextTheme : AppTextStyles.darkTextTheme;

    final OutlinedBorder buttonShape = RoundedRectangleBorder(
      borderRadius: AppRadius.mdRadius,
    );

    final EdgeInsetsGeometry buttonPadding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.lg,
      vertical: AppSpacing.md,
    );

    final EdgeInsetsGeometry inputPadding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.md,
      vertical: AppSpacing.sm,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        elevation: AppElevation.none,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        titleTextStyle: textTheme.titleLarge,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all(textTheme.labelMedium),
          shape: WidgetStateProperty.all(buttonShape),
          padding: WidgetStateProperty.all(buttonPadding),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all(textTheme.labelMedium),
          shape: WidgetStateProperty.all(buttonShape),
          padding: WidgetStateProperty.all(buttonPadding),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        contentPadding: inputPadding,
        border: OutlineInputBorder(
          borderRadius: AppRadius.mdRadius,
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.mdRadius,
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.mdRadius,
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.mdRadius,
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadius.mdRadius,
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: AppElevation.low,
        color: colorScheme.surfaceContainerLow,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.mdRadius,
        ),
        clipBehavior: Clip.antiAlias,
      ),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.lgRadius,
        ),
        elevation: AppElevation.high,
      ),
    );
  }
}
