import 'package:equatable/equatable.dart';

class OrderStatus extends Equatable {
  final int orderId;
  final int statusId;
  final String statusName;
  final String createdAt;

  const OrderStatus({
    required this.orderId,
    required this.statusId,
    required this.statusName,
    required this.createdAt,
  });

  @override
  List<Object> get props => [orderId, statusId, statusName, createdAt];
}
