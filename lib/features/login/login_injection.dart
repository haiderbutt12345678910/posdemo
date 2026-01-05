

import 'package:flutter_application_sample/core/di/injection_container.dart';
import 'package:flutter_application_sample/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_application_sample/features/login/domain/repositories/login_repository.dart' show LoginRepository;
import 'package:flutter_application_sample/features/login/domain/usecases/login_usecase.dart' show LoginUseCase;
import 'package:flutter_application_sample/features/login/presentation/bloc/login_bloc.dart' show LoginBloc;

/// Registers Login feature dependencies
///
/// WHY THIS EXISTS:
/// - Keeps feature isolated
/// - Allows independent feature testing
/// - Clean separation from core
void registerLoginFeature() {
  // Bloc
  sl.registerFactory(
    () => LoginBloc(
      loginUseCase: sl(),
      errorService: sl(),
    ),
  );

    // Use case
  sl.registerLazySingleton(() => LoginUseCase(sl()));
 
 sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(apiService: sl.call(), tokenService: sl.call(), connectivityService: sl.call(), errorService: sl.call()));
 
}
