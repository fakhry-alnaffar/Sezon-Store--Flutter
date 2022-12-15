import 'package:camel_express_user/auth/domain/usecase/check_order_usecase.dart';
import 'package:camel_express_user/auth/domain/usecase/login_usecase.dart';
import 'package:get/get.dart';

import '../controller/login_getx_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginGetXController>(
      () => LoginGetXController(
        Get.find<LoginUseCase>(),
        Get.find<CheckOrderUseCase>(),
      ),
    );
  }
}
