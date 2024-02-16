import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewProductPageController extends GetxController {
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  late RxString productName;
  late RxString productDescription;
  late RxString productPrice;

  NewProductPageController() {
    productName = nameController.value.text.obs;
    productDescription = descriptionController.value.text.obs;
    productPrice = priceController.value.text.obs;
  }
}
