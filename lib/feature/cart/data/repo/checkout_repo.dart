import 'package:book_app/core/constants/auth_endpoint.dart';
import 'package:book_app/core/services/dio/dio_provider.dart';
import 'package:book_app/core/services/local_storage/local_storage.dart';
import 'package:book_app/feature/cart/data/model/response/checkout_response_model/checkout_response_model.dart';

class CheckoutRepo {
  static Future<CheckoutResponseModel?> checkout() async {
    var response =
        await DioProvider.get(endpoint: ApiEndpoint.checkout, headers: {
      "Authorization": "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
    });
    if (response.statusCode == 200) {
      var model = CheckoutResponseModel.fromJson(response.data);
      return model;
    } else {
      return null;
    }
  }
}
