import 'package:camel_express_user/core/service/order_service_locator.dart';
import 'package:camel_express_user/core/service/user_service_locator.dart';
import 'package:camel_express_user/vendor/domain/usecase/favorites_usecase.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/service/address_service_locator.dart';
import '../../../../core/service/product_service_locator.dart';
import '../../../../order/domain/usecase/order/cart_usecase.dart';
import '../../../../order/domain/usecase/order/checkout_usecase.dart';
import '../../../../order/presintation/getx/controller/order/cart_getx_controller.dart';
import '../../../data/entity/home/home.dart';
import '../../../domain/usecase/home_data_usecase.dart';
import 'favorites_getx_controller.dart';

class HomeGetXController extends GetxController with StateMixin<Home> {
  final HomeDataUseCase _homeDataUseCase;

  // late TextEditingController searchTextController;
  late PageController pageViewController;
  final CarouselController carouselController = CarouselController();

  RxInt pageIndex = 0.obs;

  HomeGetXController(this._homeDataUseCase);

  @override
  void onInit() async {
    getHomeData();
    // here we prepare the product controller dependencies after initialize it and put them into the memory
    await Get.putAsync<ProductServiceLocator>(() => Future(() => ProductServiceLocator()));
    await Get.putAsync<UserServiceLocator>(() => Future(() => UserServiceLocator()));
    // temporary i have to remove it when we remove the cart from the bottom nav
    await Get.putAsync<OrderServiceLocator>(() => Future(() => OrderServiceLocator()));
    await Get.putAsync<AddressServiceLocator>(() => Future(() => AddressServiceLocator()));
    Get.put<FavoritesGetXController>(FavoritesGetXController(Get.find<FavoritesUseCase>()));
    Get.lazyPut(() => CartGetXController(Get.find<CartDataUseCase>(),Get.find<CheckOutUseCase>()));
    // searchTextController = TextEditingController();
    pageViewController = PageController(initialPage: 1);
    super.onInit();
  }

  @override
  void onClose() {
    // searchTextController.dispose();
    pageViewController.dispose();
    super.onClose();
  }

  void getHomeData() async {
    change(null, status: RxStatus.loading());
    var data = await _homeDataUseCase.execute();
    data.fold(
      (error) => change(
        null,
        status: RxStatus.error(error.message),
      ),
      (data){
        change(
          data,
          status: RxStatus.success(),
        );
      }
    );
  }
}
