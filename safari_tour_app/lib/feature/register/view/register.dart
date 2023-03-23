import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_tour_app/feature/login/view/login_view.dart';
import 'package:safari_tour_app/feature/register/cubit/register_cubit.dart';
import 'package:safari_tour_app/feature/register/service/register_service.dart';
import 'package:safari_tour_app/product/const/text/app_text.dart';
import 'package:safari_tour_app/product/extension/images/png/png_images.dart';
import 'package:safari_tour_app/product/extension/responsive/responsive.dart';
import 'package:safari_tour_app/product/service/project_manager.dart';

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
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
          formKey, emailController, passwordController,
          service: RegisterService(ProjectNetworkManager.instance.service,
              "/api/accounts/register")),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) async {
          if (state is RegisterLoaded) {
            state.navigate(context);
          }
        },
        builder: (context, state) {
          return buildMainBody(context, state);
        },
      ),
    );
  }

  Scaffold buildMainBody(BuildContext context, RegisterState state) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.transparent,
      ),
      body: Padding(
        padding: context.extremeAllPadding,
        child: Form(
          key: formKey,
          autovalidateMode: state is RegisterValidateState
              ? (state.isValidate
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled)
              : AutovalidateMode.disabled,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ImagePaths.safari.toWidget(context: context),
                ConstSpace(
                  height: context.dynamicHeight(0.05),
                ),
                buildRegisterText(context),
                const ConstSpace(),
                buildEmailTextfield(),
                const ConstSpace(),
                buildPasswordTextfield(),
                const ConstSpace(),
                buildRegisterButton(context),
                const ConstSpace(),
                buildBottomText(context),
              ],
            ),
          ),
        ),
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
      controller: emailController,
      validator: (value) => (value ?? "").contains("@") ? null : AppText.wrong,
      hintText: AppText.exampleMail,
      keyboardType: TextInputType.emailAddress,
    );
  }

  ProductTextField buildPasswordTextfield() {
    return ProductTextField(
      controller: passwordController,
      validator: (value) => (value ?? "").length > 5 ? null : "5ten kucuk",
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

  SizedBox buildRegisterButton(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: ActiveButton(
        label: AppText.register.toUpperCase(),
        onPressed: context.watch<RegisterCubit>().isLoading
            ? null
            : () {
                print("not nulll");
                context.read<RegisterCubit>().postUserRegisterModel();
              },
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
                builder: (context) => const LoginView(),
              )),
          child: Text(
            AppText.login,
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

extension LoginCompleteExtension on RegisterLoaded {
  void navigate(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginView()));
  }
}
