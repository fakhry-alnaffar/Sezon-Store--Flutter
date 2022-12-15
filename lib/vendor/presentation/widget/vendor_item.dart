import 'package:camel_express_user/vendor/data/entity/vendor/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../core/helpers/text_style.dart';

class VendorItem extends StatelessWidget {
   VendorItem({
    Key? key,
    required this.vendor,
    required this.onPressed,
  }) : super(key: key);

   final void Function() onPressed;
   final VendorDetails vendor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsetsDirectional.only(
          bottom: 20.h,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w,),
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
              width: 70.w,
              height: 67.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  7.r,
                ),
                color: AppColors.lightWhite,
              ),
              child: CircleAvatar(
                backgroundColor: AppColors.lightWhite,
                radius: 24.r,
                child: Image.network(
                  vendor.imageUrl,
                ),
              ),
            ),
            SizedBox(
              width: 9.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  vendor.companyName,
                  style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 4.h,
                    bottom: 6.h,
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg_images/delivery.svg',
                            width: 16.w,
                            height: 14.h,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            'QAR \$45 Delivery Fee',
                            style: AppTextStyle.textSmall,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            color: AppColors.primary,
                            size: 13,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            vendor.time,
                            style: AppTextStyle.textSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg_images/phone.svg',
                      width: 15.w,
                      height: 13.h,
                    ),
                    SizedBox(
                      width: 4.5.w,
                    ),
                    Text(
                      vendor.mobileNo,
                      style: AppTextStyle.textSmall,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      initialRating: vendor.percentageOfRating.toDouble(),
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
                    Text(
                      vendor.percentageOfRating.toString(),
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 7.sp,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      ' (${vendor.numberOfRaters})',
                      style: AppTextStyle.textSmall,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 10.4.h,
                    bottom: 9.h,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg_images/Location.svg',
                        width: 7.w,
                        height: 10.h,
                      ),
                      SizedBox(
                        width: 4.6.w,
                      ),
                      Text(
                        '${vendor.country} , ${vendor.province}',
                        style: AppTextStyle.textSmall,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg_images/gmail.svg',
                      width: 7.w,
                      height: 6.h,
                    ),
                    SizedBox(
                      width: 4.6.w,
                    ),
                    Text(
                      vendor.email,
                      style: AppTextStyle.textSmall,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
