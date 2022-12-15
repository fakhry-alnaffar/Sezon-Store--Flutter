import 'package:camel_express_user/order/presintation/getx/controller/order/cart_getx_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/helpers/app_colors.dart';
import '../../../../core/widget/app_text_field.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../../widget/address/address_row.dart';
import '../../widget/custom_stack_container.dart';
import '../../widget/order/payment_item.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    Key? key,
    required this.total,
  }) : super(key: key);

  final double total;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String discountCode = 'Do you have an discount code?';
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenColor,
      appBar: CustomAppBar(
        title: const Text('Checkout'),
        notification: '5',
        backgroundColor: AppColors.screenColor,
        onFavPressed: () {},
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          ListView(
            padding: EdgeInsetsDirectional.only(
              start: 20.w,
              end: 20.w,
              bottom: 290.h,
            ),
            children: [
              AddressRow(
                address:
                    '2464 Royal Ln. Mesa, New Jersey 45463 North Las Vegas (NV)',
                onPressed: () {},
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                'Payment Method',
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return PaymentItem(
                    image: 'cash',
                    nameCard: 'Cash',
                    numberCard: '*****************',
                    onChanged: (value) {},
                  );
                },
              ),
              InkWell(
                onTap: () => setState(() => isVisible = !isVisible),
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    Container(
                      width: double.infinity.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.white,
                      ),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(10.r),
                        color: const Color(0xFF9E9A9A),
                        dashPattern: const [3],
                        child: Center(
                          child: Text(
                            discountCode,
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF2E2E2E),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 15.w),
                      child: SvgPicture.asset(
                        'assets/svg_images/discount.svg',
                        width: 23.w,
                        height: 26.h,
                        color: const Color(0xFF373737),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isVisible,
                child: Column(
                  children: [
                    SizedBox(
                      height: 32.h,
                    ),
                    AppTextField(
                      controller: TextEditingController(),
                      keyboardType: TextInputType.text,
                      backgroundColor: AppColors.white,
                      width: double.infinity,
                      height: 56,
                      hint: 'Enter Your Coupon code',
                      hintColor: AppColors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
          CustomStackContainer(
            total: widget.total,
            title: 'Confirm Payment',
            titleRow: 'Sub total',
            price: 30.00,
            customRow: [
              StackRowModel(titleRow: 'Sub total', price: widget.total),
            ],
            onPressed: () => CartGetXController.to.checkOut(),
          ),
        ],
      ),
    );
  }
}
