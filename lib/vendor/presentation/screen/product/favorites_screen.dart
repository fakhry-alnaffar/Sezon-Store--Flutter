import 'package:camel_express_user/order/presintation/getx/controller/order/cart_getx_controller.dart';
import 'package:camel_express_user/vendor/presentation/getx/controller/favorites_getx_controller.dart';
import 'package:camel_express_user/vendor/presentation/getx/controller/product_getx_controller.dart';
import 'package:camel_express_user/vendor/presentation/screen/product/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/helpers/app_colors.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../../getx/binding/product_binding.dart';
import '../../widget/favorite_item.dart';

class FavoritesScreen extends GetView<FavoritesGetXController> {
  FavoritesScreen({super.key}) {
    controller.getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: CustomAppBar(
        onFavPressed: () {},
        title: Text('Favorites'),
        notification: '5',
        backgroundColor: AppColors.lightGrey,
      ),
      body: controller.obx(
        onLoading: const Center(
          child: CircularProgressIndicator(
            color: AppColors.primary,
          ),
        ),
        onError: (error) => Center(
          child: Text(error!),
        ),
        (state) => ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          itemCount: state!.length,
          itemBuilder: (context, index) {
            return FavoriteItem(
              onAddPressed: () => controller.addOrRemoveFromCart(
                data: getData(
                  flag: "1",
                  productId: state[index].id.toString(),
                  variationId: state[index].variationId.toString(),
                ),
              ),
              product: state[index],
              onFavoritePressed: () =>
                  controller.addOrRemoveFromFavorite(product: state[index]),
              onPressed: () {
                Get.to(
                  () => ProductDetailsScreen(
                    product: state[index],
                  ),
                  binding: ProductBinding(),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Map<String, dynamic> getData({
    required String flag,
    required String productId,
    required String variationId,
  }) {
    return {
      "flag": flag,
      "product_id": productId,
      "variation_id": variationId,
      "quantity": "1",
    };
  }
}
