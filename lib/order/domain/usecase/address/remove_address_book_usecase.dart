import 'package:camel_express_user/core/error/faliure.dart';
import 'package:camel_express_user/order/data/entity/address/address.dart';
import 'package:camel_express_user/order/domain/repository/address_repository.dart';
import 'package:dartz/dartz.dart';

class RemoveAddressBookUseCase{

  final AddressRepository _repository;

  RemoveAddressBookUseCase(this._repository);

  Future<Either<Failure,String>> execute({required String id}) async {
    print("object");
    return await _repository.removeAddressBook(id: id);
  }
}