import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String lat;
  final String long;

  const Location({
    required this.lat,
    required this.long,
  });

  @override
  List<Object> get props => [lat, long];
}
