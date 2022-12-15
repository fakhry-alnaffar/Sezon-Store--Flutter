import 'package:camel_express_user/vendor/data/entity/vendor/vendor_under_category.dart';
import 'package:camel_express_user/vendor/domain/usecase/vendor_under_category_uscase.dart';
import 'package:get/get.dart';

class VendorUnderCategoryGetXController extends GetxController
    with StateMixin<VendorUnderCategory> {
  static VendorUnderCategoryGetXController to =
      Get.find<VendorUnderCategoryGetXController>();

  final VendorUnderCategoryUseCase _vendorUnderCategoryUseCase;

  VendorUnderCategoryGetXController(this._vendorUnderCategoryUseCase);

  void getVendorDetails({required String categoryId}) async {
    change(null, status: RxStatus.loading());
    var data = await _vendorUnderCategoryUseCase.execute(
      categoryId: categoryId,
    );
    data.fold(
      (error) => change(
        null,
        status: RxStatus.error(error.message),
      ),
      (data) {
        print("size => ${data.allVendors.length}");
        change(
          data,
          status: RxStatus.success(),
        );
      },
    );
  }
}
