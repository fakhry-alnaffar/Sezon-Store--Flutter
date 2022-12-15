import 'package:camel_express_user/core/error/faliure.dart';
import 'package:camel_express_user/vendor/data/entity/product/product_details.dart';
import 'package:camel_express_user/vendor/data/entity/product/vendor_product.dart';
import 'package:camel_express_user/vendor/domain/repository/product_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../base/product_remote_data_source.dart';

class ProductRepositoryImp extends ProductRepository {
  final ProductRemoteDataSource _remoteDataSource;

  ProductRepositoryImp(this._remoteDataSource);

  @override
  Future<Either<Failure, List<VendorProduct>>> getFavorites() async {
    try {
      final result = await _remoteDataSource.getFavorites();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductDetails({
    required String productId,
  }) async {
    try {
      final result =
          await _remoteDataSource.getProductDetails(productId: productId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> addOrRemoveFromFavorites(
      {required String productId}) async {
    try {
      final result = await _remoteDataSource.addOrRemoveFromFavorites(
        productId: productId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getProductPrice({
    required Map<String, dynamic> data,
    required String productId,
  }) async {
    try {
      final result = await _remoteDataSource.getProductPrice(
        data: data,
        productId: productId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<VendorProduct>>> getOffersProduct({
    required String offerId,
  }) async {
    try {
      final result = await _remoteDataSource.getOffersProduct(offerId: offerId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
