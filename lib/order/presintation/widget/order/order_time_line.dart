import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:camel_express_user/order/data/entity/order/order_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/helpers/app_colors.dart';

class OrderTimeLine extends StatefulWidget {
  const OrderTimeLine({
    Key? key,
    required this.activeIndex,
    required this.list,
  }) : super(key: key);
  final List<OrderStatus> list;
  final int activeIndex;

  @override
  State<OrderTimeLine> createState() => _OrderTimeLineState();
}

class _OrderTimeLineState extends State<OrderTimeLine> {
  List<StepperData> stepperData = [];

  @override
  void initState() {
    stepperData = widget.list.map((e) => StepperData(title: e.statusName, subtitle: "subtitle")).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnotherStepper(
      stepperList: stepperData,
      stepperDirection: Axis.vertical,
      // horizontalStepperHeight: 0,
      gap: 15.h,
      dotWidget: Container(
        width: 25.w,
        height: 25.h,
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
          vertical: 3.h,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
          border: Border.all(
            color: AppColors.primary,
            width: 2.w,
          ),
        ),
        child: CircleAvatar(
          radius: 5.r,
          backgroundColor: AppColors.primary,
        ),
      ),
      activeBarColor: AppColors.primary,
      inActiveBarColor: const Color(0xFFB6B6B6),
      activeIndex: widget.activeIndex,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.grey,
      ),
    );
  }
}