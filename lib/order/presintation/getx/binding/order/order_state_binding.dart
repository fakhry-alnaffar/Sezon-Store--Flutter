import 'package:camel_express_user/order/domain/usecase/order/cart_usecase.dart';
import 'package:camel_express_user/order/domain/usecase/order/checkout_usecase.dart';
import 'package:camel_express_user/order/domain/usecase/order/get_order_state_usecase.dart';
import 'package:camel_express_user/order/presintation/getx/controller/order/cart_getx_controller.dart';
import 'package:camel_express_user/order/presintation/getx/controller/order/order_detaisl_getx_controller.dart';
import 'package:get/get.dart';

class OrderStateBinding extends Bindings{

  @override
  void dependencies() {
    Get.put<OrderStateGetXController>(OrderStateGetXController(Get.find<OrderStateUseCase>()));
  }
}