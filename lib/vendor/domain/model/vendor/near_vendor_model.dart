import 'package:camel_express_user/vendor/data/entity/vendor/near_vendor.dart';
import 'package:equatable/equatable.dart';

class NearVendorModel extends NearVendor {
  const NearVendorModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.distance,
    required super.time,
  });

  factory NearVendorModel.fromJson(Map<String, dynamic> json) {
    return NearVendorModel(
      id: json["id"] ?? 0,
      name: json['name'] ?? "",
      imageUrl: json['image_url'] ?? "",
      distance: json['distance'] ?? 0.0,
      time: json['time'] ?? 0,
    );
  }
}
