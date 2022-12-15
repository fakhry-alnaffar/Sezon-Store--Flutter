import 'dart:io';

import 'package:camel_express_user/order/base/address_remote_data_source.dart';
import 'package:camel_express_user/order/data/entity/address/address.dart';
import 'package:camel_express_user/order/domain/model/address_model.dart';
import 'package:get/get.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/helpers/api_settings.dart';
import '../../../core/prefs/shared_pref_controller.dart';

class AddressRemoteDataSourceImp extends GetConnect implements AddressRemoteDataSource {

  @override
  Future<List<Address>> getAddressBooks() async {
    var response = await get(
      ApiSettings.addressBook.replaceFirst('{id}', ""),
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
        HttpHeaders.acceptHeader: "application/json"
      },
    );
    if (response.hasError) {
      throw ServerException(message: response.body["message"]);
    }
    return List.from(response.body["data"] as List)
        .map((e) => AddressModel.fromJson(e))
        .toList();
  }

  @override
  Future<Address> addAddressBook({
    required Map<String, dynamic> data,
  }) async {
    var response = await post(
      "http://phplaravel-741008-2486387.cloudwaysapps.com/api/address-book",
      data,
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
        HttpHeaders.acceptHeader: "application/json"
      },
    );
    if (response.hasError) {
      throw ServerException(message: response.body["message"]);
    }
    return AddressModel.fromJson(response.body["data"]);
  }

  @override
  Future<Address> editAddressBook({
    required Map<String, dynamic> data,
    required String id,
  }) async {
    var response = await post(
      ApiSettings.addressBook.replaceFirst('{id}', id),
      data,
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
        HttpHeaders.acceptHeader: "application/json"
      },
    );
    if (response.hasError) {
      throw ServerException(message: response.body["message"]);
    }
    return AddressModel.fromJson(response.body["data"]);
  }

  @override
  Future<String> removeAddressBook({
    required String id,
  }) async {
    var response = await delete(
      ApiSettings.removeAddressRook.replaceFirst('{id}', id),
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
        HttpHeaders.acceptHeader: "application/json"
      }
    );
    if (response.hasError) {
      throw ServerException(message: response.body["message"]);
    }
    return "Done";
  }
}
