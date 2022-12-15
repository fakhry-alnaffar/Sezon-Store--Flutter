import 'package:camel_express_user/order/data/entity/cart/cart.dart';
import 'package:camel_express_user/order/data/entity/order/order_state.dart';
import 'package:camel_express_user/order/domain/model/location_model.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/faliure.dart';

abstract class OrderRepository {
  Future<Either<Failure, Cart>> getCart();

  Future<Either<Failure, int>> makeOrder({
    required LocationModel location,
  });

  Future<Either<Failure, String>> checkOut();

  Future<Either<Failure, OrderState>> getOrderState();

  Future<Either<Failure, double>> addOrRemoveFromCart({
    required Map<String, dynamic> data,
  });
}
