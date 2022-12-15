import 'package:camel_express_user/vendor/data/entity/product/product_details.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/faliure.dart';
import '../repository/product_repository.dart';

class ProductDetailsUseCase {
  final ProductRepository _repository;

  ProductDetailsUseCase(this._repository);

  Future<Either<Failure, Product>> execute({
    required String productId,
  }) async {
    return await _repository.getProductDetails(
      productId: productId,
    );
  }

  Future<Either<Failure, Map<String, dynamic>>> getPrice({
    required Map<String, dynamic> data,
    required String productId,
  }) async {
    return await _repository.getProductPrice(
      data: data,
      productId: productId,
    );
  }
}
