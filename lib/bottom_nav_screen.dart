import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:camel_express_user/user/presentation/screen/profile_screen.dart';
import 'package:camel_express_user/vendor/presentation/screen/categories_screen.dart';
import 'package:camel_express_user/vendor/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'core/helpers/app_colors.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: ClipRect(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          body: pages[_bottomNavIndex],
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              Get.toNamed("/address_screen");
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.location_on, color: Colors.white)),
              ],
            ),
          ),
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            activeIndex: _bottomNavIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.smoothEdge,
            splashColor: Colors.black,
            onTap: (index) => setState(() => _bottomNavIndex = index),
            tabBuilder: (int index, bool isActive) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    iconList[index],
                    color:
                    isActive ? AppColors.primary : const Color(0xFF7D7D85),
                    height: 27.h,
                  )
                ],
              );
            },
            itemCount: iconList.length,
          ),
        ),
      ),
    );
  }

  var _bottomNavIndex = 0;
  late Animation<double> animation;
  late CurvedAnimation curve;

  final iconList = [
    'assets/svg_images/home.svg',
    'assets/svg_images/category_icon.svg',
    'assets/svg_images/shgardi_icon.svg',
    'assets/svg_images/profile.svg',
  ];

  List<Widget> pages = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CategoriesScreen(),
    const ProfileScreen(),
  ];
}