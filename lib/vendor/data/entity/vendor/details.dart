import 'package:camel_express_user/order/data/entity/address/location.dart';
import 'package:equatable/equatable.dart';

class VendorDetails extends Equatable {
  late String companyName;
  late Location location;
  late String imageUrl;
  late int percentageOfRating;
  late int numberOfRaters;
  late String mobileNo;
  late String province;
  late String country;
  late String address, open, close, time,email;
  late int id;
  late double distance;

  VendorDetails({
    required this.companyName,
    required this.location,
    required this.imageUrl,
    required this.percentageOfRating,
    required this.numberOfRaters,
    required this.mobileNo,
    required this.province,
    required this.country,
    required this.email,
    required this.address,
    required this.open,
    required this.close,
    required this.time,
    required this.id,
    required this.distance,
  });

  VendorDetails.empty(){
    companyName = "";
    location = const Location(lat: "lat", long: "long");
    imageUrl = "";
    percentageOfRating = 0;
    numberOfRaters = 0;
    mobileNo = "";
    province = "";
    country = "";
    address = "";
    email = "";
    open = "";
    close = "";
    time = "";
    id = 0;
    distance = 0.0;
  }

  @override
  List<Object> get props =>
      [
        companyName,
        location,
        imageUrl,
        percentageOfRating,
        numberOfRaters,
        mobileNo,
        province,
        country,
        address,
        id,
        distance,
      ];
}
