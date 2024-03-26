import 'dart:io';

import 'package:bisne/src/models/products/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditProductPageController extends GetxController {
  static const idController = 'editProductPageController';
  final Product product;
  late FormGroup form;
  File? fileImage;
  ImageProvider? productImage;
  bool hasImageChange = false;

  EditProductPageController({required this.product}) {
    form = FormGroup({
      'productName': FormControl<String>(
          validators: [Validators.required], value: product.name),
      'productCategory': FormControl<String>(
          validators: [Validators.required], value: product.category),
      'productDescription': FormControl<String>(
          validators: [Validators.required], value: product.description),
      'productPrice': FormControl<String>(
          validators: [Validators.required], value: product.price.toString()),
      'label': FormControl<String>(
          validators: [Validators.required], value: product.label),
      'password': FormControl<String>(validators: [Validators.required]),
    });
  }

  String get productName {
    return form.control('productName').value;
  }

  String get productDescription {
    return form.control('productDescription').value;
  }

  String get productCategory {
    return form.control('productCategory').value;
  }

  String get productPrice {
    return form.control('productPrice').value;
  }

  void pickImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      fileImage = File(file.path);
      productImage = FileImage(fileImage!);
      hasImageChange = true;
      update([idController]);
    }
  }

  void editProductSubmit() {}
}
