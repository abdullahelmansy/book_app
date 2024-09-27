import 'dart:developer';

import 'package:book_app/core/constants/auth_endpoint.dart';
import 'package:book_app/core/services/dio/dio_provider.dart';
import 'package:book_app/feature/home/data/model/response/best_seller_response_model/best_seller_response_model.dart';

class SearchRepo {
  static Future<BestSellerResponseModel?> getSearch({required String name}) async {
    try {
      var response = await DioProvider.get(endpoint: ApiEndpoint.getSearch,queryParameters: {
        "name":name,
      });
      if (response.statusCode == 200) {
        var model = BestSellerResponseModel.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
