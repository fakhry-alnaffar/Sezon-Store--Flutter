import 'package:camel_express_user/vendor/data/entity/resturant.dart';
import 'package:equatable/equatable.dart';

import 'home_item.dart';

class Home extends Equatable {
  final List<HomeItem> popularStores;
  final List<HomeItem> categories;
  final List<HomeItem> offersImages;
  final List<Restaurant> restaurantNearYou;
  final List<HomeItem> popularStars;

  const Home({
    required this.popularStores,
    required this.categories,
    required this.offersImages,
    required this.restaurantNearYou,
    required this.popularStars,
  });

  @override
  List<Object> get props =>
      [
        popularStores,
        categories,
        offersImages,
        restaurantNearYou,
        popularStars,
      ];
}
