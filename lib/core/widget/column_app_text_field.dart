import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/app_colors.dart';
import '../helpers/text_style.dart';

class ColumnAppTextField extends StatelessWidget {
  const ColumnAppTextField({
    Key? key,
    required this.title,
    this.prefixIcon,
    required this.keyboardType,
    required this.controller,
    this.focusedBorderColor = Colors.transparent,
    this.fillColor = AppColors.lightWhite,
    this.shadowColor = const Color.fromRGBO(0, 0, 0, 0.16),
    this.obscureText = false,
    this.suffixIcon,
    this.width = 324,
    this.height = 50,
  }) : super(key: key);

  final String title;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Color focusedBorderColor;
  final Color fillColor;
  final Color shadowColor;
  final Widget? suffixIcon;
  final bool obscureText;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyle.subTitleGrey,
            ),
            SizedBox(
              height: 7.h,
            ),
            SizedBox(
              height: height.h,
              width: width.w,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: 6,
                      offset: Offset(0, 3.h),
                    ),
                  ],
                ),
                child: TextField(
                  cursorColor: AppColors.primary,
                  cursorHeight: 20.h,
                  controller: controller,
                  keyboardType: keyboardType,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    fillColor: fillColor,
                    filled: true,
                    contentPadding: EdgeInsets.zero,
                    hintMaxLines: 1,
                    // prefixIcon: Icon(prefixIcon, color: const Color(0xFF40AA54),),
                    suffixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(end: 13.w,),
                      child: suffixIcon,
                    ),
                    prefix: SizedBox(
                      width: 14.w,
                    ),
                    enabledBorder: buildOutlineInputBorder(),
                    focusedBorder:
                    buildOutlineInputBorder(color: focusedBorderColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder(
      {Color color = Colors.transparent}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(7.r),
      borderSide: BorderSide(color: color),
    );
  }
}