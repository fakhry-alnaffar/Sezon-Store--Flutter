
import '../../../data/entity/home/home_item.dart';

class HomeItemModel extends HomeItem {
  const HomeItemModel({
    required super.id,
    required super.name,
    required super.url,
  });

  factory HomeItemModel.fromOfferJson(Map<String, dynamic> json) {
    return HomeItemModel(
      id: json["offer_id"],
      name: json["name"],
      url: json["url"],
    );
  }

  factory HomeItemModel.fromCategoryJson(Map<String, dynamic> json) {
    return HomeItemModel(
      id: json["id"],
      name: json["name"],
      url: json["image"],
    );
  }

  factory HomeItemModel.fromJson(Map<String, dynamic> json) {
    return HomeItemModel(
      id: json["id"],
      name: json["name"],
      url: json["image_url"],
    );
  }
}
