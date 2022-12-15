import 'package:camel_express_user/core/helpers/app_colors.dart';
import 'package:camel_express_user/dropdown_country_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownFlagWithZip extends StatefulWidget {
  DropdownFlagWithZip({
    Key? key,
    required this.itemsTitle,
    required this.valueTitle,
    required this.onPressed,
    this.backgroundColor = AppColors.lightWhite,
    this.titleColor = const Color(0xFF949494),
    this.fontWeight = FontWeight.w400,
    this.icon = const Icon(
      Icons.keyboard_arrow_down,
      color: AppColors.black,
      size: 22,
    ),
  }) : super(key: key);

  final List<DropdownCountryModel> itemsTitle;
  late int? valueTitle;
  final Color backgroundColor;
  final Widget icon;
  final Color titleColor;
  final FontWeight fontWeight;
  final void Function() onPressed;

  @override
  State<DropdownFlagWithZip> createState() => _DropdownFlagWithZipState();
}

class _DropdownFlagWithZipState extends State<DropdownFlagWithZip> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.r),
            color: widget.backgroundColor,
          ),
          child: DropdownButton<int>(
            isExpanded: true,
            underline: const SizedBox(),
            onChanged: (int? value) {
              setState(() => widget.valueTitle = value!);
            },
            borderRadius: BorderRadius.circular(7.r),
            onTap: widget.onPressed,
            dropdownColor: AppColors.white,
            elevation: 1,
            icon: Padding(
              padding: EdgeInsetsDirectional.only(
                end: 10.w,
              ),
              child: widget.icon,
            ),
            value: widget.valueTitle,
            items: widget.itemsTitle.map(
                  (item) {
                return DropdownMenuItem<int>(
                  value: item.id,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 12.w),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg_images/${item.flag}.svg',
                          width: 22.w,
                          height: 22.h,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          item.title,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                      ],
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