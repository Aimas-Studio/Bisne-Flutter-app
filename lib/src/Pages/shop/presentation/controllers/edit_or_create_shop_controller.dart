import 'dart:io';

import 'package:bisne/src/Pages/Home/presentations/controllers/home_page_controller.dart';
import 'package:bisne/src/Pages/shop/domain/dtos/create_shop_dto.dart';
import 'package:bisne/src/Pages/shop/domain/dtos/edit_shop_dto.dart';
import 'package:bisne/src/Pages/shop/infrastructure/services/create_shop.dart';
import 'package:bisne/src/Pages/user/infrastructure/services/user_services.dart';
import 'package:bisne/src/core/infrastructure/cloudinary/upload_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../domain/entities/shop_entity.dart';

class EditOrCreateShopController extends GetxController {
  final Shop? shop;
  late bool hasImage;
  bool hasImageChange = false;
  ImageProvider? shopImage;
  File? image;

  static const idController = 'createOrUpdateShopController';

  final form = FormGroup({
    'description': FormControl<String>(validators: [Validators.required]),
    'schedule': FormControl<String>(),
    'location': FormControl<String>(),
    'phoneNumber': FormControl<String>(),
    'whatsAppNumber': FormControl<String>(),
    'instagram': FormControl<String>(),
    'facebook': FormControl<String>(),
    'link': FormControl<String>(),
    'password': FormControl<String>(validators: [Validators.required]),
  });

  EditOrCreateShopController(bool createShop, {this.shop}) {
    hasImage = (shop != null);
    if (createShop) {
      form.addAll({
        'shopName': FormControl<String>(validators: [Validators.required])
      });
    }
  }

  void pickImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      image = File(file.path);
      hasImage = true;
      hasImageChange = true;
      shopImage = FileImage(File(file.path));
      update([idController]);
    }
  }

  void cancelEdit() {
    Get.back();
  }

  void createShopSubmit() async {
    final urlImage = await uploadImage(image!);

    final CreateShopDto shopDto = CreateShopDto(
      adminId: getUserInfo().id,
      name: form.control('shopName').value,
      urlImage: urlImage,
      description: form.control('description').value,
      facebook: form.control('facebook').value,
      instagram: form.control('instagram').value,
      link: form.control('link').value,
      phoneNumber: form.control('phoneNumber').value,
      schedule: form.control('schedule').value,
      whatsAppNumber: form.control('whatsAppNumber').value,
    );
    await createShop(shopDto: shopDto);
    update([HomePageController.idController]);
    Get.back();
  }

  void editShopSubmit() async {
    final String? urlImage = hasImageChange ? await uploadImage(image!) : null;

    final EditShopDto shop = EditShopDto(
      urlImage: urlImage,
      description: form.control('description').value,
      facebook: form.control('facebook').value,
      instagram: form.control('instagram').value,
      link: form.control('link').value,
      phoneNumber: form.control('phoneNumber').value,
      schedule: form.control('schedule').value,
      whatsAppNumber: form.control('whatsAppNumber').value,
    );
  }
}
