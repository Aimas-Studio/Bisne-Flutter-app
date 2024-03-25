import 'package:bisne/src/core/presentation/themes/place_holders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../controllers/new_product_page_controller.dart';

final _persistentData = PersistentData();

class PreviewProductWidget extends StatelessWidget {
  final String productName;
  final String productCategory;
  final String productDescription;
  final double? price;
  final ImageProvider? productImage;

  const PreviewProductWidget({
    this.productName = '',
    this.productCategory = '',
    this.productDescription = '',
    this.productImage,
    this.price = 0.0,
    super.key,
  });

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ColoredBox(
        color: Colors.white,
        child: GetBuilder<NewProductPageController>(
          id: NewProductPageController.idPreviewController,
          init: NewProductPageController(),
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: RectangleCircularImage(
                    child: Image(image: productImage ?? placeHolderImageApp)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: RegularAppText(text: _persistentData.name),
              ),
              BoldAppText(text: productName, size: 30),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: LightAppText(text: productDescription),
              ),
              Row(
                children: [
                  BoldAppText(text: price.toString()),
                  const SizedBox(width: 10),
                  const LightAppText(text: 'mn')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
