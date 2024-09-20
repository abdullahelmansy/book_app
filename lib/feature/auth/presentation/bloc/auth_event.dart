
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
