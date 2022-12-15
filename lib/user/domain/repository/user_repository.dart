import 'package:camel_express_user/core/error/faliure.dart';
import 'package:camel_express_user/user/data/entity/notification.dart';
import 'package:dartz/dartz.dart';

import '../../data/entity/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirm,
  });

  Future<Either<Failure, User>> editProfile({
    required String userName,
    required String email,
    required String mobileNumber,
  });

  Future<Either<Failure,List<Notification>>> getNotifications();
}
