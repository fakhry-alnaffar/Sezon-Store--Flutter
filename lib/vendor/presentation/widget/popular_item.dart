import 'package:camel_express_user/vendor/data/entity/product/vendor_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../core/helpers/text_style.dart';
import '../getx/controller/favorites_getx_controller.dart';
import '../getx/controller/venodr_getx_controller.dart';

class PopularItem extends StatefulWidget {
  PopularItem({
    Key? key,
    required this.product,
    required this.onPressed,
  }) : super(key: key);

  final VendorProduct product;

  final Function() onPressed;

  @override
  State<PopularItem> createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        width: 260.w,
        height: 200.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.white,
        ),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(
                    top: 11.h,
                    bottom: 5.h,
                    start: 9.w,
                    end: 9.w,
                  ),
                  clipBehavior: Clip.antiAlias,
                  width: 243.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Image.network(
                    widget.product.img,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 19.h,
                  right: 20.w,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Get.find<VendorGetXController>().addToOrRemoveFavorite(product: widget.product);
                        widget.product.isFavorite = !widget.product.isFavorite;
                      });
                    },
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.white,
                          width: 3.w,
                        ),
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: widget.product.isFavorite ? AppColors.red : AppColors.grey,
                        size: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 13.w,
              ),
              child: Row(
                children: [
                  Text(
                    widget.product.name,
                    style: AppTextStyle.headTitleBlack,
                  ),
                  const Spacer(),
                  Text(
                    '\$${widget.product.price}',
                    style: GoogleFonts.poppins(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 7.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 13.w,
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
                      SizedBox(width: 6.8.w),
                      Text(
                        'QAR ${widget.product.price} Delivery Fee',
                        style: GoogleFonts.poppins(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.sameGrey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 6.w),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: AppColors.primary,
                        size: 14,
                      ),
                      SizedBox(width: 6.8.w),
                      Text(
                        widget.product.distance.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.sameGrey,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFFFFA407),
                        size: 12,
                      ),
                      SizedBox(width: 4.1.w),
                      Text(
                        widget.product.percentageOfRating.toString(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 9.sp,
                            color: AppColors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
