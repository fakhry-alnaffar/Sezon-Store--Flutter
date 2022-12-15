import 'package:equatable/equatable.dart';

class NearVendor extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final double distance;
  final String time;

  const NearVendor({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.distance,
    required this.time,
  });

  @override
  List<Object> get props => [id, name, imageUrl, distance, time];
}
