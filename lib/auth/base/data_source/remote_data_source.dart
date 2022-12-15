import 'package:camel_express_user/auth/data/entity/city.dart';
import 'package:camel_express_user/user/data/entity/user.dart';
import '../../data/entity/country.dart';

abstract class AuthRemoteDataSource {
  Future<User> login({
    required Map<String,dynamic> data
  });

  Future<User> register({
    required Map<String, dynamic> data,
  });

  Future<Map<String, dynamic>> getCountriesAndCities();

  Future<int> checkOrder();
}
