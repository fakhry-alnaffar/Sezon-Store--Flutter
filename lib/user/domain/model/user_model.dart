import 'package:camel_express_user/user/data/entity/user.dart';

class UserModel extends User {

  const UserModel({
    required super.id,
    required super.nationalId,
    required super.firstName,
    required super.lastName,
    required super.fullName,
    required super.provinceId,
    required super.token,
    required super.address,
    required super.mobileNo,
    required super.email,
    required super.statusId,
    required super.imageUrl,
    required super.percentageOfRating,
    required super.numberOfRaters,
    required super.emailVerifiedAt,
    required super.createdBy,
    required super.createdAt,
    required super.updatedAt,
    required super.deletedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    var json = map.containsKey("user") ? map["user"] : map;
    return UserModel(
      id: json["id"],
      imageUrl: json["person_image_url"],
      nationalId: json["national_id"] ?? "",
      firstName: json["first_name"] ?? "",
      lastName: json["last_name"] ?? "",
      fullName: json["full_name"] ?? "",
      provinceId: json["province_id"] ?? 0,
      address: json["address"] ?? "",
      mobileNo: json["mobile_no"] ?? "",
      email: json["email"] ?? "",
      statusId: json["status_id"] ?? 0,
      percentageOfRating: json["percentage_of_rating"] ?? 0,
      numberOfRaters: json["number_of_raters"] ?? 0,
      emailVerifiedAt: json["email_verified_at"] ?? "",
      createdBy: json["created_by"] ?? 0,
      createdAt: json["created_at"] ?? "",
      updatedAt: json["updated_at"] ?? "",
      deletedAt: json["deleted_at"] ?? "",
      token: map.containsKey("token") ? map["token"]["original"]["access_token"] ?? "" : "",
    );
  }
}
