import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/presentation/widgets/images/image_picker_widget.dart';

class NewProductPageController extends GetxController {
  final nameController = TextEditingController().obs;
  final categoryController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;
  final priceController = TextEditingController().obs;
  final List<ImagePickerWidget> imagesPickers = [
    ImagePickerWidget(),
    ImagePickerWidget(),
    ImagePickerWidget(),
    ImagePickerWidget(),
    ImagePickerWidget(),
  ];
}
