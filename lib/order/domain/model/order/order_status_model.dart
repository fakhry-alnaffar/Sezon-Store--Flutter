import 'package:camel_express_user/order/data/entity/order/order_status.dart';

class OrderStatusModel extends OrderStatus {
  const OrderStatusModel({
    required super.orderId,
    required super.statusId,
    required super.statusName,
    required super.createdAt,
  });

  factory OrderStatusModel.fromJson(Map<String, dynamic> json) {
    print("js $json");
    return OrderStatusModel(
      orderId: json["order_id"],
      statusId: json["status_id"],
      statusName: json["status_name"],
      createdAt: json["created_at"],
    );
  }
}
