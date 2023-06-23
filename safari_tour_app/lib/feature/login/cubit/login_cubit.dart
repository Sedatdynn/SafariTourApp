import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_tour_app/feature/login/model/login_request_model.dart';
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
  LoginCubit(this.formKey, this.usernameController, this.passwordController, {required this.service})
      : super(LoginInitial());

  Future<void> postUserModel() async {
    try {
      changeLoadingView();
      if (formKey.currentState != null && formKey.currentState!.validate()) {
        bool? data = await service.postUserLogin(
            LoginRequestModel(username: usernameController.text.trim(), password: passwordController.text.trim()));
        if (data!) {
          emit(LoginComplete(data));
        } else {}
      } else {
        isLoginFail = true;
        emit(LoginValidateState(isLoginFail));
        changeLoadingView();
      }
      changeLoadingView();
    } catch (e) {
      print(e);
    }
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
