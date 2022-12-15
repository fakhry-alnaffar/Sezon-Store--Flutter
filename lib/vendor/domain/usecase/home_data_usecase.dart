import 'package:camel_express_user/core/error/faliure.dart';
import 'package:dartz/dartz.dart';

import '../../data/entity/home/home.dart';
import '../repository/vendor_repository.dart';

class HomeDataUseCase {
  final VendorRepository _repository;

  HomeDataUseCase(this._repository);

  Future<Either<Failure, Home>> execute() async {
    return await _repository.getHome();
  }
}
