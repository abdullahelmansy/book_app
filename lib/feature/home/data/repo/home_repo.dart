import 'dart:developer';

import 'package:book_app/core/services/local_storage/local_storage.dart';
import 'package:book_app/feature/home/data/model/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:book_app/feature/home/data/model/response/cart_response_model/cart_response_model.dart';
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

  static Future<bool> addToCart({required int productId}) async {
    try {
      var response = await DioProvider.post(
          endpoint: ApiEndpoint.addToCart,
          data: {
            "product_id": productId
          },
          headers: {
            "Authorization":
                "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
          });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> updateCart(
      {required int cartItemId, required int quantity}) async {
    try {
      var response = await DioProvider.post(
          endpoint: ApiEndpoint.updateCart,
          data: {
            "cart_item_id": cartItemId,
            "quantity": quantity
          },
          headers: {
            "Authorization":
                "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
          });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> removeFromCart({required int cartItemId}) async {
    try {
      var response = await DioProvider.post(
          endpoint: ApiEndpoint.removeFromCart,
          data: {
            "cart_item_id": cartItemId
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

  static Future<CartResponseModel?> getCart() async {
    try {
      var response = await DioProvider.get(
          endpoint: ApiEndpoint.getCart,
          headers: {
            "Authorization":
                "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
          });
      if (response.statusCode == 200) {
        var model = CartResponseModel.fromJson(response.data);
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
