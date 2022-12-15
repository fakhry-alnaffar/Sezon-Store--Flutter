import 'package:camel_express_user/user/domain/usecase/edit_profile_usecase.dart';
import 'package:camel_express_user/user/presentation/getx/controller/profile_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../core/widget/custom_appbar.dart';
import '../../../core/widget/elevated_button_with_icon.dart';
import '../widget/profile_details.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = Get.put<ProfileGetXController>(
      ProfileGetXController(Get.find<EditProfileUseCase>()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F3EF),
      appBar: CustomAppBar(
        onFavPressed: () {},
        title: const Text('Profile'),
        notification: '5',
        backgroundColor: AppColors.white,
      ),
      body: Column(
        children: [
          Obx(
            () => ProfileDetails(
              image: controller.currentUser.value.imageUrl,
              name: controller.currentUser.value.firstName,
              phone: controller.currentUser.value.mobileNo,
              onEditImgPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 33.h, bottom: 15.h),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.symmetric(vertical: 18.h,),
              width: double.infinity.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.white,
              ),
              child: Column(
                children: [
                  ElevatedButtonWithIcon(
                    onPressed: () => Get.toNamed("/edit_profile_screen"),
                    title: 'Edit Profile',
                    icon: SvgPicture.asset(
                      'assets/svg_images/edit_icon.svg',
                      width: 15.4.w,
                      height: 17.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 18.h),
                    child: ElevatedButtonWithIcon(
                      onPressed: () {},
                      title: 'Payment Method',
                      icon: SvgPicture.asset(
                        'assets/svg_images/payment_icon.svg',
                        width: 15.4.w,
                        height: 12.h,
                      ),
                    ),
                  ),
                  ElevatedButtonWithIcon(
                    onPressed: () {},
                    title: 'Locations',
                    icon: SvgPicture.asset(
                      'assets/svg_images/Location.svg',
                      color: const Color(0xFF515151),
                      width: 15.4.w,
                      height: 18.8.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.symmetric(vertical: 18.h,),
            width: double.infinity.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.white,
            ),
            child: Column(
              children: [
                ElevatedButtonWithIcon(
                  onPressed: () => Get.toNamed('/my_order_screen'),
                  title: 'My Order',
                  icon: SvgPicture.asset(
                    'assets/svg_images/order_icon.svg',
                    color: const Color(0xFF515151),
                    width: 15.w,
                    height: 15.h,
                  ),
                ),
                SizedBox(height: 18.h,),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButtonWithIcon(
                          onPressed: () {},
                          title: 'Language',
                          icon: SvgPicture.asset(
                            'assets/svg_images/language_icon.svg',
                            width: 19.8.w,
                            height: 19.8.h,
                          ),
                        ),
                      ),
                      ToggleSwitch(
                        fontSize: 12.sp,
                        inactiveBgColor: AppColors.lightWhite,
                        activeBgColor: const [AppColors.primary],
                        cornerRadius: 4.r,
                        radiusStyle: true,
                        minHeight: 25.h,
                        minWidth: 45.w,
                        initialLabelIndex: 0,
                        totalSwitches: 2,
                        labels: const ['En', 'عربي'],
                        onToggle: (index) {},
                      ),
                      SizedBox(
                        width: 28.w,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 18.h),
                  child: ElevatedButtonWithIcon(
                    onPressed: () {},
                    title: 'My Wallet',
                    icon: SvgPicture.asset(
                      'assets/svg_images/wallet_icon.svg',
                      width: 15.w,
                      height: 15.h,
                    ),
                  ),
                ),
                ElevatedButtonWithIcon(
                  onPressed: () => Get.toNamed("/change_password_screen"),
                  title: 'Change Password',
                  icon: SvgPicture.asset(
                    'assets/svg_images/change_pass_icon.svg',
                    width: 16.w,
                    height: 16.h,
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                ElevatedButtonWithIcon(
                  onPressed: () => Get.toNamed('/help_and_support_screen'),
                  title: 'help & Support',
                  icon: SvgPicture.asset(
                    'assets/svg_images/help_icon.svg',
                    width: 17.w,
                    height: 17.h,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ElevatedButtonWithIcon(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/login_screen");
              },
              title: 'logout',
              icon: CircleAvatar(
                radius: 15.5.r,
                backgroundColor: const Color(0xFFFF0000),
                child: const RotatedBox(
                  quarterTurns: 2,
                  child: Icon(
                    Icons.logout,
                    color: AppColors.white,
                    size: 17,
                  ),
                ),
              ),
              heightButton: 54,
              padding: 15,
            ),
          ),
        ],
      ),
    );
  }
}
