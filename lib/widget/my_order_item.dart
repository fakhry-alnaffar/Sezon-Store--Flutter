import 'package:camel_express_user/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrderItem extends StatelessWidget {
  const MyOrderItem({
    Key? key,
    required this.orderNum,
    required this.date,
    required this.time,
    required this.total,
    required this.paymentMethod,
    required this.productImage,
    required this.itemNum,
    required this.orderStatus,
    required this.colorStatus,
    required this.onPressed,
  }) : super(key: key);
  final int orderNum;
  final String date;
  final String time;
  final double total;
  final String paymentMethod;
  final String productImage;
  final int itemNum;
  final String orderStatus;
  final Color colorStatus;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.r),
        color: AppColors.white,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
        horizontal: 10.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Order Num : #$orderNum',
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: onPressed,
                child: Row(
                  children: [
                    Text(
                      'Order Detail',
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF4B4B4B),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 7.w,
                        end: 13.w,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 13,
                        color: Color(0xFF4B4B4B),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 9.h,
              bottom: 12.h,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/svg_images/calendar.svg',
                  width: 19.w,
                  height: 21.h,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  '$date  |  $time',
                  style: GoogleFonts.poppins(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/svg_images/total_price.svg',
                width: 19.w,
                height: 21.h,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                'Total : $total QAR',
                style: GoogleFonts.poppins(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: SvgPicture.asset(
                  'assets/svg_images/payment_method.svg',
                  width: 12.w,
                  height: 17.h,
                ),
              ),
              Text(
                'Payment Method :',
                style: GoogleFonts.poppins(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Image.asset(
                'assets/images/$paymentMethod.png',
                width: 20.w,
                height: 22.h,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 12.h,
              bottom: 5.h,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 40.h,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 14.w,
                  );
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: AlignmentDirectional.center,
                    width: 31.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: const Color(0xFFF4F4F4),
                    ),
                    child: Image.asset(
                      'assets/images/$productImage.png',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
          Text(
            '$itemNum item',
            style: GoogleFonts.poppins(
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          RichText(
            softWrap: true,
            text: TextSpan(
              text: 'Order Status :',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
              children: <TextSpan>[
                const TextSpan(text: '  '),
                TextSpan(
                  text: orderStatus,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: colorStatus,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
