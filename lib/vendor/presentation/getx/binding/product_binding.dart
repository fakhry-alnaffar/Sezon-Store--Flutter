import 'package:camel_express_user/vendor/domain/usecase/favorites_usecase.dart';
import 'package:camel_express_user/vendor/domain/usecase/product_details_usecase.dart';
import 'package:camel_express_user/vendor/presentation/getx/controller/favorites_getx_controller.dart';
import 'package:camel_express_user/vendor/presentation/getx/controller/product_getx_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class ProductBinding extends Bindings{

  @override
  void dependencies() {
    Get.put<ProductGetXController>(ProductGetXController(Get.find<ProductDetailsUseCase>()));
    Get.put<FavoritesGetXController>(FavoritesGetXController(Get.find<FavoritesUseCase>()));
  }
}