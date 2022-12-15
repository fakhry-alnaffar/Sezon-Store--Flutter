import 'package:camel_express_user/core/helpers/app_colors.dart';
import 'package:camel_express_user/core/widget/custom_appbar.dart';
import 'package:camel_express_user/new_screen/order_status_tabs/Cancel_order_screen.dart';
import 'package:camel_express_user/new_screen/order_status_tabs/all_order_screen.dart';
import 'package:camel_express_user/new_screen/order_status_tabs/delivered_order_screen.dart';
import 'package:camel_express_user/new_screen/order_status_tabs/in_progress_order_screen.dart';
import 'package:camel_express_user/new_screen/order_status_tabs/on_the_way_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  List<String> tabs = <String>[
    'All',
    'In progress',
    'On the way',
    'Delivered',
    'Canceled',
  ];
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenColor,
      appBar: CustomAppBar(
        title: const Text(
          'My order',
        ),
        notification: '5',
        backgroundColor: AppColors.screenColor,
        onFavPressed: () {},
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 40.h,
              maxWidth: double.infinity.w,
            ),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 15.w,
                );
              },
              itemCount: tabs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      tabIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: tabIndex == index
                          ? AppColors.primary
                          : const Color(0xFFEBEBEB),
                    ),
                    child: Center(
                      child: Text(
                        tabs[index],
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: tabIndex == index
                              ? AppColors.white
                              : AppColors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          IndexedStack(
            index: tabIndex,
            children: [
              Visibility(
                visible: tabIndex == 0,
                child: const AllOrderScreen(),
              ),
              Visibility(
                visible: tabIndex == 1,
                child: const InProgressOrderScreen(),
              ),
              Visibility(
                visible: tabIndex == 2,
                child: const OnTheWayOrderScreen(),
              ),
              Visibility(
                visible: tabIndex == 3,
                child: const DeliveredOrderScreen(),
              ),
              Visibility(
                visible: tabIndex == 4,
                child: const CancelOrderScreen(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
