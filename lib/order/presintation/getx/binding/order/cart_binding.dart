import 'package:camel_express_user/order/domain/usecase/order/cart_usecase.dart';
import 'package:camel_express_user/order/domain/usecase/order/checkout_usecase.dart';
import 'package:camel_express_user/order/presintation/getx/controller/order/cart_getx_controller.dart';
import 'package:get/get.dart';

class CartBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => CartGetXController(Get.find<CartDataUseCase>(),Get.find<CheckOutUseCase>()));
  }
}