import 'package:camel_express_user/user/presentation/getx/controller/change_password_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../core/widget/app_text_button.dart';
import '../../../core/widget/column_app_text_field.dart';
import '../../../core/widget/custom_appbar.dart';

class ChangePasswordScreen extends GetView<ChangePasswordGetXController> {

  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text(
            'Change Password',
          ),
        backgroundColor: AppColors.white,
        toolbarHeight: 110.h,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 20.h,
              bottom: 24.h,
            ),
            child: ColumnAppTextField(
              title: 'Current Password',
              keyboardType: TextInputType.visiblePassword,
              controller: controller.currentPasswordTextController,
              height: 42,
              shadowColor: Colors.transparent,
              width: double.infinity,
            ),
          ),
          ColumnAppTextField(
            title: 'New Password',
            keyboardType: TextInputType.visiblePassword,
            controller: controller.newPasswordTextController,
            height: 42,
            shadowColor: Colors.transparent,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 24.h,
              bottom: 72.h,
            ),
            child: ColumnAppTextField(
              title: 'Confirm Password',
              keyboardType: TextInputType.visiblePassword,
              controller: controller.confirmPasswordTextController,
              height: 42,
              shadowColor: Colors.transparent,
              width: double.infinity,
            ),
          ),
          Center(
            child: AppTextButton(
              width: 356,
              text: 'Done',
              onPressed: () => controller.execute(),
            ),
          ),
        ],
      ),
    );
  }
}
