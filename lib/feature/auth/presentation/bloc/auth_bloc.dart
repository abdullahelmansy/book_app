
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/local_storage/local_storage.dart';
import '../../data/repo/auth_repo.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(login);
    on<RegisterEvent>(register);
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
}
