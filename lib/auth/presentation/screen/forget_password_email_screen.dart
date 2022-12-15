import 'package:camel_express_user/core/widget/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../core/helpers/text_style.dart';

class ForgetPasswordEmailScreen extends StatefulWidget {
  const ForgetPasswordEmailScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordEmailScreen> createState() =>
      _ForgetPasswordEmailScreenState();
}

class _ForgetPasswordEmailScreenState extends State<ForgetPasswordEmailScreen> {
  late TextEditingController _emailTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: false,
        toolbarHeight: 90.h,
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsetsDirectional.only(
            top: 60.h,
            start: 20.w,
          ),
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
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: 40.h,
                bottom: 20.h,
              ),
              child: Text(
                'keep on with the Email',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),
            ),
            Container(
              width: 153.w,
              height: 168.h,
              color: Colors.transparent,
              child: Image.asset(
                'assets/images/phone.png',
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: 20.h,
                bottom: 35.h,
              ),
              child: Text(
                'You Will Receive 4 Digit Code To Verify Next',
                style: AppTextStyle.subTitleSmall,
              ),
            ),
            Container(
              padding: EdgeInsetsDirectional.only(
                start: 12.w,
                end: 8.w,
              ),
              width: 388.w,
              height: 65.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  7.r,
                ),
                color: AppColors.lightWhite,
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                              top: 20.h,
                            ),
                            child: SizedBox(
                              height: 45.h,
                              width: 240.w,
                              child: TextField(
                                controller: _emailTextController,
                                keyboardType: TextInputType.emailAddress,
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                                decoration: const InputDecoration(
                                  fillColor: AppColors.lightWhite,
                                  filled: true,
                                  contentPadding: EdgeInsets.zero,
                                  hintMaxLines: 1,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.transparent),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.transparent),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                              top: 8.h,
                            ),
                            child: Text(
                              'Enter Your Email Address',
                              style: AppTextStyle.headTitleSmall,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  AppTextButton(
                    text: 'Continue',
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/verification_screen',);
                    },
                    width: 127.w,
                    height: 40.h,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
