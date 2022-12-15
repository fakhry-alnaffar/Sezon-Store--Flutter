import 'package:camel_express_user/order/data/entity/order/order_state.dart';
import 'package:camel_express_user/order/domain/repository/order_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/faliure.dart';

class OrderStateUseCase {
  final OrderRepository _repository;

  OrderStateUseCase(this._repository);

  Future<Either<Failure, OrderState>> execute() async {
    return await _repository.getOrderState();
  }
}
