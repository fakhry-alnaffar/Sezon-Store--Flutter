import 'package:camel_express_user/order/domain/usecase/order/cart_usecase.dart';
import 'package:get/get.dart';

import '../../../../core/helpers/app_colors.dart';
import '../../../data/entity/product/vendor_product.dart';
import '../../../domain/usecase/favorites_usecase.dart';

class FavoritesGetXController extends GetxController
    with StateMixin<List<VendorProduct>> {
  final FavoritesUseCase _favoritesUseCase;

  static FavoritesGetXController to = Get.find<FavoritesGetXController>();

  RxList<VendorProduct> favorites = <VendorProduct>[].obs;

  FavoritesGetXController(this._favoritesUseCase);

  void getFavorites() async {
    var response = await _favoritesUseCase.execute();
    response.fold(
      (error) => change(null, status: RxStatus.error(error.message)),
      (data) {
        if (data.isNotEmpty) {
          favorites.value = data;
          change(
            favorites,
            status: RxStatus.success(),
          );
        } else {
          change([], status: RxStatus.empty());
        }
      },
    );
  }

  Future<void> addOrRemoveFromCart({required Map<String, dynamic> data}) async {
    var res = await Get.find<CartDataUseCase>().addOrRemove(data: data);
    res.fold(
      (error) => Get.snackbar(
        "Error",
        error.message,
        backgroundColor: AppColors.red,
      ),
      (success) => Get.snackbar(
        "Error",
        "success",
        backgroundColor: AppColors.primary,
      ),
    );
  }

  Future<bool> addOrRemoveFromFavorite({required VendorProduct product}) async {
    var done = false;
    var result = await _favoritesUseCase.addOrRemoveFromFavorites(
      productId: product.id.toString(),
    );
    result.fold(
      (error) => change(
        null,
        status: RxStatus.error(error.message),
      ),
      (success){
        done = true;
        _changeListValues(
          product,
          success,
        );
      },
    );
    return done;
  }

  void _changeListValues(VendorProduct product, String message) {
    var index = favorites.indexWhere((element) => element.id == product.id);
    if (index != -1) {
      favorites.removeAt(index);
    } else {
      favorites.add(product);
    }
    change(favorites, status: RxStatus.success());
  }
}
