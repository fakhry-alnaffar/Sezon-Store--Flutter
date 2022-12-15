import 'package:camel_express_user/auth/base/data_source/remote_data_source.dart';
import 'package:camel_express_user/user/data/entity/user.dart';
import 'package:camel_express_user/core/error/exceptions.dart';
import 'package:camel_express_user/core/error/faliure.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImp extends AuthRepository {
  final AuthRemoteDataSource _dataSource;

  AuthRepositoryImp(this._dataSource);

  @override
  Future<Either<Failure, User>> register(
      {required Map<String, dynamic> data}) async {
    try {
      final result = await _dataSource.register(data: data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, int>> checkOrder() async {
    try {
      final result = await _dataSource.checkOrder();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getCountriesAndCities() async {
    try {
      final result = await _dataSource.getCountriesAndCities();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> login(
      {required Map<String, dynamic> data}) async {
    try {
      final result = await _dataSource.login(
        data: data,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
