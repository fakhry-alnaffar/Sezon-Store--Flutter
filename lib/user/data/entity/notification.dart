import 'package:equatable/equatable.dart';

class Notification extends Equatable {
  final String title;
  final String body;
  final String createdAt;

  const Notification({
    required this.title,
    required this.body,
    required this.createdAt,
  });

  @override
  List<Object> get props => [title, body,createdAt];
}
