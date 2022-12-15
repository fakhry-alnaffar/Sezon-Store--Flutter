import 'package:camel_express_user/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportItem extends StatelessWidget {
  const SupportItem({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);
  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        childrenPadding: EdgeInsetsDirectional.only(
          start: 50.w,
          end: 50.w,
          bottom: 10.h,
        ),
        backgroundColor: const Color(0xFFF3F3F3),
        leading: const Icon(
          Icons.add,
          size: 22,
          color: AppColors.black,
        ),
        tilePadding: EdgeInsetsDirectional.only(
          start: 15.w,
        ),
        trailing: const SizedBox(),
        collapsedBackgroundColor: const Color(0xFFF3F3F3),
        children: [
          Text(
            answer,
            style: GoogleFonts.poppins(
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF5F5F5F),
              height: 2.h,
            ),
          ),
        ],
      ),
    );
  }
}
