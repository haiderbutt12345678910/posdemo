import 'package:flutter/material.dart';
import '../extensions/context_extensions.dart';

/// Tablet/mobile adaptive grid
///
/// PURPOSE:
/// - Used for POS product/category grids
/// - Auto-adjusts columns based on device width
class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;

  const ResponsiveGrid({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    int columnCount = context.width >= 1024
        ? 6
        : context.width >= 600
            ? 4
            : 2;

    return GridView.count(
      crossAxisCount: columnCount,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: children,
    );
  }
}
