import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Centralized text styles.

/// - Ensures typography consistency across the app
/// - Prevents hard-coded font sizes in UI
/// - Makes tablet scaling easier
///
/// USED IN:
/// - Login screen
/// - POS category titles
/// - Product names & prices
class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle subHeading = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static const TextStyle muted = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: AppColors.textMuted,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
}
