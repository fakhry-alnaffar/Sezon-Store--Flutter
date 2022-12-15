import 'package:camel_express_user/order/presintation/getx/binding/address/add_new_address_binding.dart';
import 'package:camel_express_user/order/presintation/getx/controller/address/address_getx_controller.dart';
import 'package:camel_express_user/order/presintation/screen/address/add_new_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../core/helpers/app_colors.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../../../../vendor/presentation/widget/custom_search.dart';
import '../../widget/address/address_item.dart';

class AddressScreen extends GetView<AddressGetXController> {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: CustomAppBar(
        onFavPressed: () {},
        title: const Text('Address'),
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
        onEmpty: const Center(
          child: Text("no data"),
        ),
        (data) => ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            SizedBox(
              height: 23.h,
            ),
            Row(
              children: [
                const Spacer(),
                AppTextButton(
                  text: '+ New Address',
                  onPressed: () => Get.to(
                    () => const NewAddressScreen(),
                    binding: NewAddressBinding(),
                  ),
                  backgroundColor: AppColors.primary.withOpacity(0.38),
                  width: 90.w,
                  height: 32.h,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.primary,
                  radius: 5,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: 22.h,
                bottom: 31.h,
              ),
              child: CustomSearch(
                onSubmitted: (value) {},
                hintText: 'Find Address',
                onMicPressed: () {},
              ),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var item = data[index];
                return Slidable(
                  key: const ValueKey(0),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    dismissible: DismissiblePane(onDismissed: () {}),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          controller.removeAddress(id: item.id.toString());
                        },
                        backgroundColor:
                            const Color.fromRGBO(154, 194, 37, 0.17),
                        foregroundColor: AppColors.red,
                        icon: Icons.delete,
                        borderRadius: BorderRadius.circular(7.r),
                        flex: 2,
                      ),
                      SlidableAction(
                        onPressed: (context) => Get.to(
                          () => const NewAddressScreen(),
                          binding: NewAddressBinding(address: item),
                        ),
                        backgroundColor:
                            const Color.fromRGBO(154, 194, 37, 0.17),
                        foregroundColor: AppColors.blue,
                        icon: Icons.edit,
                        borderRadius: BorderRadius.circular(7.r),
                        flex: 2,
                      ),
                    ],
                  ),
                  child: AddressItems(
                    image: 'home',
                    locationImage: 'address',
                    title: item.name,
                    location: item.locationFormat,
                    borderColor: controller.tapIndex.value == index
                        ? AppColors.primary
                        : const Color.fromRGBO(112, 112, 112, 0.10),
                    onTap: () => controller.changeIndex(index),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 20.h,
              ),
            ),
            SizedBox(
              height: 36.h,
            ),
            Visibility(
              visible: data.length != 0,
              child: Row(
                children: [
                  const Spacer(),
                  AppTextButton(
                    text: 'Next',
                    onPressed: () {},
                    width: 80.w,
                    height: 32.h,
                    fontSize: 11,
                    radius: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
