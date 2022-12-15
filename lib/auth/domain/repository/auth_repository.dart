import 'package:dartz/dartz.dart';

import '../../../core/error/faliure.dart';
import '../../../user/data/entity/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login({
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, User>> register({
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, Map<String, dynamic>>> getCountriesAndCities();

  Future<Either<Failure, int>> checkOrder();
}
