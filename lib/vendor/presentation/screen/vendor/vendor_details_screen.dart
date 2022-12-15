import 'package:camel_express_user/vendor/data/entity/vendor/details.dart';
import 'package:camel_express_user/vendor/data/entity/vendor/vendor.dart';
import 'package:camel_express_user/vendor/presentation/getx/binding/product_binding.dart';
import 'package:camel_express_user/vendor/presentation/getx/controller/product_getx_controller.dart';
import 'package:camel_express_user/vendor/presentation/getx/controller/venodr_getx_controller.dart';
import 'package:camel_express_user/vendor/presentation/screen/offer_tab_screen.dart';
import 'package:camel_express_user/vendor/presentation/screen/product/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/helpers/app_colors.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../../getx/binding/offer_product_binding.dart';
import '../../widget/custom_search.dart';
import '../../widget/is_favorite_item.dart';
import '../../widget/menu_item.dart';
import '../../widget/popular_item.dart';

class TabModel {
  String title;
  String image;

  TabModel({
    required this.title,
    required this.image,
  });
}

class VendorDetailsScreen extends GetView<VendorGetXController> {
  VendorDetailsScreen({super.key, required String vendorId}) {
    controller.getVendorDetails(vendorId: vendorId);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
        body: controller.obx(
          onLoading: const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          ),
          onError: (error) => Center(
            child: Text(error!),
          ),
          (vendor) {
            return Stack(children: [
              ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 55.w,
                        height: 54.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            7.r,
                          ),
                          color: AppColors.lightWhite,
                        ),
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: AppColors.lightWhite,
                            radius: 19.r,
                            child: Image.network(
                              vendor!.vendorDetails.imageUrl,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            vendor.vendorDetails.companyName,
                            style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 18.w,
                                height: 18.h,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          const Color.fromRGBO(0, 0, 0, 0.16),
                                      offset: Offset(0, 3.h),
                                      blurRadius: 6,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(
                                    2.r,
                                  ),
                                  color: AppColors.white,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/svg_images/phone.svg',
                                    width: 12.w,
                                    height: 12.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                vendor.vendorDetails.mobileNo,
                                style: GoogleFonts.poppins(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.sameGrey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RatingBar.builder(
                                initialRating: 5,
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemSize: 9,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 1.w),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Color(0xFFFFA407),
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                vendor.vendorDetails.percentageOfRating
                                    .toString(),
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9.sp,
                                  color: AppColors.black,
                                ),
                              ),
                              Text(
                                ' (${vendor.vendorDetails.numberOfRaters.toString()})',
                                style: GoogleFonts.poppins(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.sameGrey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 18.w,
                                height: 18.h,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          const Color.fromRGBO(0, 0, 0, 0.16),
                                      offset: Offset(0, 3.h),
                                      blurRadius: 6,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(
                                    2.r,
                                  ),
                                  color: AppColors.white,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/svg_images/Location.svg',
                                    width: 10.w,
                                    height: 12.h,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                '${vendor.vendorDetails.country} , ${vendor.vendorDetails.province}',
                                style: GoogleFonts.poppins(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.sameGrey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 29.h,
                      bottom: 22.h,
                    ),
                    child: CustomSearch(
                      onSubmitted: (value) {
                        Get.toNamed('/search_screen');
                      },
                      hintText: 'Search',
                      onMicPressed: () {},
                    ),
                  ),
                  ConstrainedBox(
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
                      itemCount: vendor.offers.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var item = vendor.offers[index];
                        return GestureDetector(
                          onTap: () {
                            Future.delayed(
                              const Duration(milliseconds: 100),
                              () => Get.to(
                                const OfferTabScreen(),
                                binding: OfferProductBinding(
                                    offerId: item.id.toString(), index: index),
                              ),
                            );
                          },
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
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 36.h,
                      bottom: 12.h,
                    ),
                    child: Text(
                      'Menu',
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 213.h,
                    ),
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: vendor.menu.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 25.w,
                        childAspectRatio: 212.h / 135.w,
                      ),
                      itemBuilder: (context, index) {
                        return CustomMenuItem(
                          onPressed: () {
                            Get.to(
                              () => ProductDetailsScreen(
                                product: vendor.menu[index],
                              ),
                              binding: ProductBinding(),
                            );
                          },
                          menuItem: vendor.menu[index],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 29.h,
                      bottom: 12.h,
                    ),
                    child: Text(
                      'Most Popular',
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 200.h,
                    ),
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: vendor.mostPopularProducts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 18.w,
                        childAspectRatio: 200.h / 260.w,
                      ),
                      itemBuilder: (context, index) {
                        return PopularItem(
                          product: vendor.mostPopularProducts[index],
                          onPressed: () => Get.to(
                            () => ProductDetailsScreen(
                              product: vendor.mostPopularProducts[index],
                            ),
                            binding: ProductBinding(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 36.h),
                  ListView.builder(
                    itemCount: vendor.favorites.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return IsFavoriteItem(
                        product: vendor.favorites[index],
                        onPressed: () => Get.to(
                          () => ProductDetailsScreen(
                            product: vendor.favorites[index],
                          ),
                          binding: ProductBinding(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Positioned(
                bottom: 60.h,
                right: 30.w,
                child: FloatingActionButton(
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      CircleAvatar(
                        radius: 60.r,
                        backgroundColor: AppColors.white,
                        child: Center(
                          child: CircleAvatar(
                            radius: 30.r,
                            backgroundColor: AppColors.primary,
                            child: SvgPicture.asset(
                              'assets/svg_images/cart.svg',
                              width: 30.w,
                              height: 30.h,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary,
                            width: 1.5.w,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 10.r,
                          backgroundColor: AppColors.white,
                          child: Text(
                            '5',
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () => Get.toNamed("/cart_screen"),
                ),
              ),
            ]);
          },
        ),
      ),
    );
  }
}
