class AuthState {}

class AuthInitial extends AuthState {}

//login
class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}
//error state
class ErrorState extends AuthState {
  final String error;
  ErrorState(this.error);
}
//register
class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

