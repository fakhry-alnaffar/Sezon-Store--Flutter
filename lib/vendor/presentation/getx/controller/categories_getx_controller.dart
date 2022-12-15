import 'package:camel_express_user/vendor/data/entity/home/home_item.dart';
import 'package:camel_express_user/vendor/domain/usecase/categories_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';


class CategoriesGetXController extends GetxController with StateMixin<List<HomeItem>> {

  // late TextEditingController searchController;

  final CategoriesUseCase _useCase;

  CategoriesGetXController(this._useCase);

  @override
  void onInit() {
    getCategories();
    // searchController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // searchController.dispose();
    super.onClose();
  }

  void getCategories() async {
    change([], status: RxStatus.loading());
    var result = await _useCase.execute();
    result.fold(
      (error) => change(
        [],
        status: RxStatus.error(error.message),
      ),
      (data) => change(
        data,
        status: RxStatus.success(),
      ),
    );
  }
}
