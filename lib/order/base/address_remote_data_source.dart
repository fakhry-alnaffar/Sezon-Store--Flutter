import 'package:camel_express_user/order/data/entity/address/address.dart';

abstract class AddressRemoteDataSource {
  Future<List<Address>> getAddressBooks();

  Future<Address> addAddressBook({
    required Map<String, dynamic> data,
  });

  Future<String> removeAddressBook({
    required String id,
  });

  Future<Address> editAddressBook({
    required Map<String, dynamic> data,
    required String id,
  });
}
