import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:safari_tour_app/product/enums/routes/routes_enum.dart';
import 'package:safari_tour_app/product/utility/navigate/navigate.dart';
import '../../../core/routes/app_route.gr.dart';
import '../../../product/extension/images/svg/svg_images.dart';
import '../../../product/extension/responsive/responsive.dart';

import '../../../product/const/text/app_text.dart';
import '../../../product/const/theme/colors.dart';
import '../../../product/enums/images/image_enums.dart';
import '../../../product/utility/button/active_button.dart';

@RoutePage()
class LaunchView extends StatelessWidget {
  const LaunchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildScaffoldBody(context),
    );
  }

  Column buildScaffoldBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [buildLaunchImage(context), buildButtonsField(context)],
    );
  }

  SizedBox buildLaunchImage(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.dynamicHeight(0.8),
      child: ImagePaths.welcome.toSvg(context: context),
    );
  }

  Padding buildButtonsField(BuildContext context) {
    return Padding(
      padding: context.midAllPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: buildLoginButton(context),
          ),
          SizedBox(
            width: context.dynamicWidth(0.02),
          ),
          Expanded(
            child: buildRegisterButton(context),
          ),
        ],
      ),
    );
  }

  ActiveButton buildLoginButton(BuildContext context) {
    return ActiveButton(
      label: AppText.login,
      onPressed: () => NavigateTo.push(context, RouteEnum.login.withSlash),
      buttonColor: AppColors.white,
      textColor: AppColors.button,
    );
  }

  ActiveButton buildRegisterButton(BuildContext context) {
    return ActiveButton(
        label: AppText.register, onPressed: () => NavigateTo.push(context, RouteEnum.register.withSlash));
  }
}
