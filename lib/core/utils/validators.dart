/// Common validation helpers used across the app.
///
/// WHY THIS EXISTS:
/// - Keeps UI widgets free from validation logic
/// - Ensures consistent validation rules
/// - Easy to test independently
///
/// USED IN:
/// - Login form (email & password validation)
///
/// FUTURE IMPROVEMENTS:
/// - Localization support
/// - Configurable rules per environment
class Validators {
  /* --------------------------------------------------------------------------
   * Boolean validators (logic-level)
   * -------------------------------------------------------------------------- */

  /// Basic email validation
  static bool isValidEmail(String value) {
    return value.isNotEmpty && value.contains('@');
  }

  /// Password validation
  ///
  /// Rule:
  /// - Minimum 6 characters (API requirement)
  static bool isValidPassword(String value) {
    return value.length >= 6;
  }

  
  /// Email validator for TextFormField
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    if (!isValidEmail(value.trim())) {
      return 'Enter a valid email address';
    }

    return null;
  }

  /// Password validator for TextFormField
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (!isValidPassword(value)) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }
}
