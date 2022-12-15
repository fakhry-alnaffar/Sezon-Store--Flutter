import 'package:camel_express_user/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/faliure.dart';
import '../../../user/data/entity/user.dart';

class LoginUseCase extends ParamUseCase<User> {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, User>> execute({
    required Map<String, dynamic> data,
  }) async {
    return await _repository.login(data: data);
  }
}

abstract class ParamUseCase<T> {
  Future<Either<Failure, T>> execute({
    required Map<String, dynamic> data,
  });
}

abstract class UnParamUseCase<T> {
  Future<Either<Failure, T>> execute();
}


