import 'package:camel_express_user/vendor/data/entity/product/attribute.dart';

class AttributeModel extends Attribute {
  const AttributeModel({
    required super.attributeId,
    required super.attribute,
    required super.attributeValues,
  });

  factory AttributeModel.fromJson(Map<String, dynamic> json) {
    List<String> list = List.from(json['attribute_values'] as List).map((e) => e.toString()).toList();
    list.insert(0, "choose value");
    return AttributeModel(
      attributeId: json['attribute_id'],
      attribute: json['attribute'],
      attributeValues:list,
    );
  }
}
