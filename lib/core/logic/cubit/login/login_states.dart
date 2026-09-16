part of 'login_cubit.dart';
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final bool rememberMe;
  final bool register;

  LoginSuccess({required this.rememberMe, required this.register});
}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
}
