import 'package:camel_express_user/vendor/presentation/getx/controller/venodr_getx_controller.dart';
import 'package:camel_express_user/vendor/presentation/screen/vendor/vendor_details_screen.dart';
import 'package:camel_express_user/vendor/presentation/widget/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/helpers/app_colors.dart';
import '../../../core/widget/custom_appbar.dart';
import '../../data/entity/home/home_item.dart';
import '../getx/binding/product_binding.dart';
import '../widget/star_item.dart';

class StarsScreen extends GetView<VendorGetXController> {
  const StarsScreen({super.key, required this.list});

  final List<HomeItem> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: CustomAppBar(
        onFavPressed: () {},
        title: const Text(
          'Stars',
        ),
        backgroundColor: AppColors.lightGrey,
        notification: '5',
      ),
      body: ListView(
        // physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
          horizontal: 20.w,
        ),
        children: [
          CustomSearch(
            onSubmitted: (value) {},
            hintText: 'Search Star',
            onMicPressed: () {},
          ),
          SizedBox(
            height: 20.h,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: list.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 35.h,
              childAspectRatio: 185.h / 135.w,
            ),
            itemBuilder: (context, index) {
              var item = list[index];
              return InkWell(
                onTap: () => Get.to(
                  () => VendorDetailsScreen(
                    vendorId: item.id.toString(),
                  ),
                  binding: ProductBinding(),
                ),
                child: StarItem(
                  item: list[index],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
