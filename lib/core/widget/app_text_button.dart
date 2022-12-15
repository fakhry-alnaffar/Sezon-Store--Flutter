import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/app_colors.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 321.1,
    this.height = 42,
    this.textColor = AppColors.white,
    this.backgroundColor = AppColors.primary,
    this.borderColor = Colors.transparent,
    this.radius = 7,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,

  }) : super(key: key);

  final String text;
  final Color textColor;
  final void Function() onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color borderColor;
  final double radius;
  final int fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsetsDirectional.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius.r),
            ),
            backgroundColor: backgroundColor,
            side: BorderSide(
              color: borderColor,
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: fontSize.sp,
              fontWeight: fontWeight,
              color: textColor,
            ),
          ),
      ),
    );
  }
}
