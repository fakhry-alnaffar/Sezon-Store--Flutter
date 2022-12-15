import 'package:camel_express_user/order/presintation/getx/controller/order/cart_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../core/helpers/text_style.dart';
import '../../../core/widget/custom_elevated_button.dart';

class CartItem extends StatefulWidget {
   CartItem({
    Key? key,
    required this.image,
    required this.name,
    required this.rate,
    required this.star,
    required this.numberRates,
    required this.id,
    required this.variation,
    required this.quantity,
    required this.deliveryFee,
    required this.price,
    required this.controller,
  }) : super(key: key);
  final String image;
  final String name;
  final double rate;
  final String id;
  final String variation;
  final double star;
  final String numberRates;
  late int quantity;
  final String deliveryFee;
  final double price;
  final CartGetXController controller;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
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
            child: Image.network(
              widget.image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.name,
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
                      initialRating: widget.star,
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
                      widget.rate.toString(),
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 8.sp,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      ' (${widget.numberRates})',
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
                    width: 15.w,
                    height: 14.h,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    'QAR ${widget.deliveryFee} Delivery Fee',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 8.sp,
                      color: AppColors.sameGrey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'QAR ${widget.price}',
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotatedBox(
                quarterTurns: 1,
                child: CustomElevatedButton(
                  icon: Icons.add,
                  onPressed: () async {
                    var res = await widget.controller.addOrRemoveFromCart(
                      map: getData(
                        flag: "1",
                        productId: widget.id,
                        variationId: widget.variation,
                      ),
                    );
                    if(res){
                      setState(() {
                        widget.quantity++;
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Text(
                  widget.quantity.toString(),
                  style: AppTextStyle.headTitleBlack,
                ),
              ),
              RotatedBox(
                quarterTurns: 1,
                child: CustomElevatedButton(
                  icon: Icons.remove,
                  onPressed: () async {
                    var res = await widget.controller.addOrRemoveFromCart(
                      map: getData(
                        flag: "2",
                        productId: widget.id,
                        variationId: widget.variation,
                      ),
                    );
                    if(res){
                      setState(() {
                        widget.quantity--;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(width: 40.w),
        ],
      ),
    );
  }

  Map<String, dynamic> getData({
    required String flag,
    required String productId,
    required String variationId,
  }) {
    return {
      "flag": flag,
      "product_id": productId,
      "variation_id": variationId,
      "quantity": "1",
    };
  }
}