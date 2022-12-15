import 'package:equatable/equatable.dart';

import 'order_details.dart';
import 'order_product.dart';
import 'order_status.dart';

class OrderState extends Equatable {
  final List<OrderStatus> orderStatusList;
  final List<OrderProduct> products;
  final OrderDetails orderDetail;

  const OrderState({
    required this.orderStatusList,
    required this.orderDetail,
    required this.products,
  });

  @override
  List<Object> get props => [orderStatusList, products];
}
