import 'package:camel_express_user/auth/domain/usecase/register_usecase.dart';
import 'package:get/get.dart';

import '../controller/register_getx_controller.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegisterGetXController>(() => RegisterGetXController(Get.find<RegisterUseCase>()),fenix: true);
  }

}