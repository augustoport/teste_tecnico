import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool rememberMe = false;
  bool register = false;

  void initPage() {
    emit(LoginLoading());
    Future.delayed(Duration(seconds: 1), () {
      emit(LoginSuccess(rememberMe: rememberMe, register: register));
    });
  }

  void toggleRememberMe() {
    rememberMe = !rememberMe;

    emit(LoginSuccess(rememberMe: rememberMe, register: register));
  }

  void changeRegister(bool value) {
    register = value;

    emit(LoginSuccess(rememberMe: rememberMe, register: register));
  }

  void setLoading() {
    emit(LoginLoading());
  }
}
