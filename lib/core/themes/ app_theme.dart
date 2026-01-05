import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

/// Global application theme.
///
/// - Single entry point for app-wide theming
/// - Aligns Material components with Figma design
/// - Ensures consistent look across all screens
class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,

      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      cardColor: AppColors.card,

      textTheme: const TextTheme(
        headlineSmall: AppTextStyles.heading,
        titleMedium: AppTextStyles.subHeading,
        bodyMedium: AppTextStyles.body,
        bodySmall: AppTextStyles.muted,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.black,
          textStyle: AppTextStyles.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),

      cardTheme: CardThemeData(
        color: AppColors.card,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.border),
        ),
      ),
    );
  }
}
