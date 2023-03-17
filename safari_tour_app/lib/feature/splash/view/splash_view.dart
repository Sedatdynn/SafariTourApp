import 'dart:async';

import 'package:flutter/material.dart';
import 'package:safari_tour_app/product/extension/responsive/responsive.dart';

import '../../../product/const/duration/duration.dart';
import '../../../product/const/theme/colors.dart';
import '../../launch/view/launch.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  bool _isVisible = false;

  _SplashScreenViewState() {
    buildFirstTimer();
    buildSecondTimer();
  }

  Timer buildFirstTimer() {
    return Timer(Durations.slow, () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LaunchView()),
            (route) => false);
      });
    });
  }

  Timer buildSecondTimer() {
    return Timer(Durations.tooFast, () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildStack(context);
  }

  Stack buildStack(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [buildContainer(), _bottomItems(context)],
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
      duration: Durations.slow,
      child: Center(
        child: ClipOval(
            // child: ImagePaths.logo.toWidget(),
            ),
      ),
    );
  }

  Positioned _bottomItems(BuildContext context) {
    return Positioned(
      bottom: context.dynamicHeight(0.05),
      child: Row(
        children: [
          // ImagePaths.flash.toWidget(),
          // ImagePaths.tech.toWidget(),
        ],
      ),
    );
  }
}
