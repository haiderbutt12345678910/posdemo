
/// Abstract repository interface for Login
/// PURPOSE:
/// - Decouples domain logic from data layer
/// - Enables mocking for TDD
abstract class LoginRepository {
  Future<void> login({required String email, required String password});
}


