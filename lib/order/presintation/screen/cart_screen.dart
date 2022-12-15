import 'package:camel_express_user/order/presintation/getx/controller/order/cart_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../../../core/helpers/app_colors.dart';
import '../../../core/widget/custom_appbar.dart';
import '../widget/cart_item.dart';
import '../widget/custom_stack_container.dart';

class CartScreen extends GetView<CartGetXController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: CustomAppBar(
        title: const Text('My Cart'),
        notification: '5',
        backgroundColor: AppColors.lightGrey,
        onFavPressed: () {},
      ),
      body: controller.obx(
        onError: (error) => Center(
          child: Text(error!),
        ),
        onLoading: const Center(
          child: CircularProgressIndicator(
            color: AppColors.primary,
          ),
        ),
        (cart) => Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              itemCount: cart!.list.length,
              padding: EdgeInsetsDirectional.only(
                start: 20.w,
                end: 20.w,
                bottom: 270.h,
              ),
              itemBuilder: (context, index) {
                var item = cart.list[index];
                return Slidable(
                  key: const ValueKey(0),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    dismissible: DismissiblePane(onDismissed: () {}),
                    children: [
                      SlidableAction(
                        onPressed: (context) => controller.deleteFromCart(
                          map: getData(
                            flag: "3",
                            productId: item.id.toString(),
                            variationId: item.variationId.toString(),
                          ),
                        ),
                        backgroundColor: const Color.fromRGBO(154, 194, 37, 0.17),
                        foregroundColor: AppColors.primary,
                        icon: Icons.delete,
                        borderRadius: BorderRadius.circular(7.r),
                        flex: 2,
                      ),
                      SlidableAction(
                        onPressed: (context) => () {},
                        backgroundColor: const Color.fromRGBO(154, 194, 37, 0.17),
                        foregroundColor: AppColors.primary,
                        // borderRadius: BorderRadius.circular(7.r),
                        flex: 4,
                        label: '',
                      ),
                    ],
                  ),
                  child: CartItem(
                    id: item.id.toString(),
                    variation: item.variationId.toString(),
                    image: item.imageUrl,
                    name: item.name,
                    star: 5,
                    rate: 5.0,
                    numberRates: '+100',
                    quantity: item.quantity,
                    deliveryFee: '5',
                    price: item.total.toDouble(),
                    controller: controller,
                  ),
                );
              },
            ),
            CustomStackContainer(
              customRow: [
                StackRowModel(titleRow: 'Shipping Cost', price: 0.00),
                StackRowModel(titleRow: 'Sub total', price: 0.00),
              ],
              titleRow: 'Shipping Cost',
              price: 30.00,
              total: cart.total,
              title: 'Checkout',
              onPressed: () => controller.navigateToCheckout(),
            ),
          ],
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
