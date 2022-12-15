import 'package:camel_express_user/vendor/data/data_source/product_remote_data_source.dart';
import 'package:camel_express_user/vendor/domain/usecase/favorites_usecase.dart';
import 'package:camel_express_user/vendor/domain/usecase/get_offers_usecase.dart';
import 'package:camel_express_user/vendor/domain/usecase/product_details_usecase.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../../vendor/data/repository/product_repository.dart';

class ProductServiceLocator extends GetxService{
  @override
  void onInit() {
    // first we need instance from the data source
    Get.lazyPut<ProductRemoteDataSourceImp>(() => ProductRemoteDataSourceImp(),fenix: true);
    // second instance from the repo
    Get.lazyPut<ProductRepositoryImp>(() => ProductRepositoryImp(Get.find<ProductRemoteDataSourceImp>()),fenix: true);
    // third instance from useCases
    // 1- get favorites list useCase
    Get.lazyPut<FavoritesUseCase>(() => FavoritesUseCase(Get.find<ProductRepositoryImp>()),fenix: true);
    // 2- get product details useCase
    Get.lazyPut<ProductDetailsUseCase>(() => ProductDetailsUseCase(Get.find<ProductRepositoryImp>()),fenix: true);
    // 3- get offers useCase
    Get.lazyPut<GetOffersUseCase>(() => GetOffersUseCase(Get.find<ProductRepositoryImp>()),fenix: true);
    super.onInit();
  }
}