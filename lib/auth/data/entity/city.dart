import 'package:equatable/equatable.dart';

class City extends Equatable{
  final int id;
  final int countryId;
  final String name;

  const City({
    required this.id,
    required this.countryId,
    required this.name,
  });

  @override
  List<Object> get props => [id, countryId, name];
}
