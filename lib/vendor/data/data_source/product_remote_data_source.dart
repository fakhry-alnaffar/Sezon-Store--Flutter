import 'dart:convert';
import 'dart:io';

import 'package:camel_express_user/core/error/exceptions.dart';
import 'package:camel_express_user/core/helpers/api_settings.dart';
import 'package:camel_express_user/vendor/base/product_remote_data_source.dart';
import 'package:camel_express_user/vendor/data/entity/product/product_details.dart';
import 'package:camel_express_user/vendor/data/entity/product/vendor_product.dart';
import 'package:camel_express_user/vendor/domain/model/product/product_details_model.dart';
import 'package:camel_express_user/vendor/domain/model/product/vendor_product_model.dart';
import 'package:get/get.dart';

import '../../../core/prefs/shared_pref_controller.dart';

class ProductRemoteDataSourceImp extends GetConnect
    implements ProductRemoteDataSource {
  @override
  Future<List<VendorProduct>> getFavorites() async {
    var response = await post(ApiSettings.favorites, {
      "order_id":
          SharedPrefController().getValueFor<String>(PrefKeys.orderId.name),
    }, headers: {
      HttpHeaders.authorizationHeader:
          SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
      HttpHeaders.acceptHeader: "application/json"
    });
    if (response.hasError) {
      throw ServerException(message: response.body["message"]);
    }
    return List.from(response.body["data"] as List)
        .map((e) => VendorProductModel.fromJson(e))
        .toList();
  }

  @override
  Future<Product> getProductDetails({
    required String productId,
  }) async {
    var response = await post(
      ApiSettings.product.replaceFirst("{id}", productId),
      {
        "order_id":
            SharedPrefController().getValueFor<String>(PrefKeys.orderId.name),
      },
      headers: {
        HttpHeaders.authorizationHeader:
            SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
        HttpHeaders.acceptHeader: "application/json"
      },
    );
    if (response.hasError) {
      throw ServerException(message: response.body["message"]);
    }
    return ProductModel.fromJson(response.body["data"]);
  }

  @override
  Future<String> addOrRemoveFromFavorites({required String productId}) async {
    var response = await post(
      ApiSettings.favorite,
      {
        "product_id": productId,
      },
      headers: {
        HttpHeaders.authorizationHeader:
            SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
        HttpHeaders.acceptHeader: "application/json"
      },
    );
    if (response.hasError) {
      throw ServerException(message: response.body["message"]);
    }
    return response.body["message"];
  }

  @override
  Future<Map<String, dynamic>> getProductPrice({
    required Map<String, dynamic> data,
    required String productId,
  }) async {
    var response = await post(
      ApiSettings.getPrice,
      {
        "product_id": productId,
        "attributes": jsonEncode(data),
      },
      headers: {
        HttpHeaders.authorizationHeader:
            SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
        HttpHeaders.acceptHeader: "application/json"
      },
    );
    if (response.hasError) {
      throw ServerException(message: response.body["message"]);
    }
    return response.body["data"];
  }

  @override
  Future<List<VendorProduct>> getOffersProduct({
    required String offerId,
  }) async {
    var response = await get(
      ApiSettings.getProductsWithOffer.replaceFirst("{id}", offerId),
      headers: {
        HttpHeaders.authorizationHeader:
        SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
        HttpHeaders.acceptHeader: "application/json"
      },
    );
    if (response.hasError) {
      throw ServerException(message: response.body["message"]);
    }
    return (response.body["data"] as List).map((e) => VendorProductModel.fromJson(e)).toList();
  }
}
