import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:safari_tour_app/core/theme/theme.dart';
import 'package:safari_tour_app/product/service/project_manager.dart';

import 'core/provider/multi_bloc_provider.dart';
import 'core/routes/app_route.dart';
import 'feature/home/cubit/home_cubit.dart';
import 'feature/home/service/home_service.dart';
import 'feature/splash/cubit/splash_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProviderWidget(
      homeCubit: HomeCubit(GeneralService(ProjectNetworkManager.instance.service))..fetchAllItems(),
      splashCubit: SplashCubit(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: const ITheme().appTheme,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: AutoRouterDelegate(_appRouter),
      ),
    );
  }
}
