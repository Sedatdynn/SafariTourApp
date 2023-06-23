import 'package:flutter/material.dart';
import '../../../product/extension/images/svg/svg_images.dart';
import '../../../product/extension/responsive/responsive.dart';

import '../../../product/const/text/app_text.dart';
import '../../../product/const/theme/colors.dart';
import '../../../product/enums/images/image_enums.dart';
import '../../../product/utility/button/active_button.dart';
import '../../login/view/login_view.dart';
import '../../register/view/register.dart';

class LaunchView extends StatefulWidget {
  const LaunchView({Key? key}) : super(key: key);

  @override
  State<LaunchView> createState() => _LaunchViewState();
}

class _LaunchViewState extends State<LaunchView> {
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
            child: buildLoginButton(),
          ),
          SizedBox(
            width: context.dynamicWidth(0.02),
          ),
          Expanded(
            child: buildRegisterButton(),
          ),
        ],
      ),
    );
  }

  ActiveButton buildLoginButton() {
    return ActiveButton(
      label: AppText.login,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginView(),
          ),
        );
      },
      buttonColor: AppColors.white,
      textColor: AppColors.button,
    );
  }

  ActiveButton buildRegisterButton() {
    return ActiveButton(
      label: AppText.register,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RegisterView(),
          ),
        );
      },
    );
  }
}
