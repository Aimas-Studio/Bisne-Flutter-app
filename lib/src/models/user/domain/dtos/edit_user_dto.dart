import 'package:flutter/material.dart';

class EditUserDto {
  final String userId;
  final String userName;
  final String urlImage;

  EditUserDto(
      {required this.userName, required this.urlImage, required this.userId});
}
