import 'dart:io';

import 'package:camel_express_user/core/error/exceptions.dart';
import 'package:camel_express_user/core/helpers/api_settings.dart';
import 'package:camel_express_user/user/base_remote_data_source.dart';
import 'package:camel_express_user/user/data/entity/notification.dart';
import 'package:camel_express_user/user/data/entity/user.dart';
import 'package:camel_express_user/user/domain/model/user_model.dart';
import 'package:camel_express_user/user/domain/model/notification_model.dart';
import 'package:get/get.dart';

import '../../../core/prefs/shared_pref_controller.dart';

class UserRemoteDataSourceImp extends GetConnect
    implements UserRemoteDataSource {
  @override
  Future<User> changePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirm,
  }) async {
    var response = await post(ApiSettings.changePassword, {
      "current_password": currentPassword,
      "password": newPassword,
      "confirm_password": newPasswordConfirm,
    }, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader:
          SharedPrefController().getValueFor<String>(PrefKeys.token.name)!
    });
    if (response.hasError) {
      throw ServerException(message: response.body["message"]);
    }
    return UserModel.fromJson(response.body["data"]);
  }

  @override
  Future<User> editProfile({
    required String userName,
    required String email,
    required String mobileNumber,
  }) async {
    var response = await post(ApiSettings.editProfile, {
      "username": userName,
      "email": email,
      "mobile_no": mobileNumber,
    }, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader:
          SharedPrefController().getValueFor<String>(PrefKeys.token.name)!
    });
    if (response.hasError) {
      throw ServerException(message: response.body["message"]);
    }
    return UserModel.fromJson(response.body["data"]);
  }

  @override
  Future<List<Notification>> getNotifications() async {
    var response = await get(
      ApiSettings.notification,
      headers: {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: SharedPrefController().getValueFor<String>(PrefKeys.token.name)!
      },
    );
    if (response.hasError) {
      throw ServerException(message: response.body["message"]);
    }
    return List.from(response.body["data"] as List)
        .map((e) => NotificationModel.fromJson(e))
        .toList();
  }
}
