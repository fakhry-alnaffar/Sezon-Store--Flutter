import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/helpers/app_colors.dart';
import '../../../core/widget/app_text_button.dart';

class ConfirmBottomSheet extends StatelessWidget {
  const ConfirmBottomSheet({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: AppColors.white,
      onClosing: () {
        Navigator.pop(context);
      },
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 41.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'تأكيد البلاغ',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: AppColors.extraBlack,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 16.h,
                        bottom: 4.h,
                      ),
                      child: Text(
                        'الوصف',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: AppColors.extraBlack,
                        ),
                      ),
                    ),
                    Text(
                      'بلاغ عن سرقة كابل بالتل',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.lightGrey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 16.h,
                        bottom: 4.h,
                      ),
                      child: Text(
                        'الموقع',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: AppColors.extraBlack,
                        ),
                      ),
                    ),
                    Text(
                      'خانيونس , الفخاري , شارع صوفا',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.lightGrey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 16.h,
                        bottom: 4.h,
                      ),
                      child: Text(
                        'المرفقات',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: AppColors.extraBlack,
                        ),
                      ),
                    ),
                    Text(
                      'لا ملفات مرفقة',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.lightGrey,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    AppTextButton(
                      text: 'تأكيد',
                      onPressed: onPressed,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
