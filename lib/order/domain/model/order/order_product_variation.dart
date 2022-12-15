import 'package:camel_express_user/order/data/entity/order/order_product_variation.dart';

class OrderProductVariationModel extends OrderProductVariation {
  const OrderProductVariationModel({
    required super.id,
    required super.variationId,
    required super.attributeId,
    required super.attributeName,
    required super.value,
  });

  factory OrderProductVariationModel.fromJson(Map<String, dynamic> json) {
    return OrderProductVariationModel(
      id: json['id'],
      variationId: json['variation_id'],
      attributeId: json['attribute_id'],
      attributeName: json['attribute_name'],
      value: json['value'] ?? "",
    );
  }
}
