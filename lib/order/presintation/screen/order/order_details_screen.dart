import 'package:camel_express_user/order/presintation/getx/controller/order/order_detaisl_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/helpers/app_colors.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../../widget/address/address_item.dart';
import '../../widget/order/order_details_item.dart';
import '../../widget/order/order_time_line.dart';
import '../../widget/order/purchased_products_item.dart';

class OrderDetailsScreen extends GetView<OrderStateGetXController> {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: const Text(
          'Order Details',
        ),
        notification: '5',
        backgroundColor: AppColors.white,
        onFavPressed: () {},
      ),
      body: controller.obx(
        onLoading: const Center(child: CircularProgressIndicator(color: AppColors.primary,),),
        onError: (error) => const Center(child: Text("error"),),
        (order){
          var orderDetails = order!.orderDetail;
          var products = order.products;
          var orderStatusList = order.orderStatusList;
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            children: [
              Text(
                'Order Time Line',
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 7.w),
                child: OrderTimeLine(
                  activeIndex: 2,
                  list: orderStatusList,
                ),
              ),
               OrderDetailsItem(
                orderNumber: orderDetails.id,
                subTotal: orderDetails.total.toDouble(),
                deliveryPrice: orderDetails.deliveryPrice.toDouble(),
                taxPrice: orderDetails.taxAmount.toDouble(),
                discount: orderDetails.couponDiscount.toDouble(),
                total: orderDetails.total.toDouble(),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 40.h,
                  bottom: 23.h,
                ),
                child: Text(
                  'Purchased Products',
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
              ),
              ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var item = products[index];
                  return Column(
                    children: [
                      PurchasedProducts(
                        image: 'steak',
                        name: item.name,
                        starNumber: 5,
                        rate: 5.0,
                        deliveryFee: '5',
                        quantity: '+100',
                        price: '30.00',
                        description: 'FREE SHIPPING',
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          );
        },
      ),
    );
  }
}
