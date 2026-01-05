
import 'package:flutter_application_sample/core/errors/auth_exception.dart';

import '../errors/exception.dart';

/// Maps exceptions into user-friendly messages
///
/// PURPOSE:
/// - Centralized error handling
/// - Ensures consistent messaging across UI and BLoC
class ErrorService {
  String mapToMessage(Exception e) {
    if (e is NetworkException) return e.message;
    if (e is ServerException) return e.message;
    if (e is CacheException) return e.message;
    if(e is AuthException) return e.message;
    return "An unexpected error occurred";
  }
}
