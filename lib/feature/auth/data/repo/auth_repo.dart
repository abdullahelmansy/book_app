import 'dart:developer';

import 'package:book_app/core/services/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/auth_endpoint.dart';
import '../../../../core/services/dio/dio_provider.dart';
import '../model/request/login_model_params.dart';
import '../model/request/register_model_parames.dart';
import '../model/response/login_response/login_response.dart';

class AuthRepo {
  static Future<AuthModelResponse?> login(LoginModelParams params) async {
    try {
      var response = await DioProvider.post(
          endpoint: ApiEndpoint.login, data: params.toJson());
      if (response.statusCode == 200) {
        var model = AuthModelResponse.fromJson(response.data);
        var pref = await SharedPreferences.getInstance();
        pref.setString('token', model.data!.token ?? '');
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthModelResponse?> register(
      RegisterModelParames params) async {
    try {
      var response = await DioProvider.post(
          endpoint: ApiEndpoint.register, data: params.toJson());
      if (response.statusCode == 201) {
        var model = AuthModelResponse.fromJson(response.data);
        var pref = await SharedPreferences.getInstance();
        pref.setString('token', model.data!.token ?? '');
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> checkEmail({required String email}) async {
    try {
      var response =
          await DioProvider.post(endpoint: ApiEndpoint.forgetPassword, data: {
        'email': email,
      });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> checkOTP({required String otp}) async {
    try {
      var response = await DioProvider.post(
          endpoint: ApiEndpoint.checkForgetPassword,
          data: {
            'verify_code': otp,
          });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }
  static Future<bool> logout() async {
    try {
      var response = await DioProvider.post(
          endpoint: ApiEndpoint.logout,
          headers: {
            "Authorization":
                "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
          });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<AuthModelResponse?> newPassword({
    required String otp,
    required String newPassword,
    required String newConfirmPassword,
  }) async {
    try {
      var response = await DioProvider.post(
          endpoint: ApiEndpoint.resetPassword,
          data: {
            'verify_code': otp,
            'new_password': newPassword,
            'new_password_confirmation': newConfirmPassword,
          });
      if (response.statusCode == 200) {
        var model = AuthModelResponse.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
