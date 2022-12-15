import 'package:camel_express_user/vendor/data/entity/home/home_item.dart';
import 'package:camel_express_user/vendor/data/entity/vendor/vendor.dart';
import 'package:camel_express_user/vendor/data/entity/vendor/vendor_under_category.dart';

import '../data/entity/home/home.dart';

abstract class VendorRemoteDataSource {
  Future<Home> getHome();

  Future<Vendor> getVendorDetails({
    required String vendorId,
  });

  Future<VendorUnderCategory> getVendorUnderCategory({
    required String categoryId,
  });

  Future<List<HomeItem>> getCategories();
}
