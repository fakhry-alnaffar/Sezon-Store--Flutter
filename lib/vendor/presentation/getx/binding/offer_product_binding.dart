import 'package:camel_express_user/vendor/domain/usecase/get_offers_usecase.dart';
import 'package:camel_express_user/vendor/presentation/getx/controller/offers_product_getx_conftoller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class OfferProductBinding extends Bindings {
  final String offerId;
  final int index;

  OfferProductBinding({required this.offerId, required this.index});

  @override
  void dependencies() {
    Get.put<OffersProductGetXController>(
      OffersProductGetXController(
        Get.find<GetOffersUseCase>(),
        offerId: offerId,
        tabIndex: index,
      ),
    );
  }
}
