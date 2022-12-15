import 'package:camel_express_user/order/presintation/getx/controller/address/new_address_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/helpers/app_colors.dart';
import '../../../../core/helpers/text_style.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../core/widget/column_app_text_field.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../../widget/address/choose_address_mpa.dart';

class NewAddressScreen extends GetView<NewAddressGetXController> {
  const NewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: CustomAppBar(
        title: const Text('Address'),
        notification: '5',
        backgroundColor: AppColors.lightGrey,
        onFavPressed: () {},
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          SizedBox(
            height: 23.h,
          ),
          ColumnAppTextField(
            title: 'Address Name (Home, Office ,Other)',
            keyboardType: TextInputType.text,
            controller: controller.addressTextController,
            width: double.infinity,
            shadowColor: const Color.fromRGBO(0, 0, 0, 0.05),
            height: 42,
            fillColor: AppColors.white,
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            'Choose Address',
            style: AppTextStyle.subTitleGrey,
          ),
          SizedBox(
            height: 11.h,
          ),
          ChooseAddressMap(
            address: '2464 Royal Ln. Mesa, New Jersey 45463',
            onAddressSelected: (value) {
              controller.locationModel = value;
            },
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 25.h,
              bottom: 11.h,
            ),
            child: Text(
              'Detail',
              style: AppTextStyle.subTitleGrey,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromRGBO(0, 0, 0, 0.05),
                  blurRadius: 6,
                  offset: Offset(0, 3.h),
                ),
              ],
            ),
            child: TextField(
              minLines: 6,
              maxLines: 7,
              textInputAction: TextInputAction.done,
              controller: controller.detailTextController,
              keyboardType: TextInputType.text,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.r),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                border: InputBorder.none,
                fillColor: AppColors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 6.h),
                prefix: SizedBox(
                  width: 14.w,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          AppTextButton(
            text: 'Save and continue',
            onPressed: () => controller.address == null
                ? controller.execute()
                : controller.editAddress(),
            width: double.infinity,
            height: 42,
          ),
        ],
      ),
    );
  }
}
