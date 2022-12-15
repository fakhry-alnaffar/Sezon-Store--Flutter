import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/helpers/app_colors.dart';
import '../../../../core/helpers/text_style.dart';

class PurchasedProducts extends StatelessWidget {
  const PurchasedProducts({
    Key? key,
    required this.image,
    required this.name,
    required this.rate,
    required this.quantity,
    required this.deliveryFee,
    required this.price,
    required this.starNumber,
    required this.description,
  }) : super(key: key);
  final String image;
  final String name;
  final double rate;
  final String quantity;
  final String deliveryFee;
  final String price;
  final double starNumber;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 109.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.r,
        ),
        color: AppColors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(
              start: 19.w,
            ),
            clipBehavior: Clip.antiAlias,
            width: 75.w,
            height: 78.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                7.r,
              ),
            ),
            child: Image.asset(
              'assets/images/$image.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: AppTextStyle.headTitleBlack,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Container(
                      alignment: AlignmentDirectional.center,
                      width: 51.w,
                      height: 13.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.r),
                        color: const Color(0xFF64C225),
                      ),
                      child: Text(
                        description,
                        style: GoogleFonts.poppins(
                          fontSize: 7.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'QAR $price',
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 4.h,
                    bottom: 10.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                        initialRating: starNumber,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemSize: 9,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.w),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Color(0xFFFFA407),
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        rate.toString(),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 8.sp,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        ' ($quantity)',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 8.sp,
                          color: AppColors.sameGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg_images/delivery.svg',
                      width: 16.w,
                      height: 14.h,
                    ),
                    SizedBox(width: 6.8.w),
                    Text(
                      'QAR $deliveryFee Delivery Fee',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 8.sp,
                        color: AppColors.sameGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 21.w),
        ],
      ),
    );
  }
}