import 'package:camel_express_user/core/error/exceptions.dart';
import 'package:camel_express_user/core/error/faliure.dart';
import 'package:camel_express_user/vendor/data/entity/home/home_item.dart';
import 'package:camel_express_user/vendor/data/entity/vendor/vendor.dart';
import 'package:camel_express_user/vendor/data/entity/vendor/vendor_under_category.dart';
import 'package:dartz/dartz.dart';

import '../../base/vendor_remote_data_source.dart';
import '../../domain/repository/vendor_repository.dart';
import '../entity/home/home.dart';

class VendorRepositoryImp implements VendorRepository {
  final VendorRemoteDataSource _remoteDataSource;

  VendorRepositoryImp(this._remoteDataSource);

  @override
  Future<Either<Failure, Home>> getHome() async {
    try {
      final result = await _remoteDataSource.getHome();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Vendor>> getVendorDetails({
    required String vendorId,
  }) async {
    try {
      final result =
          await _remoteDataSource.getVendorDetails(vendorId: vendorId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, VendorUnderCategory>> getVendorUnderCategory({
    required String categoryId,
  }) async {
    try {
      final result = await _remoteDataSource.getVendorUnderCategory(categoryId: categoryId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<HomeItem>>> getCategories() async {
    try {
      final result = await _remoteDataSource.getCategories();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
