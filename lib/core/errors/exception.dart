/// Custom exceptions for API and app-level errors

/// PURPOSE:
/// - Wrap low-level errors
/// - Make them readable & testable
/// - Decouples external packages (like Dio) from app

// ignore_for_file: dangling_library_doc_comments

class ServerException implements Exception {
  final String message;

  ServerException([this.message = "Server error occurred"]);

  @override
  String toString() => message; // <-- ensures readable output
}

class CacheException implements Exception {
  final String message;

  CacheException([this.message = "Cache error occurred"]);

  @override
  String toString() => message;
}

class NetworkException implements Exception {
  final String message;

  NetworkException([this.message = "No internet connection"]);

  @override
  String toString() => message;
}