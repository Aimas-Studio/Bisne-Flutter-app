class CreateUserDto {
  final String email;
  final String userName;
  final String password;

  CreateUserDto({
    required this.userName,
    required this.email,
    required this.password,
  });
}
