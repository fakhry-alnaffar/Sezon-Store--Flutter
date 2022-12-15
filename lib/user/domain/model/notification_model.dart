import 'package:camel_express_user/user/data/entity/notification.dart';

class NotificationModel extends Notification {
  const NotificationModel({
    required super.title,
    required super.body,
    required super.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json["title"],
      createdAt: json["created_at"],
      body: json["body"],
    );
  }
}
