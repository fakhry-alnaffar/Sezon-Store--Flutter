import 'package:camel_express_user/order/domain/model/location_model.dart';

import '../../../data/entity/vendor/details.dart';

class VendorDetailsModel extends VendorDetails {
   VendorDetailsModel({
    required super.companyName,
    required super.location,
    required super.imageUrl,
    required super.email,
    required super.percentageOfRating,
    required super.numberOfRaters,
    required super.mobileNo,
    required super.province,
    required super.country,
    required super.address,
    required super.open,
    required super.close,
    required super.time,
    required super.id,
    required super.distance,
  });

  factory VendorDetailsModel.fromJson(Map<String, dynamic> json) {
    return VendorDetailsModel(
      companyName: json['company_name'] ?? "",
      location: json["location"] == null ? const LocationModel(lat: "lat", long: "long") :LocationModel.fromJson(json["location"]),
      imageUrl: json['image_url'],
      percentageOfRating: json['rating'] ?? 0,
      numberOfRaters: json["number_of_raters"] ?? 0,
      mobileNo: json["mobile_no"] ?? "",
      province: json['province'] ?? "",
      country: json['country'] ?? "",
      email: json["email"] ?? "",
      address: json['address'] ?? "",
      open: json['open'] ?? "",
      close: json['close'] ?? "",
      time: json['time'] ?? "",
      id: json['id'] ?? 0,
      distance: json['distance'] ?? 0.0,
    );
  }
}
