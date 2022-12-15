import '../../../data/entity/home/home.dart';
import '../resturant_model.dart';
import 'home_item_model.dart';

class HomeModel extends Home {
  const HomeModel({
    required super.popularStores,
    required super.categories,
    required super.offersImages,
    required super.restaurantNearYou,
    required super.popularStars,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      popularStores: List.from(json["papular_stores"] as List).map((e) => HomeItemModel.fromJson(e)).toList(),
      categories: List.from(json["categories"] as List).map((e) => HomeItemModel.fromJson(e)).toList(),
      offersImages: List.from(json["offers_images"]["original"] as List).map((e) => HomeItemModel.fromOfferJson(e)).toList(),
      restaurantNearYou: List.from(json["restaurant_near_you"] as List).map((e) => RestaurantModel.fromJson(e)).toList(),
      popularStars: List.from(json["papular_stars"] as List).map((e) => HomeItemModel.fromJson(e)).toList(),
    );
  }
}
