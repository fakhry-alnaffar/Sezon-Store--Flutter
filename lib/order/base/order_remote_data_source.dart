import 'package:camel_express_user/order/data/entity/order/order_state.dart';
import 'package:camel_express_user/order/domain/model/location_model.dart';

import '../data/entity/cart/cart.dart';

abstract class OrderRemoteDataSource {
  Future<Cart> getCart();

  Future<int> makeOrder({
    required LocationModel location,
  });

  Future<String> checkOut();

  Future<OrderState> getOrderState();

  Future<double> addOrRemoveFromCart({
    required Map<String, dynamic> data,
  });
}
