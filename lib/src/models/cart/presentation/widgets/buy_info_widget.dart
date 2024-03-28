import 'package:bisne/src/core/presentation/widgets/buttons/main_button_widget.dart';
import 'package:bisne/src/models/cart/presentation/controllers/cart_page_controller.dart';
import 'package:bisne/src/models/cart/presentation/widgets/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/presentation/widgets/widgets_export.dart';

class BuyInfoCartWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final double height;
  final CartController controller;
  final bool isValid;

  const BuyInfoCartWidget(
      {super.key,
      this.height = 100,
      required this.controller,
      this.onPressed,
      required this.isValid});

  @override
  Widget build(context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 30,
            ),
            const RegularAppText(text: 'Total: ', size: 22),
            Obx(() => BoldAppText(
                text: '${controller.buyPrice.toString()} mm', size: 27)),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: MainButton(
                onPressed:
                    isValid ? () => cartController.Buy(context) : () => (),
                text: const RegularAppText(
                  text: 'COMPRAR',
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            )
          ],
        ),
      ),
    );
  }
}
