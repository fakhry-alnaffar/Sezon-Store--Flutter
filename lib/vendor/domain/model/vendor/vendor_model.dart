import 'package:camel_express_user/vendor/data/entity/vendor/vendor.dart';
import 'package:camel_express_user/vendor/domain/model/home/home_item_model.dart';
import 'package:camel_express_user/vendor/domain/model/vendor/details_model.dart';
import 'package:camel_express_user/vendor/domain/model/product/vendor_product_model.dart';

class VendorModel extends Vendor {
  VendorModel({
    required super.vendorDetails,
    required super.menu,
    required super.offers,
    required super.mostPopularProducts,
    required super.favorites,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
      vendorDetails: VendorDetailsModel.fromJson(json["vendor_detailed"]),
      menu: List.from(json["menu"] as List)
          .map((e) => VendorProductModel.fromJson(e))
          .toList(),
      mostPopularProducts: List.from(json["product_most_papular"] as List)
          .map((e) => VendorProductModel.fromJson(e))
          .toList(),
      favorites: List.from(json["favorites"] as List)
          .map((e) => VendorProductModel.fromJson(e))
          .toList(),
      offers: List.from(json["offers"] as List)
          .map((e) => HomeItemModel.fromJson(e))
          .toList(),
    );
  }
}
