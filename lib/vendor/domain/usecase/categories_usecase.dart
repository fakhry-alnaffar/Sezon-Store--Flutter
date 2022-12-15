import 'package:camel_express_user/vendor/domain/repository/vendor_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/faliure.dart';
import '../../data/entity/home/home_item.dart';

class CategoriesUseCase{
  final VendorRepository _repository;

  CategoriesUseCase(this._repository);

  Future<Either<Failure, List<HomeItem>>> execute() async {
    return await _repository.getCategories();
  }

}