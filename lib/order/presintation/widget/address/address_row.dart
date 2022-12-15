import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/helpers/app_colors.dart';
import '../../../../core/helpers/text_style.dart';

class AddressRow extends StatelessWidget {
  const AddressRow({
    Key? key,
    required this.address,
    required this.onPressed,
  }) : super(key: key);
  final String address;
  final void Function() onPressed;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: AlignmentDirectional.center,
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: AppColors.primary.withOpacity(0.38),
          ),
          child: SvgPicture.asset(
            'assets/svg_images/Location.svg',
            width: 18.w,
            height: 23.h,
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Text(
            address,
            overflow: TextOverflow.fade,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              color: AppColors.sameGrey,
            ),
          ),
        ),
        SizedBox(width: 10.w,),
        TextButton(
          style: AppTextStyle.textButtonStyle,
          onPressed: onPressed,
          child: Text(
            'Edit Address',
            style: GoogleFonts.poppins(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF0044FF),
            ),
          ),
        ),
      ],
    );
  }
}