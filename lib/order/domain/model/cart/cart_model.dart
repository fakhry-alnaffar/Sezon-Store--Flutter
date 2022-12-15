import 'package:camel_express_user/order/data/entity/cart/cart.dart';
import 'package:camel_express_user/order/domain/model/cart/cart_order_model.dart';

class CartModel extends Cart {
  CartModel({
    required super.id,
    required super.total,
    required super.afterDiscount,
    required super.list,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json["id"],
      total: (json["total"] as int).toDouble(),
      afterDiscount: json["after_discount"] ?? 0.0,
      list: List.from(json["order_details"] as List)
          .map((e) => CartOrderModel.fromJson(e))
          .toList(),
    );
  }
}
