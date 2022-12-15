import 'package:equatable/equatable.dart';

class Attribute extends Equatable {
  final int attributeId;
  final String attribute;
  final List<String> attributeValues;

  const Attribute({
    required this.attributeId,
    required this.attribute,
    required this.attributeValues,
  });

  @override
  List<Object> get props => [attributeId, attribute, attributeValues];
}
