import 'dart:developer';

/// Simple logging utility.

/// - Centralizes logging behavior
/// - Makes it easy to disable or redirect logs later
/// - Keeps debug prints consistent
///
/// USED IN:
/// - Network calls
/// - Bloc state transitions
class AppLogger {
  static void logInfo(String message) {
    log('[INFO] $message');
  }

  static void logError(String message, {Object? error}) {
    log('[ERROR] $message', error: error);
  }
}
