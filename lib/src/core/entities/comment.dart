import '../../Pages/user/domain/entities/user.dart';

class AppComment {
  UserDump user;
  String body;
  String date;

  AppComment(this.user, this.body, this.date);
}
