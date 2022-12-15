import 'package:camel_express_user/core/error/faliure.dart';
import 'package:camel_express_user/user/data/entity/user.dart';
import 'package:dartz/dartz.dart';

import '../repository/user_repository.dart';

class EditProfileUseCase {
  final UserRepository _repository;

  EditProfileUseCase(this._repository);

  Future<Either<Failure, User>> execute({
    required String userName,
    required String email,
    required String mobileNumber,
  }) async {
    return await _repository.editProfile(
      userName: userName,
      email: email,
      mobileNumber: mobileNumber,
    );
  }
}