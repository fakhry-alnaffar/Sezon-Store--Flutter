import 'package:camel_express_user/order/data/entity/order/order_product.dart';
import 'package:camel_express_user/order/domain/model/order/order_details_model.dart';
import 'package:camel_express_user/order/domain/model/order/order_product_variation.dart';

class OrderProductModel extends OrderProduct {
  const OrderProductModel({
    required super.id,
    required super.name,
    required super.productVariation,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      id: json["id"],
      name: json["name"],
      productVariation: List.from(json["productVariation"] as List)
          .map((e) => OrderProductVariationModel.fromJson(e))
          .toList(),
    );
  }
}
