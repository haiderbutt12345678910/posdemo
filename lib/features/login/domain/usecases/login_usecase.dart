import '../repositories/login_repository.dart';

/// Handles login business logic
/// PURPOSE:
/// - Keeps feature layer clean
/// - Testable independently
class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<void> execute({required String email, required String password}) {
    return repository.login(email: email, password: password);
  }
}
