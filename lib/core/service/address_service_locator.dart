import 'package:camel_express_user/order/data/data_source/address_remote_data_source.dart';
import 'package:camel_express_user/order/data/repository/address_repository.dart';
import 'package:camel_express_user/order/domain/usecase/address/add_address_book_uscase.dart';
import 'package:camel_express_user/order/domain/usecase/address/address_books_usecase.dart';
import 'package:camel_express_user/order/domain/usecase/address/edit_address_book_usecase.dart';
import 'package:camel_express_user/order/domain/usecase/address/remove_address_book_usecase.dart';
import 'package:get/get.dart';

class AddressServiceLocator extends GetxService{
  @override
  void onInit() {
    // first we need instance from the data source
    Get.lazyPut<AddressRemoteDataSourceImp>(() => AddressRemoteDataSourceImp(),fenix: true);
    // second instance from the repo
    Get.lazyPut<AddressRepositoryImp>(() => AddressRepositoryImp(Get.find<AddressRemoteDataSourceImp>()),fenix: true);
    // third instance from useCases
    // 1- get address book data useCase
    Get.lazyPut<AddressBooksUseCase>(() => AddressBooksUseCase(Get.find<AddressRepositoryImp>()),fenix: true);
    // 2- add new address book data useCase
    Get.lazyPut<AddAddressBookUseCase>(() => AddAddressBookUseCase(Get.find<AddressRepositoryImp>()),fenix: true);
    // 3- edit address book data useCase
    Get.lazyPut<EditAddressBookUseCase>(() => EditAddressBookUseCase(Get.find<AddressRepositoryImp>()),fenix: true);
    // 4- remove address book data useCase
    Get.lazyPut<RemoveAddressBookUseCase>(() => RemoveAddressBookUseCase(Get.find<AddressRepositoryImp>()),fenix: true);
    super.onInit();
  }
}