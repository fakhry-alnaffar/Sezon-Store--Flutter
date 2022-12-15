import 'package:camel_express_user/core/helpers/app_colors.dart';
import 'package:camel_express_user/vendor/data/entity/product/vendor_product.dart';
import 'package:camel_express_user/vendor/domain/usecase/vendor_details_usecase.dart';
import 'package:get/get.dart';
import '../../../data/entity/vendor/vendor.dart';
import 'favorites_getx_controller.dart';

class VendorGetXController extends GetxController with StateMixin<Vendor> {
  static VendorGetXController to = Get.find<VendorGetXController>();

  final VendorDetailsUseCase _vendorDetailsUseCase;

  int? tabIndex;

  Vendor? vendor;

  VendorGetXController(this._vendorDetailsUseCase);

  void changeIndex(int index){
    tabIndex = index;
    change(vendor,status: RxStatus.success());
  }

  void addToOrRemoveFavorite({required VendorProduct product}) async {
    var success = await FavoritesGetXController.to.addOrRemoveFromFavorite(product:product);
    var index = vendor!.favorites.indexWhere((element) => element.id == product.id);
    if(success){
      Get.snackbar("success", "Done!",backgroundColor: AppColors.primary);
    }else{
      Get.snackbar("Error", "Something Going Wrong",backgroundColor: AppColors.red);
    }
    if(index != -1){
      vendor!.favorites.removeWhere((element) => element.id == product.id);
    }else{
      vendor!.favorites.add(product);
    }
    change(vendor,status: RxStatus.success());
  }

  void getVendorDetails({
    required String vendorId,
  }) async {
    change(null, status: RxStatus.loading());
    var data = await _vendorDetailsUseCase.execute(
      vendorId: vendorId,
    );
    data.fold(
      (error) => change(null, status: RxStatus.error(error.message)),
      (data){
        vendor = data;
        change(data, status: RxStatus.success());
      },
    );
  }
}
