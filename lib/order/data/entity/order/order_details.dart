import 'package:equatable/equatable.dart';

class OrderDetails extends Equatable {
  final int id;
  final int taxAmount;
  final int deliveryPrice;
  final int total;
  final int afterDiscount;
  final int couponDiscount;
  final int offerDiscount;

  const OrderDetails({
    required this.id,
    required this.taxAmount,
    required this.deliveryPrice,
    required this.total,
    required this.afterDiscount,
    required this.couponDiscount,
    required this.offerDiscount,
  });

  @override
  List<Object> get props =>
      [
        id,
        taxAmount,
        deliveryPrice,
        total,
        afterDiscount,
        couponDiscount,
        offerDiscount,
      ];
}
