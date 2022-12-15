import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String nationalId;
  final String firstName;
  final String lastName;
  final String fullName;
  final String imageUrl;
  final String token;
  final int provinceId;
  final String address;
  final String mobileNo;
  final String email;
  final dynamic statusId;
  final int percentageOfRating;
  final int numberOfRaters;
  final String emailVerifiedAt;
  final int createdBy;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;

  const User({
    required this.id,
    required this.nationalId,
    required this.imageUrl,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.token,
    required this.provinceId,
    required this.address,
    required this.mobileNo,
    required this.email,
    required this.statusId,
    required this.percentageOfRating,
    required this.numberOfRaters,
    required this.emailVerifiedAt,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  @override
  List<Object> get props => [
    id,
    nationalId,
    firstName,
    lastName,
    fullName,
    provinceId,
    address,
    mobileNo,
    email,
    statusId,
    percentageOfRating,
    token,
    numberOfRaters,
    emailVerifiedAt,
    createdBy,
    createdAt,
    updatedAt,
    deletedAt
  ];
}
