import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

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

  void createProduct() {}

  void pickImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      fileImage = File(file.path);
      productImage = FileImage(fileImage!);
      update([idController, idPreviewController]);
    }
  }
}
