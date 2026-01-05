import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../services/api_service.dart';
import '../services/token_service.dart';
import '../services/error_service.dart';
import '../services/connectivity_service.dart';
import '../services/network_config.dart';

final sl = GetIt.instance;

/// Registers all core/shared dependencies
///
/// WHY THIS EXISTS:
/// - Single source of truth for app-wide dependencies
/// - Easy mocking for tests
/// - Prevents duplicate heavy instances
Future<void> init() async {



  // Dio
  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: NetworkConfig.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    ),
  );


  

 

  // Core Services
  sl.registerLazySingleton<TokenService>(() => TokenService());
  sl.registerLazySingleton<ConnectivityService>(() => ConnectivityService());
  sl.registerLazySingleton<ErrorService>(() => ErrorService());

  sl.registerLazySingleton<ApiService>(
    () => ApiService(sl<Dio>(), sl<TokenService>()),
  );
  


  
  
}
