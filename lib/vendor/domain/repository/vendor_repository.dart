import 'package:camel_express_user/vendor/data/entity/vendor/vendor.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/faliure.dart';
import '../../data/entity/home/home.dart';
import '../../data/entity/home/home_item.dart';
import '../../data/entity/vendor/vendor_under_category.dart';

abstract class VendorRepository {
  Future<Either<Failure, Home>> getHome();

  Future<Either<Failure, Vendor>> getVendorDetails({
    required String vendorId,
  });

  Future<Either<Failure, VendorUnderCategory>> getVendorUnderCategory({
    required String categoryId,
  });

  Future<Either<Failure,List<HomeItem>>> getCategories();
}
