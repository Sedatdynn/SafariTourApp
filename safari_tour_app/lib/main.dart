import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_tour_app/core/theme/theme.dart';
import 'package:safari_tour_app/feature/splash/view/splash_view.dart';
import 'package:safari_tour_app/product/service/project_manager.dart';

import 'feature/home/cubit/home_cubit.dart';
import 'feature/home/service/home_service.dart';
import 'feature/splash/cubit/splash_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => HomeCubit(
                GeneralService(ProjectNetworkManager.instance.service))
              ..fetchAllItems()),
        BlocProvider(
          create: (context) => SplashCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: const ITheme().appTheme,
        home: const SplashScreenView(),
      ),
    );
  }
}
