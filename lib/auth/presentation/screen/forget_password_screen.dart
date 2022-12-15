
import 'package:camel_express_user/core/widget/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../core/helpers/text_style.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  List<Map<String, dynamic>> sendingMethod = [
    {'name': 'Email Address', 'click': true},
    {'name': 'Phone Number', 'click': false}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: false,
        toolbarHeight: 90.h,
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsetsDirectional.only(top: 60.h, start: 20.w,),
          child: Text(
            'Forget Password',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: 12.h,
                bottom: 29.h,
              ),
              child: Text(
                'Choose how you want to send the code',
                style: AppTextStyle.subTitleGrey,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (sendingMethod[0]['click'] == false) {
                  setState(() {
                    sendingMethod[0]['click'] = true;
                    sendingMethod[1]['click'] = false;
                  });
                }
              },
              child: Row(
                children: [
                  _radioButtonView(sendingMethod[0]['click']),
                  SizedBox(width: 4.w),
                  Text(sendingMethod[0]['name'])
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () {
                if (sendingMethod[1]['click'] == false) {
                  setState(() {
                    sendingMethod[1]['click'] = true;
                    sendingMethod[0]['click'] = false;
                  });
                }
              },
              child: Row(
                children: [
                  _radioButtonView(sendingMethod[1]['click']),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(sendingMethod[1]['name'])
                ],
              ),
            ),
            SizedBox(height: 77.h),
            Center(
              child: AppTextButton(
                text: 'Continue',
                onPressed: () {
                  if (sendingMethod[0]['click'] == true) {
                    Navigator.pushReplacementNamed(
                      context,
                      '/forget_password_email_screen',
                    );
                  }
                  else if (sendingMethod[1]['click'] == true) {
                    Navigator.pushReplacementNamed(
                      context,
                      '/forget_password_phone_screen',
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _radioButtonView(bool isClick) {
    return Container(
      width: 23.w,
      height: 23.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.borderGreen, width: 1.5.w),
      ),
      child: isClick
          ? Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.w,
                vertical: 2.w,
              ),
              child: Container(
                width: 14.w,
                height: 14.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
