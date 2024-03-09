import 'package:bisne/src/models/cart/presentation/controllers/cart_page_controller.dart';
import 'package:bisne/src/models/cart/presentation/widgets/product_cart_counter.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/themes/themes_export.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../../products/export.dart';

final CartController cartController = CartController();

class ProductItemCart extends StatelessWidget {
  final Product product;

  const ProductItemCart({super.key, required this.product});

  @override
  Widget build(context) {
    return Row(
      children: [
        CircularImage(
          size: 50,
          child: CustomFadeInImage(
            image: NetworkImage(product.imagesUrl[0]),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegularAppText(text: product.name),
            ThinAppText(text: product.shop.shopName),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: RegularAppText(
                  text: '${product.price} mn', color: bisneColorPrimary),
            ),
            ProductCartCounter(
                onPlusPressed: () => cartController.addProduct(product, 1),
                onMinusPressed: () => cartController.removeProduct(product),
                initialAmount: cartController.itemsToBuy[product] ?? 1)
          ],
        ),
      ],
    );
  }
}
