import 'package:camel_express_user/order/domain/usecase/address/add_address_book_uscase.dart';
import 'package:camel_express_user/order/presintation/getx/controller/address/new_address_getx_controller.dart';
import 'package:get/get.dart';

import '../../../../data/entity/address/address.dart';
import '../../../../domain/usecase/address/edit_address_book_usecase.dart';

class NewAddressBinding extends Bindings {
  Address? address;

  NewAddressBinding({this.address});

  @override
  void dependencies() {
    Get.put<NewAddressGetXController>(
      NewAddressGetXController(
        Get.find<AddAddressBookUseCase>(),
        Get.find<EditAddressBookUseCase>(),
        address: address
      ),
    );
  }
}
