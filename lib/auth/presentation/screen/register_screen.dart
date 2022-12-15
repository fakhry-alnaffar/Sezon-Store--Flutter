import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/helpers/app_colors.dart';
import '../../../core/helpers/text_style.dart';
import '../../../core/widget/app_text_button.dart';
import '../../../core/widget/column_app_text_field.dart';
import '../../../core/widget/custom_dropdown_menu.dart';
import '../../../vendor/presentation/screen/product/product_details_screen.dart';
import '../widget/image_logo.dart';
import '../getx/controller/register_getx_controller.dart';

class RegisterScreen extends GetView<RegisterGetXController> {

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body:Obx((){
        if(controller.loading.isTrue){
          return const Center(child: CircularProgressIndicator(color: AppColors.primary,),);
        }else if(controller.loading.isFalse && controller.cities.isEmpty){
          return Center(child: Text(controller.errorMessage.value),);
        }else {
          return ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            children: [
              SizedBox(height: 30.h,),
              const Center(child: ImageLogo()),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 30.h,
                  bottom: 15.h,
                ),
                child: Center(
                  child: Text(
                    'Welcome Back!',
                    style: AppTextStyle.bigTitle,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Sign Up',
                  style: AppTextStyle.title,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 23.h,
                  bottom: 15.h,
                ),
                child: Center(
                  child: ColumnAppTextField(
                    title: 'User Name',
                    keyboardType: TextInputType.name,
                    controller: controller.nameTextController,
                  ),
                ),
              ),
              Center(
                child: ColumnAppTextField(
                  title: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  controller:  controller.emailTextController,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15.h,
                ),
                child: Center(
                  child: ColumnAppTextField(
                    title: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    controller:  controller.passwordTextController,
                    obscureText: controller.passwordObscure.value,
                    suffixIcon: IconButton(
                      padding: EdgeInsetsDirectional.zero,
                      onPressed: () {
                        controller.passwordObscure.value = !controller.passwordObscure.value;
                      },
                      icon: Icon(
                        controller.passwordObscure.value ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: ColumnAppTextField(
                  title: 'Confirm Password',
                  keyboardType: TextInputType.visiblePassword,
                  controller:  controller.confirmPasswordTextController,
                  obscureText: controller.passwordConfirmObscure.value,
                  suffixIcon: IconButton(
                    padding: EdgeInsetsDirectional.zero,
                    onPressed: () {
                      controller.passwordConfirmObscure.value = !controller.passwordConfirmObscure.value;
                    },
                    icon: Icon(
                      controller.passwordConfirmObscure.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15.h,
                ),
                child: Center(
                  child: ColumnDropdownMenu(
                    title: 'Country',
                    itemsTitle: controller.countries.map((element)=> DropdownMenuModel(id: element.id, title: element.name)).toList(),
                    valueTitle: controller.selectedCountryId.value,
                    onChange: (value) => controller.selectedCountryId.value = value,
                  ),
                ),
              ),
              Center(
                child: ColumnDropdownMenu(
                  title: 'City',
                  itemsTitle: controller.cities.map((element)=> DropdownMenuModel(id: element.id, title: element.name)).toList(),
                  valueTitle: controller.selectedCityId.value,
                  onChange: (value) => controller.selectedCityId.value = value,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 14.h,
                  bottom: 39.h,
                ),
                child: Center(
                  child: ColumnAppTextField(
                    title: 'Phone Number',
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: false,
                    ),
                    controller: controller.phoneTextController,
                  ),
                ),
              ),
              Center(
                child: AppTextButton(
                  text: 'Sign Up',
                  onPressed: () => controller.execute(),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 40.h,
                  bottom: 20.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I am already a member?',
                      style: AppTextStyle.subTitleBlack,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    TextButton(
                      style: AppTextStyle.textButtonStyle,
                      onPressed: () => Get.offNamed('/login_screen'),
                      child: Text(
                        'Sign In',
                        style: AppTextStyle.subTitleButton,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
