abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginComplete extends LoginState {
  final bool? model;
  LoginComplete(this.model);
}

class LoginValidateState extends LoginState {
  final bool isValidate;
  LoginValidateState(this.isValidate);
}

class LoginLoadingState extends LoginState {
  bool isLoading;
  LoginLoadingState(this.isLoading);
}

class LoginVisibleState extends LoginState {
  bool isVisible;
  LoginVisibleState(this.isVisible);
}
