import 'package:camel_express_user/user/domain/usecase/change_password_usecase.dart';
import 'package:camel_express_user/user/presentation/getx/controller/change_password_getx_controller.dart';
import 'package:get/get.dart';

class ChangePasswordBinding extends Bindings{

  @override
  void dependencies() {
    Get.put<ChangePasswordGetXController>(ChangePasswordGetXController(Get.find<ChangePasswordUseCase>()));
  }
}