import 'dart:io';

import 'package:bisne/src/core/infrastructure/cloudinary/upload_image.dart';
import 'package:bisne/src/core/presentation/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../user/export.dart';
import '../../domain/dtos/create_shop_dto.dart';
import '../../domain/dtos/edit_shop_dto.dart';
import '../../domain/entities/shop_entity.dart';
import '../../infrastructure/services/create_shop.dart';
import '../../infrastructure/services/edit_shop.dart';

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
    form.unfocus();
    Get.back();
  }

  void createShopSubmit() async {
    form.unfocus();
    final urlImage = await uploadImage(image!);

    final CreateShopDto shopDto = CreateShopDto(
      adminId: getUserInfo().id,
      region: 'La Habana',
      municipality: 'Boyeros',
      name: form.control('shopName').value,
      urlImage: urlImage,
      description: form.control('description').value,
      facebook: form.control('facebook').value,
      instagram: form.control('instagram').value,
      link: form.control('link').value,
      phoneNumber: form.control('phoneNumber').value,
      schedule: form.control('schedule').value,
      whatsAppNumber: form.control('whatsAppNumber').value,
      location: form.control('location').value,
    );
    if (await createShop(shopDto: shopDto)) {
      Get.showSnackbar(const GetSnackBar(
        title: 'Se ha creado satisfactoriamente la tienda',
        backgroundColor: bisneColorPrimary,
      ));
      await Future.delayed(const Duration(seconds: 1));
      Get.back();
    } else {}
  }

  void editShopSubmit() async {
    final String? urlImage = hasImageChange ? await uploadImage(image!) : null;

    final EditShopDto shop = EditShopDto(
      urlImage: urlImage,
      region: 'La Habana',
      municipality: 'Boyeros',
      description: form.control('description').value,
      facebook: form.control('facebook').value,
      instagram: form.control('instagram').value,
      link: form.control('link').value,
      phoneNumber: form.control('phoneNumber').value,
      schedule: form.control('schedule').value,
      whatsAppNumber: form.control('whatsAppNumber').value,
    );

    if (await editShop(shop)) {
      Get.showSnackbar(const GetSnackBar(
        backgroundColor: bisneColorPrimary,
        title: 'Se ha editado satisfactoriamente la wifi',
      ));
      await Future.delayed(const Duration(seconds: 2));
      Get.back();
    }
  }
}