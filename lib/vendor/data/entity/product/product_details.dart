import 'package:camel_express_user/vendor/data/entity/product/attribute.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String description;
  late int variationId;
  late int price;
  final String id;
  late int quantity;
  final int percentageOfRating;
  final List<String> images;
  final double distance;
  final bool isFavorite;
  final List<Attribute> attributesList;


   Product({
    required this.name,
    required this.description,
    required this.variationId,
    required this.price,
    required this.percentageOfRating,
    required this.images,
    required this.id,
    required this.distance,
    required this.isFavorite,
    required this.attributesList,
    this.quantity = 1,
  });
  
  @override
  List<Object> get props =>
      [name,id,description, price, percentageOfRating, images, distance,variationId];
}
