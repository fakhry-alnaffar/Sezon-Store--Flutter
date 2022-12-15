import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/helpers/app_colors.dart';
import '../../../../core/helpers/text_style.dart';
import '../dash_line.dart';

class OrderDetailsItem extends StatelessWidget {
  const OrderDetailsItem({
    Key? key,
    required this.orderNumber,
    required this.subTotal,
    required this.deliveryPrice,
    required this.taxPrice,
    required this.discount,
    required this.total,
  }) : super(key: key);
  final int orderNumber;
  final double subTotal;
  final double deliveryPrice;
  final double taxPrice;
  final double discount;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            top: 40.h,
            bottom: 23.h,
          ),
          child: Text(
            'Order Number: #$orderNumber',
            style: AppTextStyle.headTitleBlack,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: 15.w,
            end: 50.w,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Subtotal',
                    style: AppTextStyle.subTitleBlack,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 19.h,
                    ),
                    child: Text(
                      'Delivery price',
                      style: AppTextStyle.subTitleBlack,
                    ),
                  ),
                  Text(
                    'Tax price',
                    style: AppTextStyle.subTitleBlack,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 19.h,
                      bottom: 33.h,
                    ),
                    child: Text(
                      'Discount',
                      style: AppTextStyle.subTitleBlack,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$subTotal QAR ',
                    style: GoogleFonts.poppins(
                      color: AppColors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 19.h,
                    ),
                    child: Text(
                      '$deliveryPrice QAR',
                      style: GoogleFonts.poppins(
                        color: AppColors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '$taxPrice QAR',
                    style: GoogleFonts.poppins(
                      color: AppColors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 19.h,
                      bottom: 33.h,
                    ),
                    child: Text(
                      '$discount QAR',
                      style: GoogleFonts.poppins(
                        color: AppColors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: 15.w,
            end: 50.w,
            bottom: 20.h,
          ),
          child: DashLine(
            width: 10,
            color: const Color(0xFF707070).withOpacity(0.20),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: 15.w,
            end: 50.w,
          ),
          child: Row(
            children: [
              Text(
                'Total',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const Spacer(),
              Text(
                '$total QAR ',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}