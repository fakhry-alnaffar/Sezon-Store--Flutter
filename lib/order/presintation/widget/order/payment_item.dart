import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_colors.dart';
import '../../../../core/helpers/text_style.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    Key? key,
    required this.image,
    required this.nameCard,
    required this.numberCard,
    required this.onChanged,
  }) : super(key: key);
  final String image;
  final String nameCard;
  final String numberCard;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: double.infinity.w,
            height: 75.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.white,
            ),
            padding: EdgeInsets.symmetric(horizontal: 13.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 78.w,
                  height: 49.h,
                  margin: EdgeInsetsDirectional.only(end: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.r),
                    border: Border.all(
                      color: const Color(0xFF3D3855)
                          .withOpacity(0.07),
                      width: 2.w,
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/payment.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      nameCard,
                      style: AppTextStyle.subTitleBlack,
                    ),
                    nameCard == "Cash" ? const SizedBox() : Text(
                      numberCard,
                      style: AppTextStyle.subTitleBlack,
                    ),
                  ],
                ),
                const Spacer(),
                Radio(
                  value: true,
                  groupValue: true,
                  onChanged: onChanged,
                  fillColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.primary),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}