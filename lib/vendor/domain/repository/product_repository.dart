import 'package:camel_express_user/vendor/data/entity/product/product_details.dart';
import 'package:camel_express_user/vendor/data/entity/product/vendor_product.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/faliure.dart';

abstract class ProductRepository {
  Future<Either<Failure, Product>> getProductDetails({
    required String productId,
  });

  Future<Either<Failure, List<VendorProduct>>> getFavorites();

  Future<Either<Failure, String>> addOrRemoveFromFavorites({
    required String productId,
  });

  Future<Either<Failure, Map<String, dynamic>>> getProductPrice({
    required Map<String, dynamic> data,
    required String productId,
  });

  Future<Either<Failure, List<VendorProduct>>> getOffersProduct({
    required String offerId,
  });
}
