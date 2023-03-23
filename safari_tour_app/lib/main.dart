import 'package:flutter/material.dart';
import 'package:safari_tour_app/feature/splash/view/splash_view.dart';
import 'package:safari_tour_app/product/const/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: AppColors.primarySwatch,
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: AppColors.mainPrimary))),
      home: const SplashScreenView(),
    );
  }
}
