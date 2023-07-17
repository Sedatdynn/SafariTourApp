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
class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  build(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) {
        print(state);
      },
      builder: (context, state) {
        print(state);

        switch (state) {
          case SplashFailure():
            Timer(Durations.slow, () {
              NavigateTo.replace(context, RouteEnum.launch.withSlash);
            });
            break;

          case SplashSuccess():
            Timer(Durations.slow, () {
              AutoRouter.of(context).replace(HomeRoute(currentUser: context.read<SplashCubit>().currentUser));
            });
            break;
          case SplashLoading():
            Timer(Durations.fast, () {
              NavigateTo.replace(context, RouteEnum.launch.withSlash);
            });
            break;

          default:
            print(state);
        }

        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.mainPrimary, AppColors.button],
              begin: FractionalOffset(0, 0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: BlocBuilder<SplashCubit, SplashState>(
            builder: (context, state) {
              return AnimatedOpacity(
                opacity: context.watch<SplashCubit>().isVisible ? 1.0 : 0,
                duration: Durations.tooSlow,
                child: Center(
                  child: ClipOval(
                    child: ImagePaths.safari.toWidget(context: context),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
