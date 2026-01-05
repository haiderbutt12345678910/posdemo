// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:flutter_application_sample/core/services/api_service.dart';
// import 'package:flutter_application_sample/core/services/connectivity_service.dart';
// import 'package:flutter_application_sample/core/services/error_service.dart';
// import 'package:flutter_application_sample/core/services/token_service.dart';
// import 'package:flutter_application_sample/features/login/data/repositories/login_repository_impl.dart';

// /// --------------------
// /// MOCK CLASSES
// /// --------------------
// class MockApiService extends Mock implements ApiService {}
// class MockTokenService extends Mock implements TokenService {}
// class MockConnectivityService extends Mock implements ConnectivityService {}
// class MockErrorService extends Mock implements ErrorService {}

// /// Fake Exception for mocktail
// class ExceptionFake extends Fake implements Exception {}

// void main() {
//   setUpAll(() {
//     registerFallbackValue(ExceptionFake());
//   });

//   late LoginRepositoryImpl repository;
//   late MockApiService apiService;
//   late MockTokenService tokenService;
//   late MockConnectivityService connectivityService;
//   late MockErrorService errorService;

//   setUp(() {
//     apiService = MockApiService();
//     tokenService = MockTokenService();
//     connectivityService = MockConnectivityService();
//     errorService = MockErrorService();

//     repository = LoginRepositoryImpl(
//       apiService: apiService,
//       tokenService: tokenService,
//       connectivityService: connectivityService,
//       errorService: errorService,
//     );
//   });

//   const email = 'test@test.com';
//   const password = '123456';

//   test('✅ saves token when login is successful', () async {
//   // Arrange
//   when(() => connectivityService.ensureConnected()).thenReturn(null);

//   // Mock APIService post to return proper map
//   when(() => apiService.post(any(), data: any(named: 'data')))
//       .thenAnswer((_) async => {
//             'token': 'mock_token',
//             'message': 'User Successfully login', // important!
//           });

//   when(() => tokenService.saveToken(any())).thenReturn(null);
//   when(() => errorService.mapToMessage(any())).thenReturn('');

//   // Act
//   await repository.login(email: email, password: password);

//   // Assert
//   verify(() => tokenService.saveToken('mock_token')).called(1);
//   verify(() => apiService.post(any(), data: {'email': email, 'password': password})).called(1);
// });

// }
