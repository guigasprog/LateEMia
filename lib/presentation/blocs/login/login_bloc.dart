import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/login_usecase.dart';
import './login_event.dart';
import './login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        final token = await loginUseCase.login(
          username: event.username,
          password: event.password,
        );
        yield LoginSuccess(token: token);
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
