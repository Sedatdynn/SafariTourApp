import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_tour_app/core/routes/app_route.gr.dart';
import 'package:safari_tour_app/product/extension/images/png/png_images.dart';

import '../../../product/const/duration/duration.dart';
import '../../../product/const/theme/colors.dart';
import '../../../product/enums/images/image_enums.dart';
import '../../../product/enums/routes/routes_enum.dart';
import '../../../product/utility/navigate/navigate.dart';
import '../cubit/splash_cubit.dart';

@RoutePage()
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
    context.read<SplashCubit>().checkToken(context);
  }

  Timer buildFirstTimer() {
    return Timer(Durations.tooSlow, () {
      AutoRouter.of(context).replace(HomeRoute(currentUser: context.read<SplashCubit>().currentUser));
    });
  }

  Timer buildLaunchTimer() {
    return Timer(Durations.fast, () {
      NavigateTo.replace(context, RouteEnum.launch.withSlash);
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
