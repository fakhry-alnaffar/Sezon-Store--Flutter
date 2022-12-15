import '../../data/entity/resturant.dart';

class RestaurantModel extends Restaurant {
  const RestaurantModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.location,
    required super.open,
    required super.close,
    required super.address,
    required super.province,
    required super.country,
    required super.rating,
    required super.distance,
    required super.time,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json["id"],
      name: json['name'],
      imageUrl: json['image_url'],
      location: json['location'],
      open: json['open'],
      close: json['close'],
      address: json['address'],
      province: json['province'],
      country: json['country'],
      rating: json['rating'],
      distance: json['distance'],
      time: json['time'],
    );
  }
}
