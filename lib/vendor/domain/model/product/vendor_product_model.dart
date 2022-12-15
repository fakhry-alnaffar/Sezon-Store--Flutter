import 'package:camel_express_user/vendor/data/entity/product/vendor_product.dart';

class VendorProductModel extends VendorProduct {
  VendorProductModel({
    required super.id,
    required super.name,
    required super.percentageOfRating,
    required super.variationId,
    required super.img,
    required super.numberOfRaters,
    required super.price,
    required super.province,
    required super.country,
    required super.distance,
    required super.isFavorite,
  });

  factory VendorProductModel.fromJson(Map<String, dynamic> json) {
    return VendorProductModel(
      id: json['id'] ?? 0,
      isFavorite: json["is_favorite"] == 0 && json["is_favorite"] != null
          ? false
          : true,
      name: json['name'] ?? "",
      percentageOfRating: json['percentage_of_rating'] ?? 0,
      img: json['image_url'] ?? "",
      numberOfRaters: json['number_of_raters'] ?? 0,
      price: json['price'] ?? 0,
      province: json['province'] ?? 0,
      country: json['country'] ?? "",
      distance: json['distance'] ?? 0.0,
      variationId: json["variation_id"] ?? 0,
    );
  }
}
