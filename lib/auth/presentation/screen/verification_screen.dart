import 'package:camel_express_user/core/widget/app_text_button.dart';
import 'package:camel_express_user/auth/presentation/widget/image_logo.dart';
import 'package:camel_express_user/auth/presentation/widget/verification_number_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../core/helpers/text_style.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late TextEditingController _firstDigitController;
  late TextEditingController _secondDigitController;
  late TextEditingController _thirdDigitController;
  late TextEditingController _fourthDigitController;

  @override
  void initState() {
    super.initState();
    _firstDigitController = TextEditingController();
    _secondDigitController = TextEditingController();
    _thirdDigitController = TextEditingController();
    _fourthDigitController = TextEditingController();
  }

  @override
  void dispose() {
    _firstDigitController.dispose();
    _secondDigitController.dispose();
    _thirdDigitController.dispose();
    _fourthDigitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: ListView(
        children: [
          ImageLogo(),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 52.h,
              bottom: 7.h,
            ),
            child: Center(
              child: Text(
                'Verification Code',
                style: AppTextStyle.title,
              ),
            ),
          ),
          Center(
            child: Text(
              'Enter The 4 Digit Code That Was Sent To Your Phone',
              style: AppTextStyle.subTitleGrey,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 42.h,
              bottom: 78.h,
            ),
            child: VerificationNumberRow(
              controllers: [
                _firstDigitController,
                _secondDigitController,
                _thirdDigitController,
                _fourthDigitController
              ],
            ),
          ),
          Center(
            child: AppTextButton(
              text: 'Continue',
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/create_new_password_screen');
              },
            ),
          ),
        ],
      ),
    );
  }
}
