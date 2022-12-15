import 'package:camel_express_user/core/helpers/app_colors.dart';
import 'package:camel_express_user/order/data/entity/cart/cart.dart';
import 'package:camel_express_user/order/domain/usecase/order/cart_usecase.dart';
import 'package:camel_express_user/order/domain/usecase/order/checkout_usecase.dart';
import 'package:get/get.dart';

import '../../../screen/order/checkout_screen.dart';

class CartGetXController extends GetxController with StateMixin<Cart> {
  final CartDataUseCase _useCase;
  final CheckOutUseCase _checkOutUseCase;

  CartGetXController(this._useCase, this._checkOutUseCase);

  static CartGetXController to = Get.find<CartGetXController>();

  Cart? cart;

  @override
  void onInit() {
    _getData();
    super.onInit();
  }

  Future<bool> addOrRemoveFromCart({
    required Map<String, dynamic> map,
  }) async {
    bool success = false;
    var res = await _useCase.addOrRemove(data: map);
    res.fold(
      (error) => Get.snackbar(
        "Error",
        error.message,
        backgroundColor: AppColors.red,
      ),
      (data) {
        success = data != 0.0;
        cart!.total = data;
        int index = cart!.list.indexWhere((element) => element.id.toString() == map["product_id"]);
        if (map["flag"] == "1") {
          cart!.list[index].quantity++;
        } else {
          if (cart!.list[index].quantity == 1) {
            cart!.list.removeAt(index);
            change(cart, status: RxStatus.success());
            return;
          }
          cart!.list[index].quantity--;
        }
        change(cart, status: RxStatus.success());
      },
    );
    return success;
  }

  void deleteFromCart({
    required Map<String, dynamic> map,
  }) async {
    var res = await _useCase.addOrRemove(data: map);
    res.fold(
      (error) => Get.snackbar(
        "Error",
        error.message,
        backgroundColor: AppColors.red,
      ),
      (data) {
        cart!.total = data;
        int index = cart!.list.indexWhere((element) => element.id.toString() == map["product_id"]);
        cart!.list.removeAt(index);
        change(cart, status: RxStatus.success());
      },
    );
  }

  void navigateToCheckout() async {
    var res = await _useCase.execute();
    res.fold(
      (error) => Get.snackbar(
        "Error",
        error.message,
        backgroundColor: AppColors.red,
      ),
      (data) {
        Get.to(() => CheckoutScreen(total: data.total));
      },
    );
  }

  Future<void> _getData() async {
    change(null, status: RxStatus.loading());
    var res = await _useCase.execute();
    res.fold(
      (error) => change(
        null,
        status: RxStatus.error(error.message),
      ),
      (data) {
        cart = data;
        change(
          cart,
          status: RxStatus.success(),
        );
      },
    );
  }

  void checkOut() async {
    var res = await _checkOutUseCase.execute();
    res.fold(
      (error) =>
          Get.snackbar("Error", error.message, backgroundColor: AppColors.red),
      (success) {
        Get.offNamedUntil("/bottom_nav_screen", ((route) => false));
      },
    );
  }
}
