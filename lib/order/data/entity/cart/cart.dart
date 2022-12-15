import 'package:equatable/equatable.dart';

import 'cart_order.dart';

class Cart extends Equatable {
  final int id;
  late double total;
  late double afterDiscount;
  List<CartOrder> list;

   Cart({
    required this.id,
    required this.total,
    required this.afterDiscount,
    required this.list,
  });

  @override
  List<Object> get props => [id, total, afterDiscount, list];
}
