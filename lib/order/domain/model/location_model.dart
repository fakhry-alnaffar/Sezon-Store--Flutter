import 'package:camel_express_user/order/data/entity/address/location.dart';

class LocationModel extends Location {
  const LocationModel({
    required super.lat,
    required super.long,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      lat: json["lat"] ?? "",
      long: json["long"] ?? "",
    );
  }

  Map<String,dynamic> toJson() {
    return {
      "\"lat\"" : "\"$lat\"",
      "\"long\"" : "\"$long\""
    };
  }
}
