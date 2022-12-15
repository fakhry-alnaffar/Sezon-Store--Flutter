import 'package:camel_express_user/order/data/entity/address/address.dart';
import 'package:camel_express_user/order/domain/model/location_model.dart';

class AddressModel extends Address {
  const AddressModel({
    required super.id,
    required super.location,
    required super.name,
    required super.details,
    required super.locationFormat,
    required super.createdAt,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json["id"],
      details: json["details"],
      name: json["name"],
      location: LocationModel.fromJson(json["location"]),
      locationFormat: json["location_formate"],
      createdAt: json["created_at"],
    );
  }
}
