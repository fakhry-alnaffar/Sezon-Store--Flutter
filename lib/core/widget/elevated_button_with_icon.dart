import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/app_colors.dart';
import '../helpers/text_style.dart';

class ElevatedButtonWithIcon extends StatelessWidget {
  const ElevatedButtonWithIcon({
    Key? key,
    required this.title,
    required this.icon,
    this.heightButton = 10,
    this.backgroundColor = AppColors.white,
    required this.onPressed,
    this.padding = 17,
  }) : super(key: key);
  final String title;
  final Widget icon;
  final double padding;
  final double heightButton;
  final Color backgroundColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
        alignment: AlignmentDirectional.centerStart,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: MaterialStateProperty.all(0),
        minimumSize:
        MaterialStateProperty.all(Size(double.infinity.w, heightButton.h)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      icon: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padding.w,
        ),
        child: icon,
      ),
      label: Text(
        title,
        style: AppTextStyle.headTitleBlack,
      ),
    );
  }
}
