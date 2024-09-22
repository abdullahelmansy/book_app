import 'dart:developer';

import 'package:book_app/core/services/local_storage/local_storage.dart';
import 'package:book_app/feature/home/data/model/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:book_app/feature/home/data/model/response/get_sliders/get_sliders.dart';
import 'package:book_app/feature/home/data/model/response/get_wish_list_reponse_model/get_wish_list_reponse_model.dart';

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

  static Future<GetSlidersResponseModel?> getSlider() async {
    try {
      var response = await DioProvider.get(endpoint: ApiEndpoint.getSlider);
      if (response.statusCode == 200) {
        var model = GetSlidersResponseModel.fromJson(response.data);

        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> addToWishList({required int productId}) async {
    try {
      var response = await DioProvider.post(
          endpoint: ApiEndpoint.addToWishList,
          data: {
            "product_id": productId
          },
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
  static Future<bool> removeFromWishList({required int productId}) async {
    try {
      var response = await DioProvider.post(
          endpoint: ApiEndpoint.removeFromWishList,
          data: {
            "product_id": productId
          },
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

  static Future<GetWishListResponseModel?> getWishList() async {
    try {
      var response = await DioProvider.get(
          endpoint: ApiEndpoint.getWishList,
          headers: {
            "Authorization":
                "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
          });
      if (response.statusCode == 200) {
        var model = GetWishListResponseModel.fromJson(response.data);
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
