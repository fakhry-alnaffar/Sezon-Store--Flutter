import 'package:camel_express_user/order/domain/repository/order_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/faliure.dart';

class CheckOutUseCase {
  final OrderRepository _repository;

  CheckOutUseCase(this._repository);

  Future<Either<Failure, String>> execute() async {
    return await _repository.checkOut();
  }
}
