part of 'splash_cubit.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashSuccess extends SplashState {
  final String? token;
  SplashSuccess({required this.token});
}

class SplashFailure extends SplashState {
  final String message;
  SplashFailure(this.message);
}

class SplashLoading extends SplashState {
  bool? isVisible;
  SplashLoading(this.isVisible);
}
