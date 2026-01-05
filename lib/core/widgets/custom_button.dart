import 'package:flutter/material.dart';

import '../extensions/responsive_extensions.dart';
import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';

/// Production-ready button widget
///
/// PURPOSE:
/// - Consistent Figma-based styling
/// - Supports tablet and mobile sizes
/// - Clean integration with BLoC events
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;

  const CustomButton({super.key, 
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.black,
        textStyle: AppTextStyles.button,
        padding: EdgeInsets.symmetric(
          vertical: context.isTablet ? 20 : 14,
          horizontal: context.isTablet ? 40 : 24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(text),
    );
  }
}
