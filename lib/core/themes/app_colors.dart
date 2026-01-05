import 'package:flutter/material.dart';

/// Centralized color palette for the app.

/// - Single source of truth for all colors
/// - Matches Figma design exactly
/// - Makes theme changes safe and fast



/// DESIGN SYSTEM:
/// Primary / Accent : #F4D03F (Yellow-Gold)
/// Background       : #F5F5F7 (Light Gray)
/// Card             : #FFFFFF (White)
/// Text (Primary)   : #1A1A1A (Dark)
/// Borders          : 8% opacity dark
/// Muted elements   : Soft gray
class AppColors {
  static const Color primary = Color(0xFFF4D03F);
  static const Color background = Color(0xFFF5F5F7);
  static const Color card = Color(0xFFFFFFFF);

  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textMuted = Color(0xFF9E9E9E);

  /// 8% opacity border for subtle separation
  static const Color border = Color(0x141A1A1A);
}
