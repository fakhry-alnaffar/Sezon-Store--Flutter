import 'package:camel_express_user/order/domain/model/location_model.dart';
import 'package:camel_express_user/order/domain/repository/order_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/faliure.dart';

class MakeOrderUseCase {
  final OrderRepository _repository;

  MakeOrderUseCase(this._repository);

  Future<Either<Failure, int>> execute({
    required LocationModel location,
  }) async {
    return await _repository.makeOrder(location: location);
  }
}
