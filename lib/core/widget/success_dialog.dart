import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/app_colors.dart';
import 'app_text_button.dart';

class SuccessDialog extends StatelessWidget {
  // final String icon;
  final String title;

  // final String subTitle;

  const SuccessDialog({
    Key? key,
    required this.title,
    // required this.subTitle,
    // required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 23.w,
      ),
      child: Stack(
        children: [
          AlertDialog(
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                3.r,
              ),
            ),
            elevation: 0,
            backgroundColor: AppColors.white,
            title: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 32.h,
                horizontal: 32.w,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  AppTextButton(
                    text: 'OK',
                    onPressed: () {},
                    width: 82,
                    height: 29,
                    radius: 3,
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.topCenter,
            width: 52.w,
            height: 52.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            child: Text(
              '!',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 26.sp,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
