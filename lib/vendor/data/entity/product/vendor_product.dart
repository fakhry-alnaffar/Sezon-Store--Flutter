import 'package:equatable/equatable.dart';

class VendorProduct extends Equatable {
  final int id;
  final int variationId;
  final String name;
  final int percentageOfRating;
  final String img;
  final int numberOfRaters;
  final int price;
  final String province;
  final String country;
  final double distance;
  late bool isFavorite;

  VendorProduct({
    required this.id,
    required this.name,
    required this.variationId,
    required this.percentageOfRating,
    required this.img,
    required this.numberOfRaters,
    required this.price,
    required this.province,
    required this.country,
    required this.distance,
    required this.isFavorite,
  });

  @override
  List<Object> get props =>
      [
        id,
        name,
        percentageOfRating,
        img,
        numberOfRaters,
        variationId,
        price,
        province,
        country,
        distance,
      ];
}
