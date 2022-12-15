import 'package:camel_express_user/core/error/faliure.dart';
import 'package:camel_express_user/user/data/entity/user.dart';
import 'package:dartz/dartz.dart';

import '../repository/user_repository.dart';

class ChangePasswordUseCase {
  final UserRepository _repository;

  ChangePasswordUseCase(this._repository);

  Future<Either<Failure, User>> execute({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirm,
  }) async {
    return await _repository.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      newPasswordConfirm: newPasswordConfirm,
    );
  }
}
