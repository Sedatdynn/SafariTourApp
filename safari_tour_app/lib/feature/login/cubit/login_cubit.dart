import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/service/project_manager.dart';
import '../service/login_service.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  LoginService service = LoginService(
      ProjectNetworkManager.instance.service, "/api/accounts/login");
  bool isLoginFail = false;
  bool isLoading = false;
  LoginCubit(this.formKey, this.emailController, this.passwordController,
      {required this.service})
      : super(LoginInitial());

  Future<void> postUserModel() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();
      bool? data = await service.postUserLogin({
        "username": emailController.text.trim(),
        "password": passwordController.text.trim()
      });

      if (data!) {
        emit(LoginComplete(data));
      } else {}
    } else {
      changeLoadingView();
      isLoginFail = true;
      emit(LoginValidateState(isLoginFail));
    }
    changeLoadingView();
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(LoginLoadingState(isLoading));
  }
}
