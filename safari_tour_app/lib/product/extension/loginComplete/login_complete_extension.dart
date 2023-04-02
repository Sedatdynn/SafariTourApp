import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../feature/home/view/home_view.dart';
import '../../../feature/login/cubit/login_state.dart';
import '../../../feature/splash/service/splash_service.dart';
import '../../service/project_manager.dart';

extension LoginCompleteExtension on LoginComplete {
  void navigate(BuildContext context) async {
    SplashService service =
        SplashService(ProjectNetworkManager.instance.service);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? token = prefs.getString("access");
    dynamic user = await service.checkUserToken({"token": token});
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeView(currentUser: user)),
        (route) => false);
  }
}
