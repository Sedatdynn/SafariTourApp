import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  Future<void> checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? token = prefs.getString("access");
    if (token != null) {
      // api/accounts/profile token ile post request
      // 200 status ise home page'e aktar
      emit(SplashSuccess(token: token));
    } else {
      emit(SplashFailure());
    }
  }
}
