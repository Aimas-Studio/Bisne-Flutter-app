import '../domain/entities/user.dart';

User getUserInfo() {
  return User(1, "Jane Doe", "fullName", "testemail@gmail.com",
      "assets/Images/hero.png");
}

int getNotificationCount() {
  return 99;
}
