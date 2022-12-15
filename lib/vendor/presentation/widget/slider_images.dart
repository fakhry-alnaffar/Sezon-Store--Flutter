import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/app_colors.dart';

class SliderImages extends StatefulWidget {
   SliderImages({
    Key? key,
    required this.imgList,
  }) : super(key: key);
  final List<String> imgList;


  @override
  State<SliderImages> createState() => _SliderImagesState();
}

class _SliderImagesState extends State<SliderImages> {
  int count = 0;
  final CarouselController _carouselController = CarouselController();


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                count = index;
              });
            },
            aspectRatio: 2,
            viewportFraction: 1,
            height: double.infinity,
            pageSnapping: true,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.decelerate,
            enlargeCenterPage: true,
          ),
          items: widget.imgList
              .map(
                (item) => Container(
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(item),
                  )),
            ),
          )
              .toList(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _carouselController.animateToPage(entry.key),
                child: Container(
                  width: count != entry.key ? 8.0 : 12,
                  height: count != entry.key ? 8.0 : 12,
                  margin: EdgeInsets.symmetric(
                      vertical: 22.h, horizontal: 4.w),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.blueGrey.shade50
                          : AppColors.primary)
                          .withOpacity(count == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
