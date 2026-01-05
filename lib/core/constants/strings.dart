/// App-wide constant strings
///
/// PURPOSE:
/// - Centralized strings for UI, errors, and messages
/// - Easy to maintain and localize in future

// ignore_for_file: dangling_library_doc_comments

class AppStrings {
  // App name
  static const String appName = "POS App";

  // Login screen
  static const String loginTitle = "Login";
  static const String emailHint = "Enter your email";
  static const String passwordHint = "Enter your password";
  static const String loginButton = "Login";

  // Errors
  static const String invalidEmail = "Please enter a valid email";
  static const String emptyPassword = "Password cannot be empty";
  static const String loginFailed = "Login failed. Please try again";
  static const String networkError = "No internet connection";

  // POS
  static const String categoriesTitle = "Categories";
  static const String productsTitle = "Products";

  // Images
 // static const String placeholderImage = "assets/images/placeholder.png";

  // General
  static const String ok = "OK";
  static const String cancel = "Cancel";
}
