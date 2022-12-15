import 'package:camel_express_user/auth/domain/usecase/check_order_usecase.dart';
import 'package:camel_express_user/auth/domain/usecase/login_usecase.dart';
import 'package:camel_express_user/core/prefs/shared_pref_controller.dart';
import 'package:camel_express_user/core/service/address_service_locator.dart';
import 'package:camel_express_user/core/service/order_service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/service/vendor_service_locator.dart';

class LoginGetXController extends GetxController {
  final LoginUseCase _loginUseCase;
  final CheckOrderUseCase _checkOrderUseCase;

  late TextEditingController emailOrPhoneTextController;
  late TextEditingController passwordTextController;
  RxBool passwordObscure = true.obs;

  @override
  void onInit() {
    emailOrPhoneTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailOrPhoneTextController.dispose();
    passwordTextController.dispose();
    super.onClose();
  }

  LoginGetXController(this._loginUseCase, this._checkOrderUseCase);

  static LoginGetXController to = Get.find<LoginGetXController>();

  void _login() async {
    var res = await _loginUseCase.execute(data: {
      "mobile": emailOrPhoneTextController.text,
      "password": passwordTextController.text
    });
    res.fold(
      (error) => _onError(error.message),
      (user) async {
        // here we need to put the shared controller into the memory to save the token after the user login
        SharedPrefController().save(user: user);
        // then here we vendor the product controller dependencies after initialize it and put them into the memory
        await Get.putAsync<VendorServiceLocator>(
          () => Future(
            () => VendorServiceLocator(),
          ),
        );
        _checkOrder();
      },
    );
  }

  void execute() {
    if (_checkData()) {
      _login();
    }
  }

  void _checkOrder() async {
    var res = await _checkOrderUseCase.execute();
    res.fold(
      (error) async {
        await Get.putAsync<AddressServiceLocator>(() => Future(() => AddressServiceLocator()));
        await Get.putAsync<OrderServiceLocator>(() => Future(() => OrderServiceLocator()));
        Get.offNamed("/address_screen");
      },
      (orderId) async {
        await SharedPrefController().saveOrderId(orderId: orderId.toString());
        Get.offNamed("/bottom_nav_screen");
      },
    );
  }

  bool _checkData() {
    if (emailOrPhoneTextController.text.isNotEmpty &&
        passwordTextController.text.isNotEmpty) {
      return true;
    }
    _onError("enter required data");
    return false;
  }

  void _onError(String message) => Get.snackbar(
        "Error",
        message,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
}
