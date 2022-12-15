import 'package:camel_express_user/core/error/faliure.dart';
import 'package:camel_express_user/order/base/order_remote_data_source.dart';
import 'package:camel_express_user/order/data/entity/cart/cart.dart';
import 'package:camel_express_user/order/data/entity/order/order_state.dart';
import 'package:camel_express_user/order/domain/model/location_model.dart';
import 'package:camel_express_user/order/domain/repository/order_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/error/exceptions.dart';

class OrderRepositoryImp extends OrderRepository {
  final OrderRemoteDataSource _dataSource;

  OrderRepositoryImp(this._dataSource);

  @override
  Future<Either<Failure, Cart>> getCart() async {
    try {
      final result = await _dataSource.getCart();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, int>> makeOrder({
    required LocationModel location,
  }) async {
    try {
      final result = await _dataSource.makeOrder(location: location);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> checkOut() async {
    try {
      final result = await _dataSource.checkOut();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, OrderState>> getOrderState() async {
    try {
      final result = await _dataSource.getOrderState();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, double>> addOrRemoveFromCart({
    required Map<String, dynamic> data,
  }) async {
    try {
      final result = await _dataSource.addOrRemoveFromCart(data: data);
      return Right(result);
    } on MakeOrderFailure catch (e) {
      Get.offNamedUntil("/address_screen", (route) => false);
      return Left(ServerFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
