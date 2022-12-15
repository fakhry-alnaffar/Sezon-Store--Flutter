import 'package:camel_express_user/order/domain/usecase/address/address_books_usecase.dart';
import 'package:camel_express_user/order/domain/usecase/address/remove_address_book_usecase.dart';
import 'package:camel_express_user/order/domain/usecase/order/make_order_usecase.dart';
import 'package:camel_express_user/order/presintation/getx/controller/address/address_getx_controller.dart';
import 'package:get/get.dart';

class AddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AddressGetXController>(
      AddressGetXController(
        Get.find<AddressBooksUseCase>(),
        Get.find<RemoveAddressBookUseCase>(),
        Get.find<MakeOrderUseCase>(),
      ),
    );
  }
}
