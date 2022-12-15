import 'package:camel_express_user/order/data/entity/order/order_details.dart';
import 'package:camel_express_user/order/data/entity/order/order_state.dart';
import 'package:camel_express_user/order/domain/model/order/order_details_model.dart';
import 'package:camel_express_user/order/domain/model/order/order_product_model.dart';
import 'package:camel_express_user/order/domain/model/order/order_status_model.dart';

class OrderStateModel extends OrderState {
  const OrderStateModel({
    required super.orderStatusList,
    required super.orderDetail,
    required super.products,
  });

  factory OrderStateModel.fromJson(Map<String, dynamic> json) {
    print("json ${json["orderStatusList"]}");
    return OrderStateModel(
      orderStatusList: List.from(json["orderStatusList"] as List)
          .map((e) => OrderStatusModel.fromJson(e))
          .toList(),
      products: List.from(json["products"] as List)
          .map((e) => OrderProductModel.fromJson(e))
          .toList(),
      orderDetail: OrderDetailsModel.fromJson(json["orderDetail"]),
    );
  }
}
