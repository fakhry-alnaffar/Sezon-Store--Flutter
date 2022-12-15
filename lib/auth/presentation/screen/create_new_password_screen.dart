
import 'package:camel_express_user/core/widget/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../core/helpers/text_style.dart';
import '../../../core/widget/app_text_field.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  late TextEditingController _passwordTextController;
  late TextEditingController _confirmPasswordTextController;

  @override
  void initState() {
    super.initState();
    _passwordTextController = TextEditingController();
    _confirmPasswordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordTextController.dispose();
    _confirmPasswordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          SizedBox(
            width: 120.w,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Container(
                    width: 103.w,
                    height: 149.h,
                    color: Colors.transparent,
                    child: Image.asset(
                      'assets/images/create_pass.png',
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Container(
                    width: 35.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF9B4AFE),
                      ),
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                    child: const Icon(
                      Icons.done,
                      color: Color(0xFF0FCC28),
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Create New Password',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 30.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Your new password must be different from',
            style: AppTextStyle.headTitle,
          ),
          Text(
            'previously used password',
            style: AppTextStyle.headTitle,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 35.h,
              bottom: 15.h,
            ),
            child: AppTextField(
              hint: 'New Password',
              keyboardType: TextInputType.visiblePassword,
              controller: _passwordTextController,
            ),
          ),
          AppTextField(
            hint: 'Confirm password',
            keyboardType: TextInputType.visiblePassword,
            controller: _confirmPasswordTextController,
          ),
          SizedBox(
            height: 25.h,
          ),
          AppTextButton(
            text: 'Create',
            height: 50,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home_screen');
            },
          ),
        ],
      ),
    );
  }
}
