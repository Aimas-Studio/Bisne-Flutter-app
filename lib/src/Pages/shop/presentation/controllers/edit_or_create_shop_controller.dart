import 'dart:io';

import 'package:bisne/src/Pages/shop/domain/dtos/create_shop_dto.dart';
import 'package:bisne/src/core/infrastructure/cloudinary/upload_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../domain/entities/shop_entity.dart';

class EditOrCreateShopController extends GetxController {
  final Shop? shop;
  late bool hasImage;
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
    print("has image $hasImage");
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
      shopImage = FileImage(File(file.path));
      Get.log("${shopImage == null}");
      update([idController]);
    }
  }

  void cancelEdit() {}

  void createShopSubmit() async {
    final urlImage = await uploadImage(image!);
    print(form.control('description').value);
    print(form.control('shopName').value);
    print(form.control('facebook').value);

    final CreateShopDto shopDto = CreateShopDto(
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

    print(shopDto);
  }

  void editShopSubmit() {}
}
