import 'package:flutter/material.dart';
import ' breakpoints.dart';

/// SizeConfig provides tablet/mobile responsive helpers
///
/// PURPOSE:
/// - Makes layout adaptive across devices
/// - Used by POS grids, buttons, paddings, and widgets
class SizeConfig {
  final BuildContext context;
  final double width;
  final double height;
  final bool isMobile;
  final bool isTablet;
  final bool isDesktop;

  SizeConfig(this.context)
      : width = MediaQuery.of(context).size.width,
        height = MediaQuery.of(context).size.height,
        isMobile = MediaQuery.of(context).size.width < Breakpoints.mobile,
        isTablet = MediaQuery.of(context).size.width >= Breakpoints.mobile &&
            MediaQuery.of(context).size.width < Breakpoints.desktop,
        isDesktop = MediaQuery.of(context).size.width >= Breakpoints.desktop;

  /// Adaptive width (percentage of screen width)
  double wp(double percentage) => width * percentage / 100;

  /// Adaptive height (percentage of screen height)
  double hp(double percentage) => height * percentage / 100;

  /// Adaptive padding example
  EdgeInsets adaptivePadding({
    double left = 2,
    double top = 2,
    double right = 2,
    double bottom = 2,
  }) {
    return EdgeInsets.fromLTRB(
      wp(left),
      hp(top),
      wp(right),
      hp(bottom),
    );
  }
}
