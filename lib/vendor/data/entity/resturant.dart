import 'package:equatable/equatable.dart';

class Restaurant extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final String location;
  final String open;
  final String close;
  final String address;
  final String province;
  final String country;
  final int rating;
  final double distance;
  final String time;

  const Restaurant({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.open,
    required this.close,
    required this.address,
    required this.province,
    required this.country,
    required this.rating,
    required this.distance,
    required this.time,
  });

  @override
  List<Object> get props => [
        id,
        name,
        imageUrl,
        location,
        open,
        close,
        address,
        province,
        country,
        rating,
        distance,
        time,
      ];
}
