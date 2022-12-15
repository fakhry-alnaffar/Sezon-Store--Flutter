import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/helpers/app_colors.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../core/widget/custom_appbar.dart';

class OperationSuccessScreen extends StatefulWidget {
  const OperationSuccessScreen({Key? key}) : super(key: key);

  @override
  State<OperationSuccessScreen> createState() => _OperationSuccessScreenState();
}

class _OperationSuccessScreenState extends State<OperationSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: SizedBox(
          width: 170.w,
          height: 70.h,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
          ),
        ),
        backgroundColor: AppColors.white,
        notification: '5', onFavPressed: () {  },
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 43.w),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 50.h,
            ),
            child: Center(
              child: SizedBox(
                width: 260.w,
                height: 230.h,
                child: SvgPicture.asset(
                  'assets/svg_images/operation_success.svg',
                ),
              ),
            ),
          ),
          Text(
            'operation accomplished successfully',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 20.h,
            ),
            child: Text(
              'Congratulations, your purchase has been successfully completed',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: AppTextButton(
              text: 'See Order Detail',
              onPressed: () => Get.toNamed("/order_details_screen"),
              width: double.infinity,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 22.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: AppTextButton(
              text: 'Go to home',
              onPressed: () => Get.offNamedUntil("/bottom_nav_screen",((route) => false)),
              width: double.infinity,
              fontWeight: FontWeight.w500,
              backgroundColor: AppColors.white,
              borderColor: AppColors.primary,
              textColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}