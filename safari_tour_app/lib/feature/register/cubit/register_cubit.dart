import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/service/project_manager.dart';
import '../service/register_service.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  File? image;

  bool isRegisterFail = false;
  bool isLoading = false;
  bool isVisible = true;
  RegisterService service = RegisterService(ProjectNetworkManager.instance.service);
  RegisterCubit(this.formKey, this.usernameController, this.emailController, this.passwordController, this.image,
      {required this.service})
      : super(RegisterInitial());

  Future<void> postUserRegisterModel(File? image) async {
    try {
      if (formKey.currentState != null && formKey.currentState!.validate()) {
        changeLoadingView();
        bool? data = await service.postUserRegister({
          "username": usernameController.text.trim(),
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
          "profile_image": image?.path,
        });
        if (data!) {
          emit(RegisterLoaded(data));
        } else {}
      } else {
        changeLoadingView();
        isRegisterFail = true;
        emit(RegisterValidateState(isRegisterFail));
      }
    } catch (e) {
      print(e);
    }
    changeLoadingView();
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(RegisterLoading(isLoading));
  }

  void changeVisible() {
    isVisible = !isVisible;
    emit(RegisterVisibleState(isVisible));
  }
}
