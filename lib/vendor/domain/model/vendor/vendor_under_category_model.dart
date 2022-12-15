import 'package:camel_express_user/vendor/data/entity/vendor/details.dart';
import 'package:camel_express_user/vendor/data/entity/vendor/vendor_under_category.dart';
import 'package:camel_express_user/vendor/domain/model/vendor/details_model.dart';
import 'package:camel_express_user/vendor/domain/model/vendor/near_vendor_model.dart';
import 'package:equatable/equatable.dart';

class VendorUnderCategoryModel extends VendorUnderCategory {
  const VendorUnderCategoryModel({
    required super.vendorsNearest,
    required super.allVendors,
  });

  factory VendorUnderCategoryModel.fromJson(Map<String, dynamic> json) {
    return VendorUnderCategoryModel(
      vendorsNearest: List.from(json["vendors_nearest"] as List).map((e) => NearVendorModel.fromJson(e)).toList(),
      allVendors: List.from(json["allVendors"] as List).map((e) => VendorDetailsModel.fromJson(e)).toList(),
    );
  }
}
