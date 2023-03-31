import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_tour_app/feature/splash/model/user_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../product/service/project_manager.dart';
import '../service/splash_service.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  late UserPrfoileResponse currentUser;
  SplashService service = SplashService(
      ProjectNetworkManager.instance.service, "/api/accounts/profile");
  Future<void> checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? token = prefs.getString("access");
    if (token != null) {
      try {
        dynamic user_info = await service.postUserToken({"token": token});
        if (user_info != null) {
          currentUser = user_info;
          emit(SplashSuccess(token: token));
        } else {
          emit(SplashFailure());
        }
      } catch (e) {
        // exception veya null dönerse olursa token süresi dolmuş demektir.
        emit(SplashFailure());
      }
    } else {
      emit(SplashFailure());
    }
  }
}
