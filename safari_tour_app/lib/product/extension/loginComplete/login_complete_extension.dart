import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/cache/shared_manager.dart';
import '../../../core/routes/app_route.gr.dart';
import '../../../feature/login/cubit/login_state.dart';
import '../../../feature/splash/service/splash_service.dart';
import '../../service/project_manager.dart';

extension LoginCompleteExtension on LoginComplete {
  void navigate(BuildContext context) async {
    SplashService service = SplashService(ProjectNetworkManager.instance.service);

    final String? token = SharedManager.instance.getString(SharedKeys.access);

    dynamic user = await service.checkUserToken({"token": token});
    if (context.mounted) {
      AutoRouter.of(context).pushAndPopUntil(
        HomeRoute(currentUser: user),
        predicate: (route) => false,
      );
    }
  }
}
