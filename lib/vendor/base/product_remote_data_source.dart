import 'package:camel_express_user/vendor/data/entity/product/product_details.dart';
import 'package:camel_express_user/vendor/data/entity/product/vendor_product.dart';

abstract class ProductRemoteDataSource {
  Future<List<VendorProduct>> getFavorites();

  Future<Product> getProductDetails({
    required String productId,
  });

  Future<String> addOrRemoveFromFavorites({
    required String productId,
  });

  Future<Map<String, dynamic>> getProductPrice({
    required Map<String, dynamic> data,
    required String productId,
  });

  Future<List<VendorProduct>> getOffersProduct({required String offerId});
}
