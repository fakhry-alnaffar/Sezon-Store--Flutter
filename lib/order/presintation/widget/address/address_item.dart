import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/helpers/app_colors.dart';

class AddressItems extends StatefulWidget {
  const AddressItems({
    Key? key,
    required this.image,
    required this.locationImage,
    required this.title,
    required this.location,
    required this.borderColor,
    this.onTap,
  }) : super(key: key);

  final String image;
  final String locationImage;
  final String title;
  final String location;
  final Color borderColor;
  final void Function()? onTap;

  @override
  State<AddressItems> createState() => _AddressItemsState();
}

class _AddressItemsState extends State<AddressItems> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.r),
            border: Border.all(
              color: widget.borderColor,
              width: 1.5.w,
            ),
            color: AppColors.white,
          ),
          width: double.infinity.w,
          height: 119.h,
          child: ListTile(
            selected: isSelected,
            onTap: widget.onTap,
            minVerticalPadding: 0,
            minLeadingWidth: 0,
            contentPadding: EdgeInsetsDirectional.only(
              start: 17.w,
            ),
            leading: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF9F9F9),
              ),
              child: Image.asset(
                'assets/images/${widget.image}.png',
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.extraBlack,
                  ),
                ),
                Text(
                  widget.location,
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.extraBlack,
                  ),
                ),
              ],
            ),
            horizontalTitleGap: 9.w,
            trailing: Padding(
              padding: EdgeInsetsDirectional.only(
                end: 15.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 45.w,
                    height: 45.h,
                    alignment: AlignmentDirectional.center,
                    padding: EdgeInsetsDirectional.zero,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF9F9F9),
                    ),
                    child: Image.asset(
                      'assets/images/${widget.locationImage}.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}