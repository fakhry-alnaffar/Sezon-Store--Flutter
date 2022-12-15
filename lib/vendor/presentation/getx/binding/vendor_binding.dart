import 'package:camel_express_user/vendor/domain/usecase/categories_usecase.dart';
import 'package:camel_express_user/vendor/domain/usecase/vendor_under_category_uscase.dart';
import 'package:camel_express_user/vendor/presentation/getx/controller/home_getx_controller.dart';
import 'package:camel_express_user/vendor/presentation/getx/controller/vendor_under_category_getx_controller.dart';
import 'package:camel_express_user/vendor/presentation/getx/controller/venodr_getx_controller.dart';
import 'package:get/get.dart';
import '../../../domain/usecase/home_data_usecase.dart';
import '../../../domain/usecase/vendor_details_usecase.dart';
import '../controller/categories_getx_controller.dart';

class VendorBinding extends Bindings{

  @override
  void dependencies() {
    Get.put<HomeGetXController>(HomeGetXController(Get.find<HomeDataUseCase>()));
    Get.put<CategoriesGetXController>(CategoriesGetXController(Get.find<CategoriesUseCase>()));
    Get.put<VendorGetXController>(VendorGetXController(Get.find<VendorDetailsUseCase>()));
    Get.put<VendorUnderCategoryGetXController>(VendorUnderCategoryGetXController(Get.find<VendorUnderCategoryUseCase>()));
  }

}