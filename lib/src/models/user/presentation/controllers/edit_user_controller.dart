import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/infrastructure/cloudinary/upload_image.dart';
import '../../../../core/presentation/widgets/snack_bars/get_snack_bar.dart';
import '../../domain/dtos/edit_user_dto.dart';
import '../../domain/entities/user.dart';
import '../../infrastructure/services/edit_user.dart';

class EditUserController extends GetxController {
  static const idController = 'editUserController';
  final User user;
  late TextEditingController nameController;
  bool hasImage = false;
  bool hasImageChange = false;
  File? imageFile;
  ImageProvider? image;

  EditUserController({required this.user}) {
    nameController = TextEditingController(text: user.username);
    hasImage = user.imageUrl.isNotEmpty;
  }

  pickImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      imageFile = File(file.path);
      hasImage = true;
      hasImageChange = true;
      image = FileImage(File(file.path));
      update([idController]);
    }
  }

  editUserSubmit() async {
    final EditUserDto editUserDto = EditUserDto(
      userName: nameController.text,
      urlImage: hasImageChange ? await uploadImage(imageFile!) : null,
    );

    if (await editUser(editUserDto)) {
      Get.showSnackbar(snackAppBar(
          message: 'Usuario editado correctamente', color: Colors.green));
      await Future.delayed(const Duration(seconds: 2));
      Get.back();
    } else {}
  }
}
