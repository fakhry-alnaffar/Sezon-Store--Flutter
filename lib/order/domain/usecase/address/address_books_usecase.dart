import 'package:camel_express_user/core/error/faliure.dart';
import 'package:camel_express_user/order/data/entity/address/address.dart';
import 'package:camel_express_user/order/domain/repository/address_repository.dart';
import 'package:dartz/dartz.dart';

class AddressBooksUseCase{

  final AddressRepository _repository;

  AddressBooksUseCase(this._repository);

  Future<Either<Failure,List<Address>>> execute() async {
    return await _repository.getAddressBooks();
  }
}