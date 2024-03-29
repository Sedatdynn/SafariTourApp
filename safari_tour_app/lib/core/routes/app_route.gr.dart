// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i8;
import 'package:safari_tour_app/feature/home/home_shelf.dart' as _i7;
import 'package:safari_tour_app/feature/home/view/home_view.dart' as _i1;
import 'package:safari_tour_app/feature/launch/view/launch.dart' as _i2;
import 'package:safari_tour_app/feature/login/view/login_view.dart' as _i3;
import 'package:safari_tour_app/feature/register/register_shelf.dart' as _i9;
import 'package:safari_tour_app/feature/register/view/register_view.dart'
    as _i4;
import 'package:safari_tour_app/feature/splash/view/splash_view.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.HomeView(
          key: args.key,
          currentUser: args.currentUser,
        ),
      );
    },
    LaunchRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LaunchView(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LoginView(key: args.key),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.RegisterView(key: args.key),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashScreenView(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeView]
class HomeRoute extends _i6.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i7.Key? key,
    _i7.UserProfileResponse? currentUser,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            currentUser: currentUser,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<HomeRouteArgs> page =
      _i6.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.currentUser,
  });

  final _i7.Key? key;

  final _i7.UserProfileResponse? currentUser;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, currentUser: $currentUser}';
  }
}

/// generated route for
/// [_i2.LaunchView]
class LaunchRoute extends _i6.PageRouteInfo<void> {
  const LaunchRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LaunchRoute.name,
          initialChildren: children,
        );

  static const String name = 'LaunchRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginView]
class LoginRoute extends _i6.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i8.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<LoginRouteArgs> page =
      _i6.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.RegisterView]
class RegisterRoute extends _i6.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i9.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i6.PageInfo<RegisterRouteArgs> page =
      _i6.PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.SplashScreenView]
class SplashScreenRoute extends _i6.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
