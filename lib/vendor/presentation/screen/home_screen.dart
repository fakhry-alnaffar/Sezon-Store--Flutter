import 'package:camel_express_user/vendor/presentation/getx/controller/home_getx_controller.dart';
import 'package:camel_express_user/vendor/presentation/screen/stars_screen.dart';
import 'package:camel_express_user/vendor/presentation/screen/vendor/vendor_details_screen.dart';
import 'package:camel_express_user/vendor/presentation/screen/vendor/vendor_under_category_screen.dart';
import 'package:camel_express_user/vendor/presentation/widget/custom_search.dart';
import 'package:camel_express_user/vendor/presentation/widget/resturant_near_you.dart';
import 'package:camel_express_user/vendor/presentation/widget/title_and_view_all.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/helpers/app_colors.dart';
import '../../../core/helpers/text_style.dart';
import '../../../core/widget/custom_appbar.dart';
import '../../data/entity/home/home_item.dart';
import '../getx/binding/product_binding.dart';

class HomeScreen extends GetView<HomeGetXController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getHomeData();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        onFavPressed: () => Get.toNamed("favorite_screen"),
        backgroundColor: AppColors.white,
        notification: '5',
        title: const Text("Home"),
      ),
      body: controller.obx(
        onLoading: const Center(
          child: CircularProgressIndicator(
            color: AppColors.primary,
          ),
        ),
        onEmpty: const Center(child: Text("No data")),
        onError: (error) => Center(
          child: Text(error!),
        ),
        (home) {
          print("home data => ${home!.categories.length}");
          print("home data => ${home.popularStores.length}");
          print("home data => ${home.offersImages.length}");
          print("home data => ${home.restaurantNearYou.length}");
          print("home data => ${home.popularStars.length}");
          return ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            children: [
              CustomSearch(
                onSubmitted: (value) {
                  Get.toNamed('/search_screen');
                },
                hintText: 'Search',
                onMicPressed: () {},
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 23.h,
                  bottom: 15.h,
                ),
                child: TitleAndViewAll(
                  title: 'Popular Stores',
                  onPressed: () {},
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 95.h,
                ),
                child: home.popularStores.isNotEmpty
                    ? GridView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: home !.popularStores.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 19.w,
                          childAspectRatio: 95.h / 60.w,
                        ),
                        itemBuilder: (context, index) {
                          var item = home.popularStores[index];
                          return InkWell(
                            onTap: () {
                              Get.to(
                                () => VendorDetailsScreen(
                                  vendorId:
                                      home.popularStores[index].id.toString(),
                                ),
                                binding: ProductBinding(),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  width: 72.w,
                                  height: 72.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.lightWhite,
                                  ),
                                  // padding: EdgeInsets.symmetric(
                                  //   horizontal: 9.w,
                                  //   vertical: 9.h,
                                  // ),
                                  child: Image.network(
                                    item.url,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                  item.name,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        })
                    : const Center(
                        child: Text("no data"),
                      ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 41.h,
                  bottom: 15.h,
                ),
                child: TitleAndViewAll(
                  title: 'Category',
                  onPressed: () => Get.toNamed("/categories_screen"),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 107.h,
                ),
                child: home.categories.isNotEmpty
                    ? GridView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: home.categories.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 20.w,
                          childAspectRatio: 107.h / 86.w,
                        ),
                        itemBuilder: (context, index) {
                          var item = home.categories[index];
                          return InkWell(
                            onTap: () => Get.to(
                              () => VendorUnderCategoryScreen(
                                categoryId:
                                    home.categories[index].id.toString(),
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: 86.w,
                                  height: 77.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      7.r,
                                    ),
                                    color: AppColors.lightWhite,
                                  ),
                                  // padding: EdgeInsets.symmetric(
                                  //   horizontal: 11.w,
                                  //   vertical: 10.h,
                                  // ),
                                  child: Image.network(
                                    item.url,
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 9.h,
                                ),
                                Text(
                                  item.name,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.sameGrey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        })
                    : const Center(
                        child: Text("no data"),
                      ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 41.h),
                child: sliderImages(context, home.offersImages),
              ),
              Text(
                'Vendor Near You',
                style: AppTextStyle.subTitle,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 14.h,
                  bottom: 28.h,
                ),
                child: ResturantNearYou(
                  onPressed: (id) {
                    Get.to(
                      () => VendorDetailsScreen(
                        vendorId: id,
                      ),
                      binding: ProductBinding(),
                    );
                  },
                  list: home.restaurantNearYou,
                ),
              ),
              TitleAndViewAll(
                title: 'Popular Stars',
                onPressed: () => Get.to(
                  () => StarsScreen(list: home.popularStars),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 15.h,
                  bottom: 70.h,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 216.h,
                  ),
                  child: home.popularStars.isNotEmpty
                      ? GridView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: home.popularStars.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 19.w,
                            childAspectRatio: 216.h / 139.w,
                          ),
                          itemBuilder: (context, index) {
                            var item = home.popularStars[index];
                            return InkWell(
                              onTap: () => Get.to(
                                () => VendorDetailsScreen(
                                  vendorId: item.id.toString(),
                                ),
                                binding: ProductBinding(),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12.h,
                                ),
                                width: 139.w,
                                height: 216.h,
                                color: AppColors.lightWhite,
                                child: Image.network(item.url),
                              ),
                            );
                          },
                        )
                      : const Center(
                          child: Text("no data"),
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget sliderImages(BuildContext context, List<HomeItem> advertiseImage) {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        height: 290.h,
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  controller.pageIndex.value = index;
                },
                aspectRatio: 2,
                viewportFraction: 1,
                height: 250.h,
                pageSnapping: true,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.decelerate,
                enlargeCenterPage: true,
              ),
              items: advertiseImage
                  .map(
                    (item) => Container(
                      height: 250.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            7.r,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(item.url),
                          )),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: advertiseImage.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () =>
                      controller.carouselController.animateToPage(entry.key),
                  child: Container(
                    width: controller.pageIndex.value != entry.key ? 8.0 : 12,
                    height: controller.pageIndex.value != entry.key ? 8.0 : 12,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.blueGrey.shade50
                              : AppColors.primary)
                          .withOpacity(
                        controller.pageIndex.value == entry.key ? 0.9 : 0.4,
                      ),
                    ),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
