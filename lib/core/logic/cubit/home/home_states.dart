part of 'home_cubit.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeSuccess extends HomeStates {
  String? user;

  HomeSuccess({this.user});
}

class HomeError extends HomeStates {}
