import 'package:safari_tour_app/feature/home/home_shelf.dart';
import '../../../product/service/project_manager.dart';
import '../service/splash_service.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  late UserProfileResponse currentUser;
  SplashService service = SplashService(ProjectNetworkManager.instance.service);
  Future<void> checkToken(BuildContext context) async {
    final String? token = SharedManager.instance.getString(SharedKeys.access);
    if (token != null) {
      try {
        dynamic userInfo = await service.checkUserToken({"token": token});
        if (userInfo != null) {
          currentUser = userInfo;
          emit(SplashSuccess(token: token));
        } else {
          emit(SplashFailure());
        }
      } catch (e) {
        emit(SplashFailure());
      }
    } else {
      emit(SplashFailure());
      NavigateTo.replace(context, RouteEnum.launch.withSlash);
    }
  }
}
