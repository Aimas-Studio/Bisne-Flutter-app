import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/user.dart';

class EditUserController extends GetxController {
  final User user;
  late TextEditingController nameController;
  bool editPhoto = false;
  bool editName = false;
  bool loading = false;
  EditUserController({required this.user}) {
    nameController = TextEditingController(text: user.username);
  }
}
