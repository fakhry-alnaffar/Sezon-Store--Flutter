import 'package:camel_express_user/vendor/data/entity/product/vendor_product.dart';
import 'package:camel_express_user/vendor/presentation/getx/controller/product_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/helpers/app_colors.dart';
import '../../../../core/helpers/text_style.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../../../../core/widget/custom_dropdown_menu.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../getx/controller/favorites_getx_controller.dart';
import '../../widget/slider_images.dart';

class ProductDetailsScreen extends GetView<ProductGetXController> {
  final VendorProduct product;

  ProductDetailsScreen({super.key, required this.product}) {
    controller.getProductDetails(productId: product.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: CustomAppBar(
        onFavPressed: () => FavoritesGetXController.to
            .addOrRemoveFromFavorite(product: product),
        title: SizedBox(
          width: 170.w,
          height: 70.h,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
          ),
        ),
        notification: '5',
        backgroundColor: AppColors.lightGrey,
      ),
      body: GetBuilder<ProductGetXController>(
        id: "main",
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          } else {
            if (controller.product != null) {
              return ListView(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 420.h,
                      maxWidth: double.infinity.w,
                    ),
                    child: SliderImages(
                      imgList: controller.product!.images,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: 20.w,
                      end: 40.w,
                      top: 15.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              controller.product!.name,
                              style: GoogleFonts.poppins(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ),
                            const Spacer(),
                            GetBuilder<ProductGetXController>(
                              id: "price",
                              builder: (controller) => Text(
                                'QAR ${controller.product!.price}',
                                style: GoogleFonts.poppins(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            top: 10.h,
                            bottom: 30.h,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/star.png',
                                width: 60.w,
                                height: 60.h,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                controller.product!.percentageOfRating.toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF737373),
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                'assets/images/clock.png',
                                width: 60.w,
                                height: 60.h,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                controller.product!.distance.toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF737373),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Description',
                          style: GoogleFonts.poppins(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(
                          height: 23.h,
                        ),
                        Text(
                          controller.product!.description,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.sameGrey,
                          ),
                        ),
                        // TextButton(
                        //   onPressed: () {},
                        //   style: AppTextStyle.textButtonStyle,
                        //   child: Text(
                        //     ' Read More...',
                        //     style: AppTextStyle.subTitleButton,
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            top: 26.h,
                            bottom: 50.h,
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.product!.attributesList.length,
                            itemBuilder: (context, index) {
                              var attribute = controller.product!.attributesList[index];
                              return ColumnDropdownMenu(
                                onChange: (id) => controller.getPrice(
                                  attribute: attribute,
                                  id: id,
                                  index: index,
                                ),
                                title: attribute.attribute,
                                itemsTitle: _convertToList(attribute.attributeValues),
                                valueTitle: 0,
                                height: 39,
                                backgroundColor: AppColors.white,
                                fontWeight: FontWeight.w500,
                                titleColor: AppColors.black,
                                sizedBoxHeight: 13,
                                shadowColor: const Color.fromRGBO(0, 0, 0, 0.08),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.black,
                                  size: 21,
                                ),
                              );
                            },
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 8.w,
                            ),
                            CustomElevatedButton(
                              icon: Icons.remove,
                              onPressed: () => controller.changeQuantity(flag: "-"),
                            ),
                            GetBuilder<ProductGetXController>(
                              id: "quantity",
                              builder: (controller) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 17.w),
                                child: Text(
                                  controller.product!.quantity.toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                            CustomElevatedButton(
                              icon: Icons.add,
                              onPressed: () => controller.changeQuantity(flag: "+"),
                            ),
                            const Spacer(),
                            AppTextButton(
                              text: 'Add to Cart',
                              onPressed: () => controller.addOrRemoveFromCart(),
                              width: 183,
                              height: 39,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text("no data"),
              );
            }
          }
        },
      ),
    );
  }
}

class DropdownMenuModel {
  String title;
  int id;

  DropdownMenuModel({required this.id, required this.title});
}

List<DropdownMenuModel> _convertToList(List<String> list) {
  List<DropdownMenuModel> data = List.filled(
      list.length, DropdownMenuModel(id: 1, title: "title"),
      growable: true);
  for (int i = 0; i < list.length; i++) {
    data[i] = DropdownMenuModel(id: i, title: list[i]);
  }
  return data;
}
