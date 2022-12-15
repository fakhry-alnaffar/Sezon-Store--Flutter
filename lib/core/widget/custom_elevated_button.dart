import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        alignment: AlignmentDirectional.center,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: MaterialStateProperty.all(0),
        minimumSize:
        MaterialStateProperty.all(Size(24.w, 23.h)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all(AppColors.primary),
      ),
      child: Icon(
        icon,
        color: AppColors.white,
        size: 16,
      ),
    );
  }
}
