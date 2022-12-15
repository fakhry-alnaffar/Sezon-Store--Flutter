import 'package:camel_express_user/vendor/presentation/getx/controller/offers_product_getx_conftoller.dart';
import 'package:camel_express_user/vendor/presentation/getx/controller/venodr_getx_controller.dart';
import 'package:camel_express_user/vendor/presentation/widget/is_favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../core/widget/custom_appbar.dart';

class OfferTabScreen extends GetView<OffersProductGetXController> {
  const OfferTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: CustomAppBar(
        onFavPressed: () {},
        title: SizedBox(
          width: 170.w,
          height: 70.h,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
          ),
        ),
        notification: '5',
        backgroundColor: AppColors.lightGrey,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          GetBuilder<OffersProductGetXController>(
            builder: (controller) => ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 60.h,
                maxWidth: double.infinity.w,
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 25.w,
                  );
                },
                itemCount: Get.find<VendorGetXController>().vendor!.offers.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var item = Get.find<VendorGetXController>().vendor!.offers[index];
                  return GestureDetector(
                    onTap: () => controller.changeIndex(index,item.id.toString()),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      height: 52.h,
                      width: 131.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: controller.tabIndex == index
                            ? AppColors.primary
                            : const Color(0xFFEBEBEB),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              item.url,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Text(
                                item.name,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: controller.tabIndex == index
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          controller.obx(
            onLoading: const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
            onError: (error) => Center(
              child: Text(error!),
            ),
            (data){
             return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 26.h),
                itemCount: data!.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return IsFavoriteItem(
                    onPressed: () {},
                    product: data[index],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
