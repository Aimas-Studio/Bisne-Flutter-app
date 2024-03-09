import '../../models/user/export.dart';

class AppComment {
  final User user;
  final String date;
  final String body;

  AppComment({required this.user, required this.date, required this.body});
}
