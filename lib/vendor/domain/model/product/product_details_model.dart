import 'package:camel_express_user/vendor/data/entity/product/product_details.dart';
import 'package:camel_express_user/vendor/domain/model/product/attribute_model.dart';

class ProductModel extends Product {
  ProductModel({
    required super.name,
    required super.description,
    required super.variationId,
    required super.price,
    required super.id,
    required super.percentageOfRating,
    required super.images,
    required super.distance,
    required super.isFavorite,
    required super.attributesList,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json["name"],
      variationId: json["variation_id"],
      isFavorite: json["is_favorite"] == 0 ? false : true,
      description: json["description"] ?? "",
      price: json["price"] ?? 0,
      id: json["id"] ?? 0,
      percentageOfRating: json["percentage_of_rating"] ?? 0,
      images: List.from(json["media"] as List)
          .map((e) => e["image_url_"].toString())
          .toList(),
      attributesList: List.from(json["attributesList"] as List)
          .map((e) => AttributeModel.fromJson(e))
          .where((element) => element.attribute != "Default")
          .toList(),
      distance: json["distance"] ?? 0.0,
    );
  }
}
