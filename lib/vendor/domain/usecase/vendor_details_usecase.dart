import 'package:camel_express_user/vendor/data/entity/vendor/vendor.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/faliure.dart';
import '../repository/vendor_repository.dart';

class VendorDetailsUseCase {
  final VendorRepository _repository;

  VendorDetailsUseCase(this._repository);

  Future<Either<Failure, Vendor>> execute({
    required String vendorId,
  }) async {
    return await _repository.getVendorDetails(
      vendorId: vendorId,
    );
  }
}
