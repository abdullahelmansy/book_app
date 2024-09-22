import 'dart:developer';

import 'package:book_app/feature/home/data/model/response/best_seller_response_model/best_seller_response_model.dart';

import '../../../../core/constants/auth_endpoint.dart';
import '../../../../core/services/dio/dio_provider.dart';

class HomeRepo {
  static Future<BestSellerResponseModel?> getBestSeller() async {
    try {
      var response = await DioProvider.get(endpoint: ApiEndpoint.bestSeller);
      if (response.statusCode == 200) {
        var model = BestSellerResponseModel.fromJson(response.data);

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
