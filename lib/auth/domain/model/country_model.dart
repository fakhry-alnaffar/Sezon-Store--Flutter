import 'package:camel_express_user/auth/data/entity/country.dart';

class CountryModel extends Country {
  const CountryModel({
    required super.id,
    required super.name,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json["id"],
      name: json["name"],
    );
  }
}
