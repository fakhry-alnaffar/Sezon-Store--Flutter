import 'package:camel_express_user/core/error/faliure.dart';
import 'package:camel_express_user/order/base/address_remote_data_source.dart';
import 'package:camel_express_user/order/data/entity/address/address.dart';
import 'package:camel_express_user/order/domain/repository/address_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/exceptions.dart';

class AddressRepositoryImp extends AddressRepository {
  final AddressRemoteDataSource _dataSource;

  AddressRepositoryImp(this._dataSource);

  @override
  Future<Either<Failure, Address>> addAddressBook({
    required Map<String, dynamic> data,
  }) async {
    try {
      final result = await _dataSource.addAddressBook(data: data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Address>> editAddressBook({
    required Map<String, dynamic> data,
    required String id,
  }) async {
    try {
      final result = await _dataSource.editAddressBook(id: id,data: data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> removeAddressBook({
    required String id,
  }) async {
    try {
      final result = await _dataSource.removeAddressBook(id: id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Address>>> getAddressBooks() async {
    try {
      final result = await _dataSource.getAddressBooks();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
