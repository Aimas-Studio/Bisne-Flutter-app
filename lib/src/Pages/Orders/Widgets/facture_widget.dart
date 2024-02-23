import 'package:flutter/material.dart';

import '../../../core/Utils/Entities/product.dart';
import '../../../core/Utils/texts.dart';
import '../../../core/widgets/circular_image.dart';

Widget factureWidget(ProductDump product, int amount) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      circularImage(NetworkImage(product.imagesUrl[0]), 45),
      Container(
        margin: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            regularAppText(product.name, 15),
            thinAppText(product.shopDump.shopName, 12),
            const SizedBox(
              height: 10,
            ),
            regularAppText(product.price.toString(), 14),
            thinAppText("cant:$amount", 11),
          ],
        ),
      )
    ],
  );
}
