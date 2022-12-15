import 'package:camel_express_user/core/error/faliure.dart';
import 'package:camel_express_user/order/data/entity/address/address.dart';
import 'package:camel_express_user/order/domain/repository/address_repository.dart';
import 'package:dartz/dartz.dart';

class EditAddressBookUseCase {
  final AddressRepository _repository;

  EditAddressBookUseCase(this._repository);

  Future<Either<Failure, Address>> execute({
    required Map<String, dynamic> data,
    required String id,
  }) async {
    return await _repository.editAddressBook(id: id, data: data);
  }
}
