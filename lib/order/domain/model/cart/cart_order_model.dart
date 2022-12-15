import 'package:camel_express_user/order/data/entity/cart/cart_order.dart';

class CartOrderModel extends CartOrder {
  CartOrderModel({
    required super.id,
    required super.name,
    required super.total,
    required super.orderId,
    required super.variationId,
    required super.quantity,
    required super.imageUrl,
    required super.province,
    required super.country,
    required super.distance,
  });

  factory CartOrderModel.fromJson(Map<String, dynamic> json) {
    return CartOrderModel(
      id: json["id"],
      name: json["name"],
      variationId: json["variation_id"],
      total: json["total"],
      orderId: json["order_id"],
      quantity: json["quantity"],
      imageUrl: json["image_url"],
      province: json["province"],
      country: json["country"],
      distance: json["distance"],
    );
  }
}
