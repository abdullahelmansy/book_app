import '../../data/model/request/login_model_params.dart';
import '../../data/model/request/register_model_parames.dart';

class AuthEvent {}

class LoginEvent extends AuthEvent {
  final LoginModelParams params;
  LoginEvent(this.params);
}

class RegisterEvent extends AuthEvent {
  final RegisterModelParames params;
  RegisterEvent(this.params);
}
class LogoutEvent extends AuthEvent {
  
}

class CheckEmailEvent extends AuthEvent {
  final String email;

  CheckEmailEvent(this.email);
}
class CheckOTPEvent extends AuthEvent {
  final String otp;

  CheckOTPEvent(this.otp);

}
class NewPasswordEvent extends AuthEvent {
  final String otp;
  final String newPassword;
  final String newConfirmPassword;

  NewPasswordEvent(this.otp, this.newPassword, this.newConfirmPassword);


}
