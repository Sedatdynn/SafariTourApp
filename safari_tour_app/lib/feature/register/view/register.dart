import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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
  File? _image;

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(formKey, usernameController,
          emailController, passwordController, _image,
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
      body: Padding(
        padding: context.extremeAllPadding,
        child: buildFormBody(
          state,
          context,
        ),
      ),
    );
  }

  AppBar buildCustomAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.transparent,
      leading: Visibility(
        visible: context.watch<RegisterCubit>().isLoading,
        child: const CircularProgressIndicator(
          color: AppColors.mainPrimary,
        ),
      ),
    );
  }

  Form buildFormBody(
    RegisterState state,
    BuildContext context,
  ) {
    return Form(
      key: formKey,
      autovalidateMode: state is RegisterValidateState
          ? (state.isValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled)
          : AutovalidateMode.disabled,
      child: buildScrollBody(
        context,
      ),
    );
  }

  SingleChildScrollView buildScrollBody(
    BuildContext context,
  ) {
    Future getImage(ImageSource source) async {
      final xFileImage = await ImagePicker().pickImage(source: source);

      if (xFileImage == null) return;

      final imageTemporary = File(xFileImage.path);
      setState(() {
        _image = imageTemporary;
      });
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          ConstSpace(height: context.dynamicHeight(0.05)),
          buildRegisterText(context),
          const ConstSpace(),
          ClipOval(
            child: _image != null
                ? Image.file(
                    _image!,
                    height: 160,
                  )
                : ImagePaths.safari.toWidget(context: context),
          ),
          Padding(
            padding: context.lowAllPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ActiveButton(
                    label: "Pick from gallery",
                    onPressed: () {
                      getImage(ImageSource.gallery);
                    },
                    buttonColor: AppColors.white,
                    textColor: AppColors.button,
                  ),
                ),
                SizedBox(
                  width: context.dynamicWidth(0.02),
                ),
                Expanded(
                  child: ActiveButton(
                    label: "Pick from camera",
                    onPressed: () {
                      getImage(ImageSource.camera);
                    },
                  ),
                ),
              ],
            ),
          ),
          const ConstSpace(),
          buildUsernameTextfield(),
          const ConstSpace(),
          buildEmailTextfield(),
          const ConstSpace(),
          buildPasswordTextField(context),
          const ConstSpace(),
          buildRegisterButton(context),
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

  ProductTextField buildUsernameTextfield() {
    return ProductTextField(
      controller: usernameController,
      validator: (value) =>
          (value ?? "").length >= 4 ? null : AppText.invalidUsername,
      hintText: AppText.exampleUsername,
      keyboardType: TextInputType.text,
    );
  }

  ProductTextField buildEmailTextfield() {
    return ProductTextField(
      controller: emailController,
      validator: (value) =>
          (value ?? "").contains("@") ? null : AppText.invalidMail,
      hintText: AppText.exampleMail,
      keyboardType: TextInputType.emailAddress,
    );
  }

  ProductTextField buildPasswordTextField(BuildContext context) {
    return ProductTextField(
      controller: passwordController,
      validator: (value) =>
          (value ?? "").length >= 6 ? null : AppText.invalidPassword,
      hintText: AppText.password,
      keyboardType: TextInputType.emailAddress,
      secondIcon: Icons.visibility_outlined,
      firstIcon: Icons.visibility_off_outlined,
      passwordVisible: context.watch<RegisterCubit>().isVisible,
      onPressed: context.read<RegisterCubit>().changeVisible,
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
                context.read<RegisterCubit>().postUserRegisterModel(_image);
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
