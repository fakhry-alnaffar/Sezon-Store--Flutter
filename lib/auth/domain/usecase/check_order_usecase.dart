import 'package:camel_express_user/auth/data/repository/auth_repository.dart';
import 'package:camel_express_user/auth/domain/usecase/login_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/faliure.dart';

class CheckOrderUseCase extends UnParamUseCase{

  final AuthRepositoryImp _repository;

  CheckOrderUseCase(this._repository);

  @override
  Future<Either<Failure, dynamic>> execute() async {
    return await _repository.checkOrder();
  }

}