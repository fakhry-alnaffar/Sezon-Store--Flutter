import 'dart:convert';
import 'dart:io';

import 'package:camel_express_user/auth/base/data_source/remote_data_source.dart';
import 'package:camel_express_user/user/domain/model/user_model.dart';
import 'package:camel_express_user/core/error/exceptions.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../core/prefs/shared_pref_controller.dart';
import '../../../core/helpers/api_settings.dart';
import '../../../user/data/entity/user.dart';

class AuthRemoteDataSourceImp extends GetConnect
    implements AuthRemoteDataSource {
  @override
  Future<User> login({
    required Map<String,dynamic> data
  }) async {
    var response = await post(ApiSettings.login, {
      "mobile_no": data["mobile"],
      "password": data["password"],
    },headers: {
      HttpHeaders.acceptHeader : "application/json"
    });
    if (response.hasError) {
      throw const ServerException(message: "The password must be at least 6 characters");
    }
    return UserModel.fromJson(response.body["data"]);
  }

  @override
  Future<User> register({required Map<String, dynamic> data}) async {
    var response = await post(
        ApiSettings.register,
        data,
        headers: {
          HttpHeaders.acceptHeader : "application/json"
        }
    );
    if(response.body.toString().contains("The password must be at least 6 characters")){
      throw const ServerException(message: "The password must be at least 6 characters");
    }
    if (response.hasError) {
      throw ServerException(message: response.body["message"]);
    }
    return UserModel.fromJson(response.body["data"]);
  }


  @override
  Future<Map<String, dynamic>> getCountriesAndCities() async {
    var response = await get(ApiSettings.registerPage);
    if (response.hasError) {
      throw const ServerException(message: "some thing going wrong");
    }
    var cities = response.body["data"]["cites"] as List;
    var countries = response.body["data"]["countries"] as List;
    return {"cites": cities, "countries": countries};
  }

  @override
  Future<int> checkOrder() async {
    var response = await http.get(
      Uri.parse(ApiSettings.checkOrder),
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
        HttpHeaders.acceptHeader: "application/json"
      },
    );
    print("order status => ${response.body}");
    if (response.statusCode == 200) {
      throw const ServerException(message: "there is no order");
    }
    return jsonDecode(response.body)["data"] as int;
    // return response.body["data"] as int;
  }
}