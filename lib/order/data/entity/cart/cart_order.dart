import 'package:equatable/equatable.dart';

class CartOrder extends Equatable {
  final int id;
  final String name;
  late int total;
  final int orderId;
  final int variationId;
  late int quantity;
  final String imageUrl;
  final String province;
  final String country;
  final double distance;

  CartOrder({
    required this.id,
    required this.name,
    required this.variationId,
    required this.total,
    required this.orderId,
    required this.quantity,
    required this.imageUrl,
    required this.province,
    required this.country,
    required this.distance,
  });

  @override
  List<Object> get props =>
      [
        id,
        name,
        variationId,
        total,
        orderId,
        quantity,
        imageUrl,
        province,
        country,
        distance,
      ];
}
