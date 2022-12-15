import 'package:equatable/equatable.dart';

class OrderProductVariation extends Equatable {
  final int id;
  final int variationId;
  final int attributeId;
  final String attributeName;
  final String value;

  const OrderProductVariation({
    required this.id,
    required this.variationId,
    required this.attributeId,
    required this.attributeName,
    required this.value,
  });

  @override
  List<Object> get props => [
        id,
        variationId,
        attributeId,
        attributeName,
        value,
      ];
}
