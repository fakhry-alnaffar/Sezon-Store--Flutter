import 'package:camel_express_user/dropdown_country_model.dart';
import 'package:camel_express_user/user/presentation/getx/controller/profile_getx_controller.dart';
import 'package:camel_express_user/widget/drop_down_flag_with_zip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../core/widget/app_text_button.dart';
import '../../../core/widget/app_text_field.dart';
import '../../../core/widget/column_app_text_field.dart';
import '../../../core/widget/custom_appbar.dart';

class EditProfileScreen extends GetView<ProfileGetXController> {

  EditProfileScreen({super.key});

  final List<DropdownCountryModel> _flagWithZip = <DropdownCountryModel>[
    DropdownCountryModel(id: 1, flag: 'qatar', title: '+974'),
    DropdownCountryModel(id: 2, flag: 'qatar', title: '+974'),
    DropdownCountryModel(id: 3, flag: 'qatar', title: '+974'),
  ];
  int selectedCountryZip = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        onFavPressed: (){},
        title: const Text('Edit Profile'),
        notification: '5',
        backgroundColor: AppColors.white,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 20.h,
              bottom: 24.h,
            ),
            child: ColumnAppTextField(
              title: 'Name',
              keyboardType: TextInputType.visiblePassword,
              controller: controller.userNameController,
              height: 42,
              shadowColor: Colors.transparent,
              width: double.infinity,
            ),
          ),
          ColumnAppTextField(
            title: 'Email',
            keyboardType: TextInputType.visiblePassword,
            controller: controller.emailTextController,
            height: 42,
            shadowColor: Colors.transparent,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 24.h,
              bottom: 7.h,
            ),
            child: Text(
              'Phone Number',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: AppColors.grey,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: DropdownFlagWithZip(
                  itemsTitle: _flagWithZip,
                  valueTitle: selectedCountryZip,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 13.w,
              ),
              Expanded(
                flex: 4,
                child: AppTextField(
                  keyboardType: TextInputType.phone,
                  controller: controller.mobileNumberTextController, hint: '',
                ),
              ),
            ],
          ),
          SizedBox(height: 72.h,),
          Center(
            child: AppTextButton(
              width: 356,
              text: 'Done',
              onPressed: () => controller.execute(),
            ),
          ),
        ],
      ),
    );
  }
}