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
//logout
class LogoutLoadingState extends AuthState {}

class LogoutSuccessState extends AuthState {}
//CheckEmail
class CheckEmailLoadingState extends AuthState {}

class CheckEmailSuccessState extends AuthState {}
//Checkotp
class CheckOTPLoadingState extends AuthState {}

class CheckOTPSuccessState extends AuthState {}
//new password
class NewPasswordLoadingState extends AuthState {}

class NewPasswordSuccessState extends AuthState {}
