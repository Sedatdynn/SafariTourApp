import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/home/cubit/home_cubit.dart';
import '../../feature/splash/cubit/splash_cubit.dart';

class MultiBlocProviderWidget extends StatelessWidget {
  const MultiBlocProviderWidget({
    Key? key,
    required this.homeCubit,
    required this.splashCubit,
    required this.child,
  }) : super(key: key);

  final HomeCubit homeCubit;
  final SplashCubit splashCubit;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: homeCubit),
        BlocProvider.value(value: splashCubit),
      ],
      child: child,
    );
  }
}
