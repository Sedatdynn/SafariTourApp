part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {
  bool isLoading;
  RegisterLoading(this.isLoading);
}

class RegisterVisibleState extends RegisterState {
  bool isVisible;
  RegisterVisibleState(this.isVisible);
}

class RegisterValidateState extends RegisterState {
  final bool isValidate;
  RegisterValidateState(this.isValidate);
}

class RegisterLoaded extends RegisterState {
  final bool? data;
  RegisterLoaded(this.data);
}

class RegisterError extends RegisterState {
  final String message;
  RegisterError(this.message);
}

class RegisterImageLoaded extends RegisterState {
  final File? image;

  RegisterImageLoaded(this.image);
}
