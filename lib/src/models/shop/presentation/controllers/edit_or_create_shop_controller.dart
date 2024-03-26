import 'dart:io';

import 'package:bisne/src/core/infrastructure/cloudinary/upload_image.dart';
import 'package:bisne/src/core/infrastructure/init/init_app.dart';
import 'package:bisne/src/core/presentation/themes/colors.dart';
import 'package:bisne/src/models/home/presentations/controllers/home_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../base/presentation/controllers/base_page_controller.dart';
import '../../../user/export.dart';
import '../../domain/dtos/create_shop_dto.dart';
import '../../domain/dtos/edit_shop_dto.dart';
import '../../domain/entities/shop_entity.dart';
import '../../infrastructure/services/create_shop.dart';
import '../../infrastructure/services/edit_shop.dart';

class EditOrCreateShopController extends GetxController {
  final Shop? shop;
  late bool hasImage;
  bool get isRegionSelected {
    return form.control('region').value != null;
  }

  bool hasImageChange = false;
  ImageProvider? shopImage;
  File? fileImage;

  static const idController = 'editOrCreateShopController';

  final form = FormGroup({
    'description': FormControl<String>(validators: [Validators.required]),
    'schedule': FormControl<String>(),
    'region': FormControl<String>(validators: [Validators.required]),
    'municipality': FormControl<String>(validators: [Validators.required]),
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
        'name': FormControl<String>(validators: [Validators.required])
      });
    } else {
      form.control('description').value = shop!.description;
      form.control('schedule').value = shop!.openingHours;
      form.control('region').value = shop!.region;
      form.control('municipality').value = shop!.municipality;
      form.control('location').value = shop!.shopLocation;
      form.control('phoneNumber').value = shop!.phoneNumber;
      form.control('whatsAppNumber').value = shop!.whatsAppNumber;
      form.control('instagram').value = shop!.instagramAccount;
      form.control('facebook').value = shop!.facebookAccount;
      form.control('link').value = shop!.optionalLink;
    }
  }

  void updateController() {
    update([idController]);
  }

  void pickImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      fileImage = File(file.path);
      hasImage = true;
      hasImageChange = true;
      shopImage = FileImage(fileImage!);
      update([idController]);
    }
  }

  void cancelEdit() {
    form.unfocus();
    Get.back();
  }

  void createShopSubmit() async {
    form.unfocus();
    final urlImage = await uploadImage(fileImage!);

    final CreateShopDto shopDto = CreateShopDto(
      adminId: data.idUser,
      region: form.control('region').value,
      municipality: form.control('municipality').value,
      name: form.control('name').value,
      urlImage: urlImage,
      description: form.control('description').value,
      facebook: form.control('facebook').value,
      instagram: form.control('instagram').value,
      link: form.control('link').value,
      phoneNumber: form.control('phoneNumber').value,
      schedule: form.control('schedule').value,
      whatsAppNumber: form.control('whatsAppNumber').value,
      location: form.control('location').value,
      telegram: '@HH075',
    );
    if (await createShop(shopDto: shopDto)) {
      Get.showSnackbar(
        const GetSnackBar(
          message: 'Se ha creado satisfactoriamente la tienda',
          backgroundColor: bisneColorPrimary,
          duration: Duration(seconds: 2),
        ),
      );
      final baseController = Get.find<BasePageController>();
      final homeController = Get.find<HomePageController>();
      homeController.setLogin();
      baseController.obj = 2;
      Get.back();
    } else {}
  }

  void editShopSubmit() async {
    final String? urlImage =
        hasImageChange ? await uploadImage(fileImage!) : null;

    final EditShopDto shop = EditShopDto(
      urlImage: urlImage,
      region: form.control('region').value,
      municipality: form.control('municipality').value,
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
