
import 'package:flutter/material.dart';

/// Responsive helper extensions.


/// - Simplifies responsive UI decisions
/// - Avoids magic numbers scattered in UI code
///
/// USED IN:
/// - Grid column decisions
/// - Padding & spacing adjustments for tablet
extension ResponsiveExtensions on BuildContext {
  /// Returns number of grid columns based on screen size
  int get gridColumnCount {
    final width = MediaQuery.of(this).size.width;

    if (width >= 1024) {
      return 6; // Large tablets / desktop
    } else if (width >= 600) {
      return 4; // Tablet
    } else {
      return 2; // Mobile
    }
  }

  /// Returns adaptive horizontal padding
  EdgeInsets get adaptivePadding {
    return EdgeInsets.symmetric(
      horizontal: isTablet ? 32 : 16,
      vertical: 16,
    );
  }

  bool get isTablet => MediaQuery.of(this).size.width >= 600;
}
