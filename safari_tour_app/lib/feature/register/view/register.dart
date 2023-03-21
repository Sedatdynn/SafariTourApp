import 'package:flutter/material.dart';
import 'package:safari_tour_app/feature/launch/view/launch.dart';
import 'package:safari_tour_app/product/const/text/app_text.dart';
import 'package:safari_tour_app/product/extension/images/png/png_images.dart';
import 'package:safari_tour_app/product/extension/responsive/responsive.dart';

import '../../../product/const/theme/colors.dart';
import '../../../product/enums/images/image_enums.dart';
import '../../../product/widget/button/active_button.dart';
import '../../../product/widget/sizedBox/sized_box.dart';
import '../../../product/widget/textfield/auth_textfield.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.transparent,
      ),
      body: Padding(
        padding: context.extremeAllPadding,
        child: buildMainBody(context),
      ),
    );
  }

  SingleChildScrollView buildMainBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
              height: context.dynamicHeight(0.3),
              child: ImagePaths.safari.toWidget()),
          ConstSpace(
            height: context.dynamicHeight(0.05),
          ),
          buildRegisterText(context),
          const ConstSpace(),
          buildEmailTextfield(),
          const ConstSpace(),
          buildPasswordTextfield(),
          const ConstSpace(),
          buildLoginButton(context),
          const ConstSpace(),
          buildBottomText(context),
        ],
      ),
    );
  }

  Align buildRegisterText(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        AppText.register,
        style: Theme.of(context)
            .textTheme
            .headlineMedium
            ?.copyWith(color: AppColors.black),
      ),
    );
  }

  ProductTextField buildEmailTextfield() {
    return ProductTextField(
      controller: _emailController,
      validator: (value) => (value ?? "").contains("@") ? null : AppText.wrong,
      hintText: AppText.exampleMail,
      keyboardType: TextInputType.emailAddress,
    );
  }

  ProductTextField buildPasswordTextfield() {
    return ProductTextField(
      controller: _passwordController,
      validator: (value) => null,
      hintText: AppText.password,
      keyboardType: TextInputType.emailAddress,
      secondIcon: Icons.visibility_outlined,
      firstIcon: Icons.visibility_off_outlined,
      passwordVisible: isVisible,
      onPressed: () {
        setState(() {
          isVisible = !isVisible;
        });
      },
    );
  }

  SizedBox buildLoginButton(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: ActiveButton(
        label: AppText.register.toUpperCase(),
        onPressed: () {},
      ),
    );
  }

  buildBottomText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          AppText.haveAccount,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.darkGrey.withOpacity(0.4),
              ),
        ),
        InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LaunchView(),
              )),
          child: Text(
            AppText.login,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.button),
          ),
        ),
      ],
    );
  }
}
