import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/app_colors.dart';
class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.hint,
    this.prefixIcon,
    required this.keyboardType,
    required this.controller,
    this.focusedBorderColor = Colors.transparent,
    this.obscureText = false,
    this.suffixIcon,
    this.width = 330,
    this.height = 50,
    this.backgroundColor = AppColors.lightWhite,
    this.hintColor = AppColors.primary,
  }) : super(key: key);

  final String hint;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Color focusedBorderColor;
  final Widget? suffixIcon;
  final bool obscureText;
  final double width,height;
  final Color backgroundColor;
  final Color hintColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height.h,
          width: width.w,
          child: TextField(
            cursorColor: AppColors.primary,
            cursorHeight: 20.h,
            controller: controller,
            keyboardType: keyboardType,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            obscureText: obscureText,
            decoration: InputDecoration(
              fillColor: backgroundColor,
              filled: true,
              contentPadding: EdgeInsets.zero,
              hintText: hint,
              hintStyle: GoogleFonts.poppins(
                fontSize: 16.sp,
                color: hintColor,
                fontWeight: FontWeight.w400,
              ),
              hintMaxLines: 1,
              suffixIcon: suffixIcon,
              prefix: SizedBox(width: 14.w,),
              enabledBorder: buildOutlineInputBorder(),
              focusedBorder:
              buildOutlineInputBorder(color: focusedBorderColor),
            ),
          ),
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
