import 'package:camel_express_user/vendor/domain/usecase/categories_usecase.dart';
import 'package:camel_express_user/vendor/domain/usecase/vendor_details_usecase.dart';
import 'package:camel_express_user/vendor/domain/usecase/vendor_under_category_uscase.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../../vendor/data/data_source/vendor_remote_data_source.dart';
import '../../vendor/data/repository/vendor_repository.dart';
import '../../vendor/domain/usecase/home_data_usecase.dart';

class VendorServiceLocator extends GetxService{
  @override
  void onInit() {
    // first we need instance from the data source
    Get.lazyPut<VendorRemoteDataSourceImp>(() => VendorRemoteDataSourceImp(),fenix: true);
    // second instance from the repo
    Get.lazyPut<VendorRepositoryImp>(() => VendorRepositoryImp(Get.find<VendorRemoteDataSourceImp>()),fenix: true);
    // third instance from useCases
    // 1- get home data useCase
    Get.lazyPut<HomeDataUseCase>(() => HomeDataUseCase(Get.find<VendorRepositoryImp>()),fenix: true);
    // 2- get vendor details useCase
    Get.lazyPut<VendorDetailsUseCase>(() => VendorDetailsUseCase(Get.find<VendorRepositoryImp>()),fenix: true);
    // 3- get vendor under category details useCase
    Get.lazyPut<VendorUnderCategoryUseCase>(() => VendorUnderCategoryUseCase(Get.find<VendorRepositoryImp>()),fenix: true);
    // 4- get categories useCase
    Get.lazyPut<CategoriesUseCase>(() => CategoriesUseCase(Get.find<VendorRepositoryImp>()),fenix: true);
    super.onInit();
  }
}