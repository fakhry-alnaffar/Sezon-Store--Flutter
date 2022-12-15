import 'package:camel_express_user/order/data/data_source/order_remote_data_source.dart';
import 'package:camel_express_user/order/data/repository/order_repository.dart';
import 'package:camel_express_user/order/domain/usecase/order/cart_usecase.dart';
import 'package:camel_express_user/order/domain/usecase/order/checkout_usecase.dart';
import 'package:camel_express_user/order/domain/usecase/order/make_order_usecase.dart';
import 'package:get/get.dart';

import '../../order/domain/usecase/order/get_order_state_usecase.dart';

class OrderServiceLocator extends GetxService{
  @override
  void onInit() {
    // first we need instance from the data source
    Get.lazyPut<OrderRemoteDataSourceImp>(() => OrderRemoteDataSourceImp(),fenix: true);
    // second instance from the repo
    Get.lazyPut<OrderRepositoryImp>(() => OrderRepositoryImp(Get.find<OrderRemoteDataSourceImp>()),fenix: true);
    // third instance from useCases
    // 1- get cart data useCase
    Get.lazyPut<CartDataUseCase>(() => CartDataUseCase(Get.find<OrderRepositoryImp>()),fenix: true);
    // 2- make order useCase
    Get.lazyPut<MakeOrderUseCase>(() => MakeOrderUseCase(Get.find<OrderRepositoryImp>()),fenix: true);
    // 3- check out useCase
    Get.lazyPut<CheckOutUseCase>(() => CheckOutUseCase(Get.find<OrderRepositoryImp>()),fenix: true);
    // 4- check out useCase
    Get.lazyPut<OrderStateUseCase>(() => OrderStateUseCase(Get.find<OrderRepositoryImp>()),fenix: true);
    super.onInit();
  }
}