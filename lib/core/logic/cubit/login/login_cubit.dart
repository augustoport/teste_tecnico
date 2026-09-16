import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool rememberMe = false;
  bool register = false;

  void toggleRememberMe() {
    rememberMe = !rememberMe;

    emit(LoginSuccess(rememberMe: rememberMe, register: register));
  }

  void changeRegister(bool value) {
    register = value;

    emit(LoginSuccess(rememberMe: rememberMe, register: register));
  }
}
