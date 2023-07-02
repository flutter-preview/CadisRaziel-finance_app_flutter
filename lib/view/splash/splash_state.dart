
abstract class SplashState {}

class SplashInitialState extends SplashState {}

class SplashLoadingState extends SplashState {}

class SplashSucessState extends SplashState {}

class SplashErrorState extends SplashState {
  final String message;
  SplashErrorState(this.message);
}