import 'package:auto_route/auto_route.dart';

import '../../product/enums/routes/routes_enum.dart';
import 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashScreenRoute.page, path: "/"),
    AutoRoute(
      page: LaunchRoute.page,
      path: RouteEnum.launch.withSlash,
    ),
    AutoRoute(page: LoginRoute.page, path: RouteEnum.login.withSlash),
    AutoRoute(page: RegisterRoute.page, path: RouteEnum.register.withSlash),
    AutoRoute(page: HomeRoute.page, path: RouteEnum.home.withSlash),
  ];
}
