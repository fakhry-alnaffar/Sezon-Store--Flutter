import 'dart:io';

import 'package:camel_express_user/core/error/exceptions.dart';
import 'package:camel_express_user/core/prefs/shared_pref_controller.dart';
import 'package:camel_express_user/core/helpers/api_settings.dart';
import 'package:camel_express_user/vendor/data/entity/home/home_item.dart';
import 'package:camel_express_user/vendor/data/entity/vendor/vendor.dart';
import 'package:camel_express_user/vendor/data/entity/vendor/vendor_under_category.dart';
import 'package:camel_express_user/vendor/domain/model/home/home_item_model.dart';
import 'package:camel_express_user/vendor/domain/model/vendor/vendor_model.dart';
import 'package:camel_express_user/vendor/domain/model/vendor/vendor_under_category_model.dart';
import 'package:get/get.dart';

import '../../base/vendor_remote_data_source.dart';
import '../../domain/model/home/home_model.dart';
import '../entity/home/home.dart';

class VendorRemoteDataSourceImp extends GetConnect
    implements VendorRemoteDataSource {
  @override
  Future<Home> getHome() async {
    var response = await post(ApiSettings.home, {
      "order_id": SharedPrefController().getValueFor<String>(PrefKeys.orderId.name),
    }, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader:
          SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
    });
    if (response.hasError) {
      throw ServerException(message: response.body["message"]);
    }
    return HomeModel.fromJson(response.body["data"]);
  }

  @override
  Future<Vendor> getVendorDetails({
    required String vendorId,
  }) async {
    var response = await post(ApiSettings.vendorDetails.replaceFirst("{id}", vendorId), {
      "order_id": SharedPrefController().getValueFor<String>(PrefKeys.orderId.name),
    }, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader:
          SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
    });
    if (response.hasError) {
      throw ServerException(message: response.body["message"]);
    }
    return VendorModel.fromJson(response.body["data"]);
  }

  @override
  Future<VendorUnderCategory> getVendorUnderCategory({
    required String categoryId,
  }) async {
    var response = await post(
      ApiSettings.vendorsUnderCategory.replaceFirst('{id}', categoryId),
      {
        "order_id": SharedPrefController().getValueFor<String>(PrefKeys.orderId.name),
      },
      headers: {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader:
            SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
      },
    );
    if (response.hasError) {
      throw const ServerException(message: "some thing going wrong");
    }
    return VendorUnderCategoryModel.fromJson(response.body["data"]);
  }

  @override
  Future<List<HomeItem>> getCategories() async {
    var response = await get(
      ApiSettings.categories,
      headers: {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader:
            SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
      },
    );
    if (response.hasError) {
      throw const ServerException(message: "some thing going wrong");
    }
    return List.from(response.body["data"] as List)
        .map((e) => HomeItemModel.fromCategoryJson(e))
        .toList();
  }
}
