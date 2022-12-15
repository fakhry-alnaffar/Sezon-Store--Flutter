import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/helpers/app_colors.dart';
import '../../../core/helpers/text_style.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    Key? key,
    required this.image,
    required this.name,
    required this.phone,
    required this.onEditImgPressed,
  }) : super(key: key);
  final String image;
  final String name;
  final String phone;
  final void Function() onEditImgPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsetsDirectional.only(
        start: 20.w,
        bottom: 20.h,
      ),
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Container(
                width: 70.w,
                height: 75.h,
                padding: EdgeInsetsDirectional.only(end: 6.w,bottom: 5.h),
                child: Container(
                  width: 58.w,
                  height: 58.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.r),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                onTap: onEditImgPressed,
                child: Container(
                  alignment: AlignmentDirectional.center,
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primary,
                      width: 1.2.w,
                    ),
                  ),
                  child: SvgPicture.asset(
                    'assets/svg_images/edit_image_icon.svg',
                    width: 8.5.w,
                    height: 8.5.h,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 15.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTextStyle.headTitleBlack,
              ),
              SizedBox(
                height: 7.h,
              ),
              Text(
                phone,
                style: AppTextStyle.headTitleBlack,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
