import 'package:camel_express_user/core/prefs/shared_pref_controller.dart';
import 'package:camel_express_user/order/data/entity/address/address.dart';
import 'package:camel_express_user/order/domain/model/location_model.dart';
import 'package:camel_express_user/order/domain/usecase/address/address_books_usecase.dart';
import 'package:camel_express_user/vendor/presentation/getx/controller/home_getx_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../domain/usecase/address/remove_address_book_usecase.dart';
import '../../../../domain/usecase/order/make_order_usecase.dart';

class AddressGetXController extends GetxController
    with StateMixin<List<Address>> {
  final TextEditingController searchController = TextEditingController();
  final AddressBooksUseCase _useCase;
  final RemoveAddressBookUseCase _removeAddressBookUseCase;
  final MakeOrderUseCase _makeOrderUseCase;

  static AddressGetXController to = Get.find<AddressGetXController>();

  List<Address> list = [];

  RxInt tapIndex = 0.obs;

  AddressGetXController(
      this._useCase, this._removeAddressBookUseCase, this._makeOrderUseCase);

  @override
  void onInit() {
    _getAddressBooks();
    super.onInit();
  }

  void changeIndex(int index) {
    tapIndex.value = index;
    change(
      list,
      status: RxStatus.success(),
    );
    if (!Get.isRegistered<HomeGetXController>()) {
      makeOrder(location: list[index].location as LocationModel);
    }
  }

  Future<void> makeOrder({
    required LocationModel location,
  }) async {
    var res = await _makeOrderUseCase.execute(location: location);
    res.fold(
      (error) => Get.snackbar("Error", error.message),
      (id) async {
        await SharedPrefController().saveOrderId(orderId: id.toString());
        Get.offNamed("/bottom_nav_screen");
      },
    );
  }

  void addAddress(Address address) {
    list.add(address);
    change(list, status: RxStatus.success());
  }

  void editAddress(Address address) {
    var index = list.indexWhere((element) => element.id == address.id);
    list[index] = address;
    change(list, status: RxStatus.success());
  }

  void removeAddress({required String id}) async {
    var res = await _removeAddressBookUseCase.execute(id: id);
    res.fold(
      (error) => Get.snackbar("error", error.message),
      (success) {
        list.removeWhere((element) => element.id.toString() == id);
        change(list, status: RxStatus.success());
      },
    );
  }

  Set<Marker> getMarkers() {
    Set<Marker> markers = {};
    for (int i = 0; i < list.length; i++) {
      var item = list[i].location;
      markers.add(
        Marker(
          markerId: MarkerId(i.toString()),
          position: LatLng(
            double.parse(item.lat),
            double.parse(item.long),
          ),
        ),
      );
    }
    return markers;
  }

  void _getAddressBooks() async {
    change(null, status: RxStatus.loading());
    var res = await _useCase.execute();
    res.fold(
      (error) => change(
        [],
        status: RxStatus.error(error.message),
      ),
      (data) {
        list = data;
        change(
          list,
          status: RxStatus.success(),
        );
      },
    );
  }
}
