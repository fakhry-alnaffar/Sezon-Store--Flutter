import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../vendor/presentation/screen/product/product_details_screen.dart';
import '../helpers/app_colors.dart';

class ColumnDropdownMenu extends StatefulWidget {
  ColumnDropdownMenu({
    Key? key,
    required this.title,
    required this.itemsTitle,
    required this.valueTitle,
    required this.onChange,
    this.height = 50,
    this.backgroundColor = AppColors.lightWhite,
    this.titleColor = AppColors.grey,
    this.fontWeight = FontWeight.w400,
    this.sizedBoxHeight = 7,
    this.shadowColor = const Color.fromRGBO(0, 0, 0, 0.16),
    this.icon = const Icon(
      Icons.arrow_drop_down_outlined,
      color: AppColors.primary,
      size: 35,
    ),
  }) : super(key: key);

  final String title;
  final List<DropdownMenuModel> itemsTitle;
  late int? valueTitle;
  final double height;
  final Color backgroundColor;
  final Widget icon;
  final Color titleColor;
  final FontWeight fontWeight;
  final double sizedBoxHeight;
  final Color shadowColor;

  final Function(int value) onChange;

  @override
  State<ColumnDropdownMenu> createState() => _ColumnDropdownMenuState();
}

class _ColumnDropdownMenuState extends State<ColumnDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.poppins(
            color: widget.titleColor,
            fontSize: 14.sp,
            fontWeight: widget.fontWeight,
          ),
        ),
        SizedBox(
          height: widget.sizedBoxHeight.h,
        ),
        Container(
          height: widget.height.h,
          width: 324.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.r),
            color: widget.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: widget.shadowColor,
                blurRadius: 6,
                offset: Offset(0, 3.h),
              ),
            ],
          ),
          child: DropdownButton<int>(
            isExpanded: true,
            underline: const SizedBox(),
            onChanged: (int? value) {
              widget.onChange(value!);
              setState(() => widget.valueTitle = value);
            },
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(7.r),
              topLeft: Radius.circular(7.r),
            ),
            onTap: () {},
            dropdownColor: AppColors.white,
            elevation: 1,
            icon: Padding(
              padding: EdgeInsetsDirectional.only(
                end: 20.w,
              ),
              child: widget.icon,
            ),
            value: widget.valueTitle,
            items: widget.itemsTitle.map(
              (item) {
                return DropdownMenuItem<int>(
                  value: item.id,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 16.w),
                    child: Text(
                      item.title,
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
