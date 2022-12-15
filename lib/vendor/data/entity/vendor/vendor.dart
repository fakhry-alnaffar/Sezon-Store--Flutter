import 'package:camel_express_user/vendor/data/entity/home/home_item.dart';
import 'package:equatable/equatable.dart';

import 'details.dart';
import '../product/vendor_product.dart';

class Vendor extends Equatable{
  late VendorDetails vendorDetails;
  late List<VendorProduct> menu;
  late List<VendorProduct> mostPopularProducts;
  late List<VendorProduct> favorites;
  late List<HomeItem> offers;

  Vendor({
    required this.vendorDetails,
    required this.menu,
    required this.offers,
    required this.mostPopularProducts,
    required this.favorites,
  });

  Vendor.empty(){
    menu = [];
    mostPopularProducts = [];
    favorites = [];
    vendorDetails = VendorDetails.empty();
  }

  @override
  List<Object> get props =>
      [vendorDetails, menu, mostPopularProducts, favorites,offers];
}
