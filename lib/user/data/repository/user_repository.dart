import 'package:camel_express_user/core/error/exceptions.dart';
import 'package:camel_express_user/core/error/faliure.dart';
import 'package:camel_express_user/user/base_remote_data_source.dart';
import 'package:camel_express_user/user/data/entity/notification.dart';
import 'package:camel_express_user/user/data/entity/user.dart';
import 'package:camel_express_user/user/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImp extends UserRepository {
  final UserRemoteDataSource _dataSource;

  UserRepositoryImp(this._dataSource);

  @override
  Future<Either<Failure, User>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirm,
  }) async {
    try {
      var result = await _dataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
        newPasswordConfirm: newPasswordConfirm,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> editProfile({
    required String userName,
    required String email,
    required String mobileNumber,
  }) async {
    try {
      var result = await _dataSource.editProfile(
        userName: userName,
        email: email,
        mobileNumber: mobileNumber,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Notification>>> getNotifications() async {
    try {
      var result = await _dataSource.getNotifications();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
