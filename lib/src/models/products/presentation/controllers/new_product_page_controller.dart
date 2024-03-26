import 'dart:io';

import 'package:bisne/src/core/presentation/themes/colors.dart';
import 'package:bisne/src/models/base/presentation/controllers/base_page_controller.dart';
import 'package:bisne/src/models/home/presentations/controllers/home_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/infrastructure/cloudinary/upload_image.dart';
import '../../domain/dto/create_ofert_dto.dart';
import '../../infrastructure/graphql/mutations.dart';
import '../../infrastructure/services/create_ofert.dart';

class NewProductPageController extends GetxController {
  static const idController = "newProductPage";
  static const idPreviewController = 'previewProductController';

  final form = FormGroup({
    'productName': FormControl<String>(validators: [Validators.required]),
    'categoryProduct': FormControl<String>(validators: [Validators.required]),
    'descriptionProduct':
        FormControl<String>(validators: [Validators.required]),
    'priceProduct': FormControl<double>(
        validators: [Validators.required, Validators.number]),
    'password': FormControl<String>(validators: [Validators.required]),
  });

  // final List<File?> files = List.generate(5, (index) => null, growable: false);
  // final List<ImageProvider?> productImages =
  //     List.generate(5, (index) => null, growable: false);

  void updateController() {
    update([idController]);
  }

  //IS CODE
  File? fileImage;
  ImageProvider? productImage;

  //END IS CODE

  bool hasImage = false;

  void createProduct() async {
    final urlImage = await uploadImage(fileImage!);

    final CreateOfertDto oferDto = CreateOfertDto(
      shopId: data.shopId,
      name: form.control('name').value,
      imageURL: urlImage,
      description: form.control('description').value,
      categoryId: form.control('category').value,
      price: form.control('price').value,
      labelId: form.control('label').value,
    );
    if (await createOfert(OfertDto: oferDto)) {
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

  void pickImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      fileImage = File(file.path);
      productImage = FileImage(fileImage!);
      update([idController, idPreviewController]);
    }
  }
}
