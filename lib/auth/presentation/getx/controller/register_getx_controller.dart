import 'package:camel_express_user/auth/data/entity/city.dart';
import 'package:camel_express_user/auth/data/entity/country.dart';
import 'package:camel_express_user/auth/domain/model/city_model.dart';
import 'package:camel_express_user/auth/domain/model/country_model.dart';
import 'package:camel_express_user/auth/domain/usecase/register_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/prefs/shared_pref_controller.dart';
import '../../../../core/service/vendor_service_locator.dart';

class RegisterGetXController extends GetxController {
  final RxList<City> cities = <City>[].obs;
  final RxList<Country> countries = <Country>[].obs;
  late TextEditingController nameTextController;
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;
  late TextEditingController confirmPasswordTextController;
  late TextEditingController phoneTextController;
  late TextEditingController storeTextController;
  late TextEditingController locationTextController;
  late TextEditingController descriptionTextController;
  RxBool passwordObscure = true.obs;
  RxBool passwordConfirmObscure = true.obs;
  RxInt selectedCountryId = 0.obs;
  RxInt selectedCityId = 0.obs;

  final RegisterUseCase _registerUseCase;

  RxBool loading = true.obs;

  RxString errorMessage = "".obs;

  RegisterGetXController(this._registerUseCase);

  @override
  void onInit() {
    _getCountriesAndCities();
    nameTextController = TextEditingController();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    confirmPasswordTextController = TextEditingController();
    phoneTextController = TextEditingController();
    storeTextController = TextEditingController();
    locationTextController = TextEditingController();
    descriptionTextController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
    phoneTextController.dispose();
    storeTextController.dispose();
    locationTextController.dispose();
    descriptionTextController.dispose();
    super.onClose();
  }

  void _register({
    required Map<String, dynamic> data,
  }) async {
    var res = await _registerUseCase.execute(data: data);
    res.fold(
      (error) => _onError(error.message),
      (user) async {
        Get.back();
      },
    );
  }

  void _getCountriesAndCities() async {
    var data = await _registerUseCase.getCitiesAndCountries();
    data.fold((error){
      loading.value = false;
      errorMessage.value = error.message;
    }, (success) => _setListsValues(success));
  }

  void _setListsValues(Map<String,dynamic> data){
    countries.value = (data["countries"] as List).map((e) => CountryModel.fromJson(e)).toList();
    cities.value = (data["cites"] as List).map((e) => CityModel.fromJson(e)).toList();
    selectedCityId.value = cities[0].id;
    selectedCountryId.value = countries[0].id;
    loading.value = false;
  }

  void execute(){
    if(_checkData()){
      _register(data: data);
    }
  }

  Map<String,String> get data => {
    "username" : nameTextController.text,
    "email": emailTextController.text,
    "password": passwordTextController.text,
    "confirm_password": confirmPasswordTextController.text,
    "mobile_no": phoneTextController.text,
    "country_id": selectedCountryId.value.toString(),
    "city_id": selectedCityId.value.toString(),
  };

  bool _checkData(){
    if(nameTextController.text.isNotEmpty &&
        emailTextController.text.isNotEmpty &&
        passwordTextController.text.isNotEmpty &&
        confirmPasswordTextController.text.isNotEmpty &&
        phoneTextController.text.isNotEmpty
    ){
      return true;
    }
    Get.snackbar("Empty Fields", "pleas enter the required data",colorText: Colors.white,backgroundColor: Colors.red);
    return false;
  }

  void _onError(String message) => Get.snackbar(
        "Error",
        message,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
}
