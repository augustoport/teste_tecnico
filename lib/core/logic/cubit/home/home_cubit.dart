import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  void loadHomeData() {
    emit(HomeLoading());
    Future.delayed(Duration(seconds: 2), () {
      final user = FirebaseAuth.instance.currentUser;
      emit(HomeSuccess(user: user?.displayName));
    });
  }
}
