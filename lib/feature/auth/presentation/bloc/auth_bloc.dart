import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/local_storage/local_storage.dart';
import '../../data/repo/auth_repo.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(login);
    on<LogoutEvent>(logout);
    on<RegisterEvent>(register);
    on<CheckEmailEvent>(checkEmail);
    on<CheckOTPEvent>(checkOTP);
    on<NewPasswordEvent>(newPassword);
  }
  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    await AuthRepo.login(event.params).then((value) {
      if (value != null) {
        LocalStorage.chacedData(
            key: LocalStorage.token, value: value.data!.token);
        emit(LoginSuccessState());
      } else {
        emit(ErrorState('Login Failed'));
      }
    });
  }

  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    await AuthRepo.register(event.params).then((value) {
      if (value != null) {
        LocalStorage.chacedData(
            key: LocalStorage.token, value: value.data!.token);

        emit(RegisterSuccessState());
      } else {
        emit(ErrorState('Register Failed'));
      }
    });
  }

  Future<void> logout(
      LogoutEvent event, Emitter<AuthState> emit) async {
    emit(LogoutLoadingState());
    await AuthRepo.logout().then((value) {
      if (value) {
        emit(LogoutSuccessState());
      } else {
        emit(ErrorState('logout Failed'));
      }
    });
  }
  Future<void> checkEmail(
      CheckEmailEvent event, Emitter<AuthState> emit) async {
    emit(CheckEmailLoadingState());
    await AuthRepo.checkEmail(email: event.email).then((value) {
      if (value) {
        emit(CheckEmailSuccessState());
      } else {
        emit(ErrorState('Email Failed'));
      }
    });
  }

  Future<void> checkOTP(CheckOTPEvent event, Emitter<AuthState> emit) async {
    emit(CheckOTPLoadingState());
    await AuthRepo.checkOTP(otp: event.otp).then((value) {
      if (value) {
        emit(CheckOTPSuccessState());
      } else {
        emit(ErrorState('Otp Failed'));
      }
    });
  }

  Future<void> newPassword(
      NewPasswordEvent event, Emitter<AuthState> emit) async {
    emit(NewPasswordLoadingState());
    await AuthRepo.newPassword(
            otp: event.otp,
            newPassword: event.newPassword,
            newConfirmPassword: event.newConfirmPassword)
        .then((value) {
      if (value != null) {
        emit(NewPasswordSuccessState());
      } else {
        emit(ErrorState('new password Failed'));
      }
    });
  }
}
