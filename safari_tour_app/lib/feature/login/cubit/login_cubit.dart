import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/service/project_manager.dart';
import '../service/login_service.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  LoginService service = LoginService(ProjectNetworkManager.instance.service);
  bool isLoginFail = false;
  bool isLoading = false;
  bool isVisible = true;
  LoginCubit(this.formKey, this.usernameController, this.passwordController,
      {required this.service})
      : super(LoginInitial());

  Future<void> postUserModel() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();
      bool? data = await service.postUserLogin({
        "username": usernameController.text.trim(),
        "password": passwordController.text.trim()
      });

      if (data!) {
        emit(LoginComplete(data));
      } else {}
    } else {
      isLoginFail = true;
      emit(LoginValidateState(isLoginFail));
      changeLoadingView();
    }
    changeLoadingView();
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(LoginLoadingState(isLoading));
  }

  void changeVisible() {
    isVisible = !isVisible;
    emit(LoginVisibleState(isVisible));
  }
}
