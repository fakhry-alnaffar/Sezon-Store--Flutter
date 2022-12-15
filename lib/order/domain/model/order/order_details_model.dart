import 'package:camel_express_user/order/data/entity/order/order_details.dart';

class OrderDetailsModel extends OrderDetails {
  const OrderDetailsModel({
    required super.id,
    required super.taxAmount,
    required super.deliveryPrice,
    required super.total,
    required super.afterDiscount,
    required super.couponDiscount,
    required super.offerDiscount,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      id: json['id'],
      taxAmount: json['taxAmount'],
      deliveryPrice: json['delivery_price'],
      total: json['total'],
      afterDiscount: json['after_discount'] ?? 0,
      couponDiscount: json['coupon_discount'] ?? 0,
      offerDiscount: json['offer_discount'] ?? 0,
    );
  }
}
