import 'dart:developer';


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
}
