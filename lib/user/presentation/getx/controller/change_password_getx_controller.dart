import 'package:camel_express_user/user/domain/usecase/change_password_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/prefs/shared_pref_controller.dart';

class ChangePasswordGetXController extends GetxController {
  final ChangePasswordUseCase _useCase;

  ChangePasswordGetXController(this._useCase);

  late TextEditingController currentPasswordTextController;
  late TextEditingController newPasswordTextController;
  late TextEditingController confirmPasswordTextController;

  @override
  void onInit() {
    currentPasswordTextController = TextEditingController();
    newPasswordTextController = TextEditingController();
    confirmPasswordTextController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    currentPasswordTextController.dispose();
    newPasswordTextController.dispose();
    confirmPasswordTextController.dispose();
    super.onClose();
  }

  void execute() {
    if (_checkData()) {
      _changePassword();
    }
  }

  void _changePassword() async {
    var data = await _useCase.execute(
      currentPassword: currentPasswordTextController.text,
      newPassword: newPasswordTextController.text,
      newPasswordConfirm: confirmPasswordTextController.text,
    );
    data.fold(
      (error) => Get.snackbar(
        "Password",
        error.message,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      ),
      (user) {
        SharedPrefController().save(user: user);
        Get.back();
      },
    );
  }

  bool _checkData() {
    if (newPasswordTextController.text.isNotEmpty &&
        currentPasswordTextController.text.isNotEmpty &&
        confirmPasswordTextController.text.isNotEmpty) {
      if (newPasswordTextController.text ==
          confirmPasswordTextController.text) {
        return true;
      } else {
        Get.snackbar("Password", "new passwords does not match",
            colorText: Colors.white, backgroundColor: Colors.red);
        return false;
      }
    }
    Get.snackbar("Empty Fields", "pleas enter the required data",
        colorText: Colors.white, backgroundColor: Colors.red);
    return false;
  }
}
