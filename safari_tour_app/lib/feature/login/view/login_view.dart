import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/enums/routes/routes_enum.dart';
import '../../../product/utility/navigate/navigate.dart';
import '../login_shelf.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(formKey, usernameController, passwordController,
          service: LoginService(ProjectNetworkManager.instance.service)),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state is LoginComplete) {
            state.navigate(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: buildCustomAppBar(context),
            body: buildFormBody(state, context),
          );
        },
      ),
    );
  }

  AppBar buildCustomAppBar(BuildContext context) {
    return AppBar(
      leading: Visibility(
        visible: context.watch<LoginCubit>().isLoading,
        child: const CircularProgressIndicator(
          color: AppColors.button,
        ),
      ),
    );
  }

  Form buildFormBody(LoginState state, BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: state is LoginValidateState
          ? (state.isValidate ? AutovalidateMode.always : AutovalidateMode.disabled)
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
          buildUsernameTextfield(),
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
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.black),
      ),
    );
  }

  ProductTextField buildUsernameTextfield() {
    return ProductTextField(
      controller: usernameController,
      validator: (value) => (value ?? "").length >= 4 ? null : AppText.invalidUsername,
      hintText: AppText.exampleUsername,
      keyboardType: TextInputType.text,
    );
  }

  ProductTextField buildPasswordTextfield(BuildContext context) {
    return ProductTextField(
        controller: passwordController,
        validator: (value) => (value ?? "").length >= 6 ? null : AppText.invalidPassword,
        hintText: AppText.password,
        keyboardType: TextInputType.emailAddress,
        secondIcon: Icons.visibility_outlined,
        firstIcon: Icons.visibility_off_outlined,
        passwordVisible: context.watch<LoginCubit>().isVisible,
        onPressed: context.read<LoginCubit>().changeVisible);
  }

  Widget buildLoginButton(BuildContext context) {
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

  Widget buildBottomText(BuildContext context) {
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
          onTap: () => NavigateTo.push(context, RouteEnum.register.withSlash),
          child: Text(
            AppText.register,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.mainPrimary),
          ),
        ),
      ],
    );
  }
}
