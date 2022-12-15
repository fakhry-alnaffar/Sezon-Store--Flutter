import 'package:camel_express_user/user/domain/usecase/edit_profile_usecase.dart';
import 'package:camel_express_user/user/presentation/getx/controller/profile_getx_controller.dart';
import 'package:get/get.dart';

class EditProfileBinding extends Bindings{

  @override
  void dependencies() {
    Get.put<ProfileGetXController>(ProfileGetXController(Get.find<EditProfileUseCase>()));
  }

}