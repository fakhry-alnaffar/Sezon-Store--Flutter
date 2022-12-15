import 'package:camel_express_user/vendor/data/entity/product/vendor_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../core/helpers/text_style.dart';
import '../getx/controller/favorites_getx_controller.dart';

class IsFavoriteItem extends StatefulWidget {
   IsFavoriteItem({
    Key? key,
    required this.onPressed,
    required this.product,
  }) : super(key: key);

  final void Function() onPressed;
  final VendorProduct product;

  @override
  State<IsFavoriteItem> createState() => _IsFavoriteItemState();
}

class _IsFavoriteItemState extends State<IsFavoriteItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:widget.onPressed,
      child: Container(
        margin: EdgeInsetsDirectional.only(
          bottom: 26.h,
        ),
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
              child: Image.network(
                widget.product.img,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.product.name,
                  style: AppTextStyle.headTitleBlack,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 4.h,
                    bottom: 10.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        initialRating: widget.product.percentageOfRating.toDouble(),
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
                        widget.product.percentageOfRating.toString(),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 8.sp,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        ' (${widget.product.numberOfRaters})',
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
                      'QAR ${widget.product.price} Delivery Fee',
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
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'QAR ${widget.product.price}',
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 16.3.h),
                IconButton(
                  padding: EdgeInsetsDirectional.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    setState(() {
                      FavoritesGetXController.to.addOrRemoveFromFavorite(product: widget.product);
                      widget.product.isFavorite = !widget.product.isFavorite;
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: widget.product.isFavorite ? AppColors.red : AppColors.grey,
                    size: 18,
                  ),
                ),
              ],
            ),
            SizedBox(width: 21.w),
          ],
        ),
      ),
    );
  }
}
