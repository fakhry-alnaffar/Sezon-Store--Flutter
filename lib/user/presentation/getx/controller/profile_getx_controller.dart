import 'package:camel_express_user/user/domain/usecase/edit_profile_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/prefs/shared_pref_controller.dart';
import '../../../data/entity/user.dart';

class ProfileGetXController extends GetxController {
  final EditProfileUseCase _useCase;

  ProfileGetXController(this._useCase);

  late TextEditingController emailTextController;
  late TextEditingController userNameController;
  late TextEditingController mobileNumberTextController;

  Rx<User> currentUser =  SharedPrefController().getCurrentUser().obs;

  @override
  void onInit() {
    emailTextController = TextEditingController()..text = currentUser.value.email;
    userNameController = TextEditingController()..text = "${currentUser.value.firstName} ${currentUser.value.lastName}";
    mobileNumberTextController = TextEditingController()..text = currentUser.value.mobileNo;
    super.onInit();
  }

  @override
  void onClose() {
    emailTextController.dispose();
    userNameController.dispose();
    mobileNumberTextController.dispose();
    super.onClose();
  }

  void execute() {
    if (_checkData()) {
      _editProfile();
    }
  }

  void _editProfile() async {
    var data = await _useCase.execute(
      email: emailTextController.text,
      userName: userNameController.text,
      mobileNumber: mobileNumberTextController.text,
    );
    data.fold(
      (error) {},
      (user) {
        currentUser.value = user;
        SharedPrefController().save(user: user);
        Get.back();
      },
    );
  }

  bool _checkData() {
    if (userNameController.text.isNotEmpty &&
        emailTextController.text.isNotEmpty &&
        mobileNumberTextController.text.isNotEmpty) {
      return true;
    }
    Get.snackbar("Empty Fields", "pleas enter the required data", colorText: Colors.white, backgroundColor: Colors.red);
    return false;
  }
}
