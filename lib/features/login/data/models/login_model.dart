import '../../domain/entities/login_entity.dart';

/// Maps API response to LoginEntity (token only)
/// FUTURE IMPROVEMENTS:
/// - Can use json_serializable or quicktype.io for auto-generated models
class LoginModel extends LoginEntity {
  const LoginModel({required super.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(token: json['token'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {"token": token};
  }
}
