import 'package:camel_express_user/vendor/data/entity/product/vendor_product.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/faliure.dart';
import '../repository/product_repository.dart';

class FavoritesUseCase {
  final ProductRepository _repository;

  FavoritesUseCase(this._repository);

  Future<Either<Failure, List<VendorProduct>>> execute() async {
    return await _repository.getFavorites();
  }

  Future<Either<Failure, String>> addOrRemoveFromFavorites({
    required String productId,
  }) async {
    return await _repository.addOrRemoveFromFavorites(
      productId: productId,
    );
  }
}
