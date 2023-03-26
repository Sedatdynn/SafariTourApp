import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_tour_app/feature/login/service/login_service.dart';
import 'package:safari_tour_app/feature/register/view/register.dart';
import 'package:safari_tour_app/product/const/text/app_text.dart';
import 'package:safari_tour_app/product/extension/images/png/png_images.dart';
import 'package:safari_tour_app/product/extension/responsive/responsive.dart';
import 'package:safari_tour_app/product/service/project_manager.dart';

import '../../../product/const/theme/colors.dart';
import '../../../product/enums/images/image_enums.dart';
import '../../../product/widget/button/active_button.dart';
import '../../../product/widget/sizedBox/sized_box.dart';
import '../../../product/widget/textfield/auth_textfield.dart';
import '../../home/view/home_view.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
          formKey, emailController, passwordController,
          service: LoginService(
              ProjectNetworkManager.instance.service, "/api/accounts/login")),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state is LoginComplete) {
            state.navigate(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.transparent,
              leading: Visibility(
                visible: context.watch<LoginCubit>().isLoading,
                child: const CircularProgressIndicator(
                  color: AppColors.button,
                ),
              ),
            ),
            body: buildFormBody(state, context),
          );
        },
      ),
    );
  }

  Form buildFormBody(LoginState state, BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: state is LoginValidateState
          ? (state.isValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled)
          : AutovalidateMode.disabled,
      child: Padding(
        padding: context.extremeAllPadding,
        child: buildMainBody(context),
      ),
    );
  }

  SingleChildScrollView buildMainBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ImagePaths.safari.toWidget(context: context),
          ConstSpace(
            height: context.dynamicHeight(0.05),
          ),
          buildLoginText(context),
          const ConstSpace(),
          buildEmailTextfield(),
          const ConstSpace(),
          buildPasswordTextfield(context),
          const ConstSpace(),
          buildLoginButton(context),
          const ConstSpace(),
          buildBottomText(context),
        ],
      ),
    );
  }

  Align buildLoginText(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        AppText.login,
        style: Theme.of(context)
            .textTheme
            .headlineMedium
            ?.copyWith(color: AppColors.black),
      ),
    );
  }

  ProductTextField buildEmailTextfield() {
    return ProductTextField(
      controller: emailController,
      validator: (value) =>
          ((value ?? "").length > 2) ? null : AppText.invalidMail,
      hintText: AppText.exampleMail,
      keyboardType: TextInputType.emailAddress,
    );
  }

  ProductTextField buildPasswordTextfield(BuildContext context) {
    return ProductTextField(
        controller: passwordController,
        validator: (value) =>
            (value ?? "").length >= 6 ? null : AppText.invalidPassword,
        hintText: AppText.password,
        keyboardType: TextInputType.emailAddress,
        secondIcon: Icons.visibility_outlined,
        firstIcon: Icons.visibility_off_outlined,
        passwordVisible: context.watch<LoginCubit>().isVisible,
        onPressed: context.read<LoginCubit>().changeVisible);
  }

  buildLoginButton(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          width: context.width,
          child: ActiveButton(
            label: AppText.login.toUpperCase(),
            onPressed: context.watch<LoginCubit>().isLoading
                ? null
                : () {
                    context.read<LoginCubit>().postUserModel();
                  },
          ),
        );
      },
    );
  }

  buildBottomText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          AppText.doNotHaveAccount,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.darkGrey.withOpacity(0.4),
              ),
        ),
        InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterView(),
              )),
          child: Text(
            AppText.register,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.mainPrimary),
          ),
        ),
      ],
    );
  }
}

extension LoginCompleteExtension on LoginComplete {
  void navigate(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomeView()));
  }
}
