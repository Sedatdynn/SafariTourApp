import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@immutable
class NavigateTo {
  const NavigateTo._();
  static push(BuildContext context, String targetRoute) {
    AutoRouter.of(context).pushNamed(targetRoute);
  }

  static popAndPush(BuildContext context, String targetRoute) {
    AutoRouter.of(context).popUntilRouteWithName(targetRoute);
  }

  static replace(BuildContext context, String targetRoute) {
    AutoRouter.of(context).replaceNamed(targetRoute);
  }
}
