import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/texts/texts_widgets.dart';
import '../../../products/export.dart';

class ProductFactureDetailsWidget extends StatelessWidget {
  final Product product;
  final int amount;

  const ProductFactureDetailsWidget(
      {super.key, required this.product, required this.amount});

  @override
  Widget build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // CircularImage(image: NetworkImage(product.imagesUrl[0]), size: 45),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegularAppText(text: product.name, size: 15),
              ThinAppText(text: product.shop.name, size: 12),
              const SizedBox(
                height: 10,
              ),
              RegularAppText(text: product.price.toString(), size: 14),
              ThinAppText(text: "cant:$amount", size: 11),
            ],
          ),
        )
      ],
    );
  }
}
