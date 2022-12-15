import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/helpers/app_colors.dart';
import '../../data/entity/home/home_item.dart';

class StarItem extends StatelessWidget {
  const StarItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final HomeItem item;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 135.w,
        height: 212.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.r,
          ),
          color: AppColors.white,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 9.w,
          vertical: 11.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              width: 118.w,
              height: 158.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.lightWhite,
              ),
              child: Image.network(
                item.url,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              item.name,
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
