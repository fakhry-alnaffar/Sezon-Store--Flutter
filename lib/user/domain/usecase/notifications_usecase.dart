import 'package:camel_express_user/core/error/faliure.dart';
import 'package:camel_express_user/user/data/entity/notification.dart';
import 'package:camel_express_user/user/data/entity/user.dart';
import 'package:dartz/dartz.dart';

import '../repository/user_repository.dart';

class NotificationsUseCase {
  final UserRepository _repository;

  NotificationsUseCase(this._repository);

  Future<Either<Failure, List<Notification>>> execute() async {
    return await _repository.getNotifications();
  }

}