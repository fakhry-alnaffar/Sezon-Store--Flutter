import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../core/helpers/text_style.dart';
import '../../../core/widget/app_text_button.dart';
import 'dash_line.dart';

class StackRowModel {
  String titleRow;
  double price;

  StackRowModel({required this.titleRow,required this.price});
}

class CustomStackContainer extends StatelessWidget {
  const CustomStackContainer({
    Key? key,
    required this.total,
    required this.title,
    required this.titleRow,
    required this.price,
    required this.customRow,
    required this.onPressed,
  }) : super(key: key);
  final double total;
  final String title;
  final String titleRow;
  final double price;
  final List<StackRowModel> customRow;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 428.w,
      height: 265.h,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(154, 194, 37, 0.25),
            blurRadius: 40,
            offset: Offset(0, -3),
          ),
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
        ),
        color: AppColors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (StackRowModel name in customRow)
              Padding(
                padding: EdgeInsetsDirectional.only(bottom: 27.h),
                child: Row(
                  children: [
                    Text(
                      name.titleRow,
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'QAR ${name.price}',
                      style: AppTextStyle.subTitleBlack,
                    ),
                  ],
                ),
              ),
            const DashLine(),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: 9.h,
                bottom: 20.h,
              ),
              child: Row(
                children: [
                  Text(
                    'Total',
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'QAR $total',
                    style: AppTextStyle.subTitleBlack,
                  ),
                ],
              ),
            ),
            AppTextButton(
              text: title,
              onPressed: onPressed,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}