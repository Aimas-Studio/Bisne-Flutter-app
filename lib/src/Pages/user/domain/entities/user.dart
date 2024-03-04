class User {
  int id;
  String username;
  String email;
  String imageUrl;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.imageUrl,
  });
}

class UserDump {
  String userName;
  String imageUrl;

  UserDump(this.userName, this.imageUrl);
}
