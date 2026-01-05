/// Standardized Failure class for use in repository and BLoC
///
/// PURPOSE:
/// - Converts exceptions into user-friendly failures
/// - Compatible with Either<L,R> from dartz for TDD
// ignore_for_file: unintended_html_in_doc_comment, dangling_library_doc_comments

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}
