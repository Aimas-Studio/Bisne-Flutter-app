import 'package:bisne/src/core/presentation/widgets/buttons/main_button_widget.dart';
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
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 30,
            ),
            const RegularAppText(text: 'Total: ', size: 22),
            BoldAppText(text: '$price mm', size: 27),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: MainButton(
                onPressed: () => (),
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
