import 'package:camel_express_user/auth/data/data_source/remote_data_source.dart';
import 'package:camel_express_user/auth/data/repository/auth_repository.dart';
import 'package:camel_express_user/auth/domain/usecase/login_usecase.dart';
import 'package:camel_express_user/auth/domain/usecase/register_usecase.dart';
import 'package:get/get.dart';

import '../../auth/domain/usecase/check_order_usecase.dart';

class AuthServiceLocator extends GetxService{
  @override
  void onInit() {
    // first we need instance from the data source
    Get.lazyPut<AuthRemoteDataSourceImp>(() => AuthRemoteDataSourceImp(),fenix: true);
    // second instance from the repo
    Get.lazyPut<AuthRepositoryImp>(() => AuthRepositoryImp(Get.find<AuthRemoteDataSourceImp>()),fenix: true);
    // third instance from useCases
    // 1- login useCase
    Get.lazyPut<LoginUseCase>(() => LoginUseCase(Get.find<AuthRepositoryImp>()),fenix: true);
    // 2- register useCase
    Get.lazyPut<RegisterUseCase>(() => RegisterUseCase(Get.find<AuthRepositoryImp>()),fenix: true);
    // 3- check order useCase
    Get.lazyPut<CheckOrderUseCase>(() => CheckOrderUseCase(Get.find<AuthRepositoryImp>()),fenix: true);
    super.onInit();
  }

}