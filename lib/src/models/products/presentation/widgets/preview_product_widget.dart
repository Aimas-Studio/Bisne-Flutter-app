import 'package:bisne/src/core/infrastructure/persistent%20data/shared_persistent_data.dart';
import 'package:bisne/src/core/presentation/widgets/texts/texts_widgets.dart';
import 'package:flutter/material.dart';

final persistentData = PersistentData();

class PreviewProductWidget extends StatelessWidget {
  final String productName;
  final String productCategory;
  final String productDescription;
  final double? price;
  final List<ImageProvider>? productImage;

  const PreviewProductWidget({
    this.productName = '',
    this.productCategory = '',
    this.productDescription = '',
    this.productImage,
    this.price,
    super.key,
  });

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ColoredBox(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: RegularAppText(text: persistentData.name),
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
    );
  }
}
