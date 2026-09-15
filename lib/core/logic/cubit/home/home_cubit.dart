import 'package:bloc/bloc.dart';
part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  void loadHomeData() {
    emit(HomeLoading());
    Future.delayed(Duration(seconds: 2), () {
      emit(HomeSuccess());
    });
  }
}
