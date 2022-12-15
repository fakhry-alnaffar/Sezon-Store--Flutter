import 'package:camel_express_user/vendor/data/entity/product/vendor_product.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/faliure.dart';
import '../repository/product_repository.dart';

class GetOffersUseCase {
  final ProductRepository _repository;

  GetOffersUseCase(this._repository);

  Future<Either<Failure, List<VendorProduct>>> execute({
    required String offerId,
  }) async {
    return await _repository.getOffersProduct(offerId: offerId);
  }
}
