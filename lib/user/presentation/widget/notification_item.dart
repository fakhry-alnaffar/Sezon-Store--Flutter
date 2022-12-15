import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../core/helpers/text_style.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
    required this.image,
    required this.name,
    required this.title,
    required this.code,
    required this.time,
    required this.date,
  }) : super(key: key);
  final String image;
  final String name;
  final String title;
  final String code;
  final String time;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(top: 15.h),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 24.r,
            child: Image.asset(
              'assets/images/$image.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTextStyle.subTitle,
              ),
              SizedBox(
                height: 2.h,
              ),
              RichText(
                overflow: TextOverflow.fade,
                softWrap: true,
                text: TextSpan(
                  text:
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF857B7B),
                  ),
                  children: <TextSpan>[
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: code,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                time,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF2C3D58),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
        Text(
          date,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF8B7E7E),
          ),
        ),
      ],
    );
  }
}