import 'dart:io';

import '../../../../core/errors/auth_exception.dart';
import '../../../../core/errors/exception.dart' show NetworkException, ServerException, CacheException;
import '../../../../core/services/api_service.dart';
import '../../../../core/services/connectivity_service.dart';
import '../../../../core/services/error_service.dart';
import '../../../../core/services/network_config.dart';
import '../../../../core/services/token_service.dart';
import '../../domain/repositories/login_repository.dart';
import '../models/login_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final ApiService apiService;
  final TokenService tokenService;
  final ConnectivityService connectivityService;
  final ErrorService errorService;

  LoginRepositoryImpl({
    required this.apiService,
    required this.tokenService,
    required this.connectivityService,
    required this.errorService,
  });

@override
Future<void> login({
  required String email,
  required String password,
}) async {
  // Check internet connectivity first
  
if (!isInternetAvailable) {
    throw NetworkException("No internet connection");
  }
  try {

    
    // Call the API
    final response = await apiService.post(
      NetworkConfig.login(),
      data: {
        "email": email,
        "password": password,
      },
    );


    // Read API response safely
    final bool success = response['success'] as bool? ?? false;
    final String message = response['message'] as String? ?? 'Login failed';

    // If API indicates failure, throw AuthException
    if (!success) {
      throw AuthException(message);
    }

    // If successful, parse model and save token
    final model = LoginModel.fromJson(response);
    tokenService.saveToken(model.token);

  } catch (e) {
   if (e is Exception) {
    // Already an Exception type we handle
    rethrow;
  }
  
  
   else {
    // Wrap unknown errors
    throw Exception(errorService.mapToMessage(Exception(e.toString())));
  }
}
}

  
  }
