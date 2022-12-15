import 'package:camel_express_user/user/data/data_source/remote_data_source.dart';
import 'package:camel_express_user/user/data/repository/user_repository.dart';
import 'package:camel_express_user/user/domain/usecase/change_password_usecase.dart';
import 'package:camel_express_user/user/domain/usecase/edit_profile_usecase.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class UserServiceLocator extends GetxService{
  @override
  void onInit() {
    // first we need instance from the data source
    Get.lazyPut<UserRemoteDataSourceImp>(() => UserRemoteDataSourceImp(),fenix: true);
    // second instance from the repo
    Get.lazyPut<UserRepositoryImp>(() => UserRepositoryImp(Get.find<UserRemoteDataSourceImp>()),fenix: true);
    // third instance from useCases
    // 1- change password useCase
    Get.lazyPut<ChangePasswordUseCase>(() => ChangePasswordUseCase(Get.find<UserRepositoryImp>()),fenix: true);
    // 2- edit profile useCase
    Get.lazyPut<EditProfileUseCase>(() => EditProfileUseCase(Get.find<UserRepositoryImp>()),fenix: true);
    super.onInit();
  }
}