import 'package:camel_express_user/order/domain/model/location_model.dart';
import 'package:camel_express_user/order/domain/usecase/address/add_address_book_uscase.dart';
import 'package:camel_express_user/order/domain/usecase/address/edit_address_book_usecase.dart';
import 'package:camel_express_user/order/presintation/getx/controller/address/address_getx_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/entity/address/address.dart';

class NewAddressGetXController extends GetxController {
  late TextEditingController addressTextController;
  late TextEditingController detailTextController;

  LocationModel? locationModel;

  Address? address;

  final AddAddressBookUseCase _addUseCase;
  final EditAddressBookUseCase _editUseCase;

  NewAddressGetXController(this._addUseCase, this._editUseCase,{this.address});

  @override
  void onInit() {
    addressTextController = TextEditingController()..text = address != null ? address!.name : "";
    detailTextController = TextEditingController()..text = address != null ? address!.details : "";
    super.onInit();
  }

  @override
  void onClose() {
    addressTextController.dispose();
    detailTextController.dispose();
    super.onClose();
  }

  void execute() async {
    var res = await _addUseCase.execute(data: _data);
    res.fold(
      (error) => Get.snackbar("error", "something wrong"),
      (data) {
        AddressGetXController.to.addAddress(data);
        Get.back();
      },
    );
  }

  void editAddress() async {
    var res = await _editUseCase.execute(data: _data, id: address!.id.toString());
    res.fold(
      (error) => Get.snackbar("error", "something wrong"),
      (data) {
        AddressGetXController.to.editAddress(data);
        Get.back();
      },
    );
  }

  Map<String, dynamic> get _data => {
        "name": addressTextController.text,
        "location": locationModel?.toJson().toString(),
        "details": detailTextController.text
      };
}
