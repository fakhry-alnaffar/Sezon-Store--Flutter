import 'package:camel_express_user/core/error/faliure.dart';
import 'package:dartz/dartz.dart';

import '../../data/entity/address/address.dart';

abstract class AddressRepository {
  Future<Either<Failure, List<Address>>> getAddressBooks();

  Future<Either<Failure, Address>> addAddressBook({
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, String>> removeAddressBook({
    required String id,
  });

  Future<Either<Failure, Address>> editAddressBook({
    required Map<String, dynamic> data,
    required String id,
  });
}
