import 'package:bisne/src/core/presentation/themes/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/widgets_export.dart';

class BuyInfoCartWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final double height;
  final double price;

  const BuyInfoCartWidget(
      {super.key, this.height = 100, this.price = 0.0, this.onPressed});

  @override
  Widget build(context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ThinAppText(text: 'Total', size: 14),
                  RegularAppText(text: '$price mm', size: 27),
                  const ThinAppText(
                      text: 'No incluye el precio de la mensajería', size: 14),
                ],
              ),
              CustomButtonArrowIcon(
                color: bisneColorPrimary,
                width: 200,
                onPressed: onPressed,
                text: 'COMPRAR',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
