import 'package:camel_express_user/vendor/presentation/getx/controller/venodr_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/helpers/app_colors.dart';
import '../../../core/helpers/text_style.dart';
import '../../data/entity/product/vendor_product.dart';

class CustomMenuItem extends StatefulWidget {
  const CustomMenuItem({
    Key? key,
    required this.menuItem,
    required this.onPressed,
  }) : super(key: key);
  final VendorProduct menuItem;
  final Function() onPressed;

  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 135.w,
        height: 213.h,
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
                    child: Image.network(
                      widget.menuItem.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 15.h,
                    right: 8.w,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          Get.find<VendorGetXController>().addToOrRemoveFavorite(product: widget.menuItem);
                          widget.menuItem.isFavorite = !widget.menuItem.isFavorite;
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
                          color: widget.menuItem.isFavorite
                              ? Colors.red
                              : Colors.grey,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                widget.menuItem.name,
                style: AppTextStyle.headTitleBlack,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 6.h,
                  bottom: 11.h,
                ),
                child: Row(
                  children: [
                    RatingBar.builder(
                      initialRating:
                          widget.menuItem.percentageOfRating.toDouble(),
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
                      widget.menuItem.percentageOfRating.toString(),
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 9.sp,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      ' (${widget.menuItem.numberOfRaters.toString()})',
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
                    color: AppColors.primary,
                  ),
                  SizedBox(width: 4.6.w),
                  Expanded(
                    child: Text(
                      '${widget.menuItem.country},${widget.menuItem.province}',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.sameGrey,
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: widget.onPressed,
                    child: Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.primary,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: AppColors.white,
                        size: 15,
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
