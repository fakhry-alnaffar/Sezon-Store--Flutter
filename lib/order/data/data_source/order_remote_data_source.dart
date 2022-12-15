import 'dart:convert';
import 'dart:io';

import 'package:camel_express_user/core/error/faliure.dart';
import 'package:camel_express_user/order/base/order_remote_data_source.dart';
import 'package:camel_express_user/order/data/entity/cart/cart.dart';
import 'package:camel_express_user/order/data/entity/order/order_state.dart';
import 'package:camel_express_user/order/domain/model/cart/cart_model.dart';
import 'package:camel_express_user/order/domain/model/location_model.dart';
import 'package:camel_express_user/order/domain/model/order/order_state_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../core/error/exceptions.dart';
import '../../../core/helpers/api_settings.dart';
import '../../../core/prefs/shared_pref_controller.dart';

class OrderRemoteDataSourceImp extends GetConnect implements OrderRemoteDataSource {
  @override
  Future<Cart> getCart() async {
    var response = await get(
      ApiSettings.cartPage,
      headers: {
        HttpHeaders.authorizationHeader:
        SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
        HttpHeaders.acceptHeader: "application/json"
      },
    );
    print('res => ${response.body}');
    var data = response.body["data"] as List;
    var jsonList = data.first["order_details"] as List;
    if (response.hasError || jsonList.isEmpty) {
      throw const ServerException(message: "is empty");
    }
    var json = (response.body["data"] as List).first;
    return CartModel.fromJson(json);
  }

  @override
  Future<int> makeOrder({
    required LocationModel location,
  }) async {
    var response = await http.post(
      Uri.parse(ApiSettings.makeOrder),
      body: {
        "location": location.toJson().toString(),
      },
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
        HttpHeaders.acceptHeader: "application/json"
      },
    );
    if (response.statusCode != 200) {
      throw ServerException(message: jsonDecode(response.body)["message"].toString());
    }
    var json = jsonDecode(response.body)["data"]["id"] as int;
    return json;
  }

  @override
  Future<String> checkOut() async {
    var response = await post(
      ApiSettings.checkout,
      {},
      headers: {
        HttpHeaders.authorizationHeader:
        SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
        HttpHeaders.acceptHeader: "application/json"
      },
    );
    print("res => ${response.body}");
    if (response.hasError) {
      throw ServerException(message: response.body.toString());
    }
    return response.body["message"];
  }

  @override
  Future<OrderState> getOrderState() async {
    var response = await post(
      ApiSettings.orderState,
      {
        "order_id":
        SharedPrefController().getValueFor<String>(PrefKeys.orderId.name)!
      },
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
        HttpHeaders.acceptHeader: "application/json"
      },
    );
    if (response.hasError) {
      throw ServerException(message: response.body.toString());
    }
    return OrderStateModel.fromJson(response.body["data"]);
  }

  @override
  Future<double> addOrRemoveFromCart({
    required Map<String, dynamic> data,
  }) async {
    var response = await post(
      ApiSettings.addOrDeleteFormCart,
      data,
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
        HttpHeaders.acceptHeader: "application/json"
      },
    );
    if (response.statusCode == 405) {
      throw const MakeOrderFailure("error");
    }
    if (response.hasError) {
      throw ServerException(message: response.body["message"]);
    }
    return (response.body["total"] as int).toDouble();
  }
}