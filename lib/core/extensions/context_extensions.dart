import 'package:flutter/material.dart';

/// Extensions on BuildContext used across the app.

/// - Reduces repetitive MediaQuery and Theme lookups
/// - Makes UI code cleaner and more readable
/// - Centralizes device & layout related helpers
///
/// USED IN:
/// - Login screen
/// - POS main screen
/// - Tablet responsive layouts
extension ContextExtensions on BuildContext {
  /// Screen width
  double get width => MediaQuery.of(this).size.width;

  /// Screen height
  double get height => MediaQuery.of(this).size.height;

  /// Quick access to ThemeData
  ThemeData get theme => Theme.of(this);

  /// Quick access to TextTheme
  TextTheme get textTheme => theme.textTheme;

  /// Determines if the device should be treated as tablet
  bool get isTablet => width >= 600;
}
