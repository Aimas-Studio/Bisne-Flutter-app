import 'package:bisne/src/core/presentation/themes/place_holders.dart';
import 'package:flutter/material.dart';

import '../../../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: RectangleCircularImage(
                    size: 220,
                    child: Image(
                      image: productImage ?? placeHolderImageApp,
                      fit: BoxFit.cover,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: RegularAppText(text: _persistentData.shopName),
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
