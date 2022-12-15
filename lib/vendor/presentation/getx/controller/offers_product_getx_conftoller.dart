import 'package:get/get.dart';

import '../../../data/entity/product/vendor_product.dart';
import '../../../domain/usecase/get_offers_usecase.dart';

class OffersProductGetXController extends GetxController
    with StateMixin<List<VendorProduct>> {
  final String offerId;

  final GetOffersUseCase _useCase;

  int tabIndex;

  OffersProductGetXController(
    this._useCase, {
    required this.offerId,
    required this.tabIndex,
  });

  @override
  void onInit() {
    execute(offerId: offerId);
    super.onInit();
  }

  void changeIndex(int index,String offerId) {
    tabIndex = index;
    update();
    execute(offerId: offerId);
  }

  void execute({required String offerId}) async {
    change([], status: RxStatus.loading());
    var res = await _useCase.execute(offerId: offerId);
    res.fold(
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
