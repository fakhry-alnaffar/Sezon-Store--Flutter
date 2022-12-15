import 'package:camel_express_user/order/data/entity/order/order_details.dart';
import 'package:equatable/equatable.dart';

import 'order_product_variation.dart';

class OrderProduct extends Equatable {
  final int id;
  final String name;
  final List<OrderProductVariation> productVariation;

  const OrderProduct({
    required this.id,
    required this.name,
    required this.productVariation,
  });

  @override
  List<Object> get props => [id, name, productVariation,];
}
