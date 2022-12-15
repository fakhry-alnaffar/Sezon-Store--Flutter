import 'package:camel_express_user/vendor/presentation/getx/controller/categories_getx_controller.dart';
import 'package:camel_express_user/vendor/presentation/screen/vendor/vendor_under_category_screen.dart';
import 'package:camel_express_user/vendor/presentation/widget/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/helpers/app_colors.dart';
import '../../../core/helpers/text_style.dart';
import '../../../core/widget/custom_appbar.dart';

class CategoriesScreen extends GetView<CategoriesGetXController> {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: CustomAppBar(
        title: SizedBox(
          width: 170.w,
          height: 70.h,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
          ),
        ),
        backgroundColor: AppColors.lightGrey,
        notification: '5',
        onFavPressed: () {},
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
        (list) => ListView(
          // physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            vertical: 20.h,
            horizontal: 20.w,
          ),
          children: [
            CustomSearch(
              onSubmitted: (value) {},
              hintText: 'Search Category',
              onMicPressed: () {},
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: 35.h,
                bottom: 33.h,
              ),
              child: Text(
                'Choose Category',
                style: AppTextStyle.subTitle,
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: list!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 40.h,
                childAspectRatio: 207.h / 151.w,
              ),
              itemBuilder: (context, index) {
                var item = list[index];
                return InkWell(
                  onTap: () => Get.to(
                    () => VendorUnderCategoryScreen(
                      categoryId: item.id.toString(),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 151.w,
                      height: 207.h,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(6, 13, 217, 0.05),
                            blurRadius: 8,
                            offset: Offset(0, 5.h),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(
                          20.r,
                        ),
                        color: AppColors.white,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 9.w,
                        vertical: 9.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      RotationTransition(
                      turns: const AlwaysStoppedAnimation(337 / 360),
                          child: Image.network(
                            item.url,
                            width: 60.w,
                            height: 76.h,
                          ),),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            item.name,
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
