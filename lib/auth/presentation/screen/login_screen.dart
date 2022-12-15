import 'package:camel_express_user/core/widget/app_text_button.dart';
import 'package:camel_express_user/core/widget/column_app_text_field.dart';
import 'package:camel_express_user/auth/presentation/widget/image_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../core/helpers/text_style.dart';
import '../getx/controller/login_getx_controller.dart';

class LoginScreen extends GetView<LoginGetXController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 70.h,
            ),
            const ImageLogo(),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: 30.h,
                bottom: 15.h,
              ),
              child: Center(
                child: Text(
                  'Welcome Back!',
                  style: AppTextStyle.bigTitle,
                ),
              ),
            ),
            Center(
              child: Text(
                'Sign In',
                style: AppTextStyle.title,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: 23.h,
                bottom: 14.h,
              ),
              child: Center(
                child: ColumnAppTextField(
                  title: 'Email Address Or Phone Number',
                  keyboardType: TextInputType.text,
                  controller: controller.emailOrPhoneTextController,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Obx(() => ColumnAppTextField(
                      title: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.passwordObscure.value,
                      controller: controller.passwordTextController,
                      suffixIcon: IconButton(
                        padding: EdgeInsetsDirectional.zero,
                        onPressed: () {
                          controller.passwordObscure.value =
                          !controller.passwordObscure.value;
                        },
                        icon: Icon(
                          controller.passwordObscure.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.primary,
                        ),
                      ),
                    )),
                  SizedBox(
                    height: 7.h,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: 32.w,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: TextButton(
                        style: AppTextStyle.textButtonStyle,
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/forget_password_screen',
                          );
                        },
                        child: Text(
                          'Forget Password?',
                          style: AppTextStyle.subTitleButton,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: 29.h,
                // bottom: 85.h,
              ),
              child: Center(
                child: AppTextButton(
                  text: 'Sign In',
                  onPressed: () {
                    controller.execute();
                  },
                ),
              ),
            ),
            // const Spacer(),
            SizedBox(height: 30.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'I\'m a new user?',
                  style: AppTextStyle.subTitleBlack,
                ),
                SizedBox(
                  width: 3.w,
                ),
                TextButton(
                  style: AppTextStyle.textButtonStyle,
                  onPressed: () {
                    Get.toNamed("/register_screen");
                  },
                  child: Text(
                    'Sign up',
                    style: AppTextStyle.subTitleButton,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
          ],
        ),
      ),
    );
  }
}
