import 'package:camel_express_user/order/data/entity/address/location.dart';
import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final int id;
  final Location location;
  final String locationFormat;
  final String details;
  final String createdAt;
  final String name;

  const Address({
    required this.id,
    required this.name,
    required this.details,
    required this.location,
    required this.locationFormat,
    required this.createdAt,
  });

  @override
  List<Object> get props => [id, location, locationFormat, createdAt,name,details];
}
