import 'package:camel_express_user/core/helpers/app_colors.dart';
import 'package:camel_express_user/core/helpers/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    Key? key,
    required this.image,
    required this.name,
    required this.rate,
    required this.quantity,
    required this.location,
    required this.star,
    required this.price,
    required this.onFavoritePressed,
    required this.onAddPressed,
  }) : super(key: key);
  final String image;
  final String name;
  final double rate;
  final String quantity;
  final String location;
  final double star;
  final double price;
  final void Function() onFavoritePressed;
  final void Function() onAddPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 135.w,
        height: 240.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 9.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 9.h,
                    ),
                    clipBehavior: Clip.antiAlias,
                    width: 117.w,
                    height: 112.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Image.asset(
                      'assets/images/$image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 15.h,
                    right: 8.w,
                    child: InkWell(
                      onTap: onFavoritePressed,
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.white,
                            width: 2.2.w,
                          ),
                        ),
                        child: const Icon(
                          Icons.favorite_outline,
                          color: AppColors.primary,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                name,
                style: AppTextStyle.headTitleBlack,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 6.h,
                  bottom: 7.h,
                ),
                child: Row(
                  children: [
                    RatingBar.builder(
                      initialRating: star,
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
                        fontSize: 9.sp,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      ' ($quantity)',
                      style: GoogleFonts.poppins(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.sameGrey,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg_images/Location.svg',
                    width: 9.w,
                    height: 15.h,
                  ),
                  SizedBox(width: 4.6.w),
                  Text(
                    location,
                    style: GoogleFonts.poppins(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.sameGrey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 7.h,
              ),
              Row(
                children: [
                  Text(
                    'QAR $price',
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: onAddPressed,
                    child: Container(
                      width: 22.w,
                      height: 22.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.primary,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: AppColors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
