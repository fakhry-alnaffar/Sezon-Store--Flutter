import 'package:camel_express_user/auth/data/entity/city.dart';

class CityModel extends City {
  const CityModel({
    required super.id,
    required super.countryId,
    required super.name,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json["id"],
      countryId: json["country_id"],
      name: json["name"],
    );
  }
}
