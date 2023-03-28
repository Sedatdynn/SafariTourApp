import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_tour_app/feature/home/view/home_view.dart';
import 'package:safari_tour_app/product/extension/images/png/png_images.dart';

import '../../../product/const/duration/duration.dart';
import '../../../product/const/theme/colors.dart';
import '../../../product/enums/images/image_enums.dart';
import '../../launch/view/launch.dart';
import '../cubit/splash_cubit.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    buildSecondTimer();
    context.read<SplashCubit>().checkToken();
  }

  Timer buildFirstTimer() {
    return Timer(Durations.tooSlow, () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeView()),
          (route) => false);
    });
  }

  Timer buildLaunchTimer() {
    return Timer(Durations.fast, () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LaunchView()),
          (route) => false);
    });
  }

  Timer buildSecondTimer() {
    return Timer(Durations.fast, () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashSuccess) {
          buildFirstTimer();
        } else if (state is SplashFailure) {
          buildLaunchTimer();
        }
      },
      child: buildContainer(),
    );
  }

  Container buildContainer() {
    return Container(
      decoration: buildBoxDecoration(),
      child: buildAnimatedOpacity(),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [AppColors.mainPrimary, AppColors.button],
        begin: FractionalOffset(0, 0),
        end: FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      ),
    );
  }

  AnimatedOpacity buildAnimatedOpacity() {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0,
      duration: Durations.fast,
      child: Center(
        child: ClipOval(
          child: ImagePaths.safari.toWidget(context: context),
        ),
      ),
    );
  }
}
