import 'package:bisne/src/core/presentation/widgets/images/custom_network_image.dart';
import 'package:bisne/src/models/cart/presentation/controllers/cart_page_controller.dart';
import 'package:bisne/src/models/cart/presentation/widgets/product_cart_counter.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/themes/themes_export.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../../products/export.dart';

final CartController cartController = CartController();

class ProductItemCart extends StatelessWidget {
  final Product product;
  final Function deleteFunction;

  const ProductItemCart(
      {super.key, required this.product, required this.deleteFunction});

  @override
  Widget build(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: SizedBox(
            height: 120,
            width: 120,
            child: CustomFadeInImage(
              image: customNetworkImage(product.imageUrl),
            ),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 10,
              ),
              RegularAppText(
                text: product.name,
                size: 18,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: RegularAppText(
                  text: '${product.price} mn',
                  color: Colors.black,
                  size: 18,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ProductCartCounter(
                      onPlusPressed: () =>
                          cartController.addProduct(product, 1),
                      onMinusPressed: () =>
                          cartController.removeProduct(product),
                      initialAmount: cartController.itemsToBuy[product] ?? 1),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () async {
                  if (await deleteFunction(context)) {
                    cartController.deleteProduct(product);
                  }
                },
                icon: const Icon(
                  Icons.delete,
                  color: iconAppColor,
                )),
          ),
        )
      ],
    );
  }
}
