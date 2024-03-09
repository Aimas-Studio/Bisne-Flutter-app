class User {
  int id;
  String username;
  String email;
  String imageUrl;

  User({
    required this.id,
    required this.username,
    required this.email,
    this.imageUrl = '',
  });
}
