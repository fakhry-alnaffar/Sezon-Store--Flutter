import 'package:camel_express_user/order/data/entity/cart/cart.dart';
import 'package:camel_express_user/order/domain/repository/order_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/faliure.dart';

class CartDataUseCase {
  final OrderRepository _repository;

  CartDataUseCase(this._repository);

  Future<Either<Failure, Cart>> execute() async {
    return await _repository.getCart();
  }

  Future<Either<Failure, double>> addOrRemove({
    required Map<String, dynamic> data,
  }) async {
    return await _repository.addOrRemoveFromCart(data: data);
  }
}
