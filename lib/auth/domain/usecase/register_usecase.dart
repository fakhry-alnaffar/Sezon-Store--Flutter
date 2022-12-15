import 'package:camel_express_user/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/faliure.dart';
import '../../../user/data/entity/user.dart';

class RegisterUseCase {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  Future<Either<Failure, User>> execute({
    required Map<String,dynamic> data,
  }) async {
    return await _repository.register(data:data);
  }

  Future<Either<Failure, Map<String,dynamic>>> getCitiesAndCountries() async {
    return await _repository.getCountriesAndCities();
  }
}
