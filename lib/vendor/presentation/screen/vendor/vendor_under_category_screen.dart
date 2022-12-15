import 'package:camel_express_user/vendor/presentation/getx/controller/vendor_under_category_getx_controller.dart';
import 'package:camel_express_user/vendor/presentation/screen/vendor/vendor_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/helpers/app_colors.dart';
import '../../../../core/helpers/text_style.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../../widget/vendor_item.dart';
import '../../widget/vendor_near_you.dart';

class VendorUnderCategoryScreen
    extends GetView<VendorUnderCategoryGetXController> {
  VendorUnderCategoryScreen({super.key, required String categoryId}) {
    controller.getVendorDetails(categoryId: categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.screenColor,
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
          backgroundColor: AppColors.screenColor,
          notification: '5',
        ),
        body: controller.obx(
          onLoading: const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          ),
          onError: (error) => Center(
            child: Text(error!),
          ),
          onEmpty: const Center(child: Text("empty Data"),),
          (vendor) {
            return ListView(
              padding: EdgeInsets.symmetric(
                vertical: 20.h,
                horizontal: 20.w,
              ),
              children: [
                Text(
                  'Vendor Near You',
                  style: AppTextStyle.subTitle,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 14.h,
                    bottom: 31.h,
                  ),
                  child: VendorNearYou(
                    onPressed: (id) => Get.to(
                      () => VendorDetailsScreen(
                        vendorId: id,
                      ),
                    ),
                    list: vendor!.vendorsNearest,
                  ),
                ),
                Text(
                  'All Vendor',
                  style: AppTextStyle.subTitle,
                ),
                SizedBox(
                  height: 24.h,
                ),
                ListView.builder(
                  itemCount: vendor.allVendors.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return VendorItem(
                      onPressed: () => Get.to(
                        () => VendorDetailsScreen(
                          vendorId: vendor.allVendors[index].id.toString(),
                        ),
                      ),
                      vendor: vendor.allVendors[index],
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
