import 'dart:io';

import 'package:bisne/src/models/home/presentations/controllers/home_page_controller.dart';
import 'package:bisne/src/models/user/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/infrastructure/cloudinary/upload_image.dart';
import '../../../../core/presentation/widgets/snack_bars/get_snack_bar.dart';
import '../../domain/dtos/edit_user_dto.dart';
import '../../domain/entities/user.dart';
import '../../infrastructure/services/edit_user.dart';
import 'user_info_controller.dart';

class EditUserController extends GetxController {
  static const idController = 'editUserController';
  late TextEditingController nameController;
  bool hasImage = false;
  bool hasImageChange = false;
  File? imageFile;
  ImageProvider? image;

  EditUserController() {
    nameController = TextEditingController(text: PerData.userName);
    hasImage = PerData.userImageUrl.isNotEmpty;
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
      urlImage:
          hasImageChange ? await uploadImage(imageFile!) : PerData.userImageUrl,
      userId: PerData.idUser,
    );
    if (await editUser(editUserDto)) {
      update();
      Get.find<UserInfoController>().update([UserInfoController.id]);
      Get.find<HomePageController>().update([HomePageController.idController]);
      Get.back();
    } else {}
  }
}
