import 'package:camel_express_user/user/data/entity/notification.dart';

import 'data/entity/user.dart';

abstract class UserRemoteDataSource {
  Future<User> changePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirm,
  });

  Future<User> editProfile({
    required String userName,
    required String email,
    required String mobileNumber,
  });


  Future<List<Notification>> getNotifications();
}
