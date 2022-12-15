import 'package:shared_preferences/shared_preferences.dart';

import '../../user/data/entity/user.dart';

enum PrefKeys {
  id,
  nationalId,
  firstName,
  lastName,
  fullName,
  provinceId,
  address,
  mobileNo,
  email,
  statusId,
  percentageOfRating,
  imageUrl,
  numberOfRaters,
  emailVerifiedAt,
  createdBy,
  createdAt,
  updatedAt,
  deletedAt,
  token,
  orderId,
}

class SharedPrefController {
  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  static SharedPrefController? _instance;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<SharedPrefController> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  SharedPreferences get instance => _sharedPreferences;

  void save({required User user}) {
    if (user.token.isNotEmpty) {
      _sharedPreferences.setString(PrefKeys.token.name, "bearer ${user.token}");
    }
    _sharedPreferences.setInt(PrefKeys.id.name, user.id);
    _sharedPreferences.setString(PrefKeys.nationalId.name, user.nationalId);
    _sharedPreferences.setString(PrefKeys.firstName.name, user.firstName);
    _sharedPreferences.setString(PrefKeys.lastName.name, user.lastName);
    _sharedPreferences.setString(PrefKeys.fullName.name, user.fullName);
    _sharedPreferences.setInt(PrefKeys.provinceId.name, user.provinceId);
    _sharedPreferences.setString(PrefKeys.address.name, user.address);
    _sharedPreferences.setString(PrefKeys.mobileNo.name, user.mobileNo);
    _sharedPreferences.setString(PrefKeys.email.name, user.email);
    _sharedPreferences.setString(PrefKeys.imageUrl.name, user.imageUrl);
    _sharedPreferences.setInt(PrefKeys.statusId.name, user.statusId);
    _sharedPreferences.setInt(
        PrefKeys.percentageOfRating.name, user.percentageOfRating);
    _sharedPreferences.setInt(
        PrefKeys.numberOfRaters.name, user.numberOfRaters);
    _sharedPreferences.setString(
        PrefKeys.emailVerifiedAt.name, user.emailVerifiedAt);
    _sharedPreferences.setString(PrefKeys.createdAt.name, user.createdAt);
    _sharedPreferences.setInt(PrefKeys.createdBy.name, user.createdBy);
    _sharedPreferences.setString(PrefKeys.updatedAt.name, user.updatedAt);
    _sharedPreferences.setString(PrefKeys.deletedAt.name, user.deletedAt);
    print("saved token ${_sharedPreferences.getString(PrefKeys.token.name)} ");
  }

  T? getValueFor<T>(String key) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  User getCurrentUser() {
    return User(
      id: _sharedPreferences.getInt(PrefKeys.id.name)!,
      nationalId: _sharedPreferences.getString(PrefKeys.nationalId.name)!,
      firstName: _sharedPreferences.getString(PrefKeys.firstName.name)!,
      lastName: _sharedPreferences.getString(PrefKeys.lastName.name)!,
      fullName: _sharedPreferences.getString(PrefKeys.fullName.name)!,
      token: _sharedPreferences.getString(PrefKeys.token.name)!,
      provinceId: _sharedPreferences.getInt(PrefKeys.provinceId.name)!,
      address: _sharedPreferences.getString(PrefKeys.address.name)!,
      mobileNo: _sharedPreferences.getString(PrefKeys.mobileNo.name)!,
      email: _sharedPreferences.getString(PrefKeys.email.name)!,
      statusId: _sharedPreferences.getInt(PrefKeys.statusId.name)!,
      percentageOfRating: _sharedPreferences.getInt(PrefKeys.percentageOfRating.name)!,
      numberOfRaters: _sharedPreferences.getInt(PrefKeys.numberOfRaters.name)!,
      emailVerifiedAt: _sharedPreferences.getString(PrefKeys.emailVerifiedAt.name)!,
      createdBy: _sharedPreferences.getInt(PrefKeys.createdBy.name)!,
      createdAt: _sharedPreferences.getString(PrefKeys.createdAt.name)!,
      updatedAt: _sharedPreferences.getString(PrefKeys.updatedAt.name)!,
      deletedAt: _sharedPreferences.getString(PrefKeys.deletedAt.name)!,
      imageUrl: _sharedPreferences.getString(PrefKeys.imageUrl.name)!,
    );
  }

  Future<void> saveOrderId({required String orderId}) async =>
      _sharedPreferences.setString(PrefKeys.orderId.name, orderId);

  Future<bool> removeValueFor(String key) async {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.remove(key);
    }
    return false;
  }

  Future<bool> clear() {
    return _sharedPreferences.clear();
  }
}
