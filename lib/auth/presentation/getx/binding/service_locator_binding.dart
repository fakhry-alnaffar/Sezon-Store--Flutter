import 'package:get/get.dart';

import '../../../../core/service/auth_service_locator.dart';

class ServiceLocatorBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<AuthServiceLocator>(AuthServiceLocator());
  }

}