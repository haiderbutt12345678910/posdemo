import 'package:equatable/equatable.dart';

/// Represents the authentication token only
/// FUTURE IMPROVEMENTS:
/// - Can extend with user profile info later if needed
class LoginEntity extends Equatable {
  final String token;

  const LoginEntity({required this.token});

  @override
  List<Object?> get props => [token];
}
