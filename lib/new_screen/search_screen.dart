import 'package:camel_express_user/core/helpers/app_colors.dart';
import 'package:camel_express_user/core/widget/custom_appbar.dart';
import 'package:camel_express_user/widget/search_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../vendor/presentation/widget/custom_search.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: CustomAppBar(
        title: SizedBox(
          width: 170.w,
          height: 70.h,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
          ),
        ),
        notification: '5',
        backgroundColor: AppColors.lightGrey, onFavPressed: () {},
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
          horizontal: 20.w,
        ),
        children: [
          CustomSearch(
            onSubmitted: (value) {},
            hintText: 'Search',
            onMicPressed: () {},
          ),
          GridView.builder(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 135.w / 212.h,
              mainAxisExtent: 210,
            ),
            itemBuilder: (context, index) {
              return SearchItem(
                image: 'taco',
                name: 'Taco Salad',
                star: 5.0,
                rate: 5.0,
                quantity: '+100',
                location: 'Qatar _ Doha',
                onFavoritePressed: () {},
                price: 35.0,
                onAddPressed: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}
