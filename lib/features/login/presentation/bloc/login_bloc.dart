import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/error_service.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../../domain/usecases/login_usecase.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final ErrorService errorService;

  LoginBloc({required this.loginUseCase, required this.errorService}) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        await loginUseCase.execute(email: event.email, password: event.password);
        emit(LoginSuccess());
      } catch (e) {
        print(e.toString());
        emit(LoginFailure(errorService.mapToMessage(e as Exception)));
      }
    });
  }
}
