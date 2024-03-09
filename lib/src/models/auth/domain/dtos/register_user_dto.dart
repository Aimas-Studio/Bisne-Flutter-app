class RegisterUserDto {
  final String email;
  final String userName;
  final String password;

  RegisterUserDto({
    required this.userName,
    required this.email,
    required this.password,
  });
}
