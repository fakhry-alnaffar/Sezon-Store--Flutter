import 'package:camel_express_user/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    Key? key,
    required this.hintText,
    required this.onMicPressed,
    required this.onSubmitted,
  }) : super(key: key);

  final String hintText;
  final void Function(String)? onSubmitted;
  final void Function() onMicPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      width: double.infinity,
      child: TextField(
        onSubmitted: onSubmitted,
        keyboardType: TextInputType.text,
        style: GoogleFonts.poppins(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          fillColor: AppColors.lightWhite,
          filled: true,
          contentPadding: EdgeInsets.zero,
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: 14.sp,
            color: AppColors.sameGrey,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              7.r,
            ),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintMaxLines: 1,
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.sameGrey,
            size: 22,
          ),
          suffixIcon: IconButton(
            padding: EdgeInsetsDirectional.zero,
            onPressed: onMicPressed,
            icon: SvgPicture.asset(
              'assets/svg_images/mic.svg',
              width: 15.w,
              height: 20.h,
              color: AppColors.sameGrey,
            ),
          ),
        ),
      ),
    );
  }
}
