import 'package:flutter/material.dart';
import 'package:flutter_application_sample/core/themes/app_colors.dart';

/// Generic loading spinner
///
/// PURPOSE:
/// - Can be used anywhere: login, POS products, categories
/// - Tablet-friendly size

class CustomeCircularProgressIndicator extends StatelessWidget {
  const CustomeCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.white.withOpacity(0.4), // semi-transparent overlay
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          color: AppColors.primary,
        ),
      ),
    );
  }
}
