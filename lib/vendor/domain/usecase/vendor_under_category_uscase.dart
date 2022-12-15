import 'package:camel_express_user/vendor/data/entity/vendor/vendor_under_category.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/faliure.dart';
import '../repository/vendor_repository.dart';

class VendorUnderCategoryUseCase {
  final VendorRepository _repository;

  VendorUnderCategoryUseCase(this._repository);

  Future<Either<Failure, VendorUnderCategory>> execute({
    required String categoryId,
  }) async {
    return await _repository.getVendorUnderCategory(
      categoryId: categoryId,
    );
  }
}
