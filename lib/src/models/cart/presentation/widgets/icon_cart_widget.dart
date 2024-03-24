import 'package:bisne/src/core/presentation/widgets/texts/texts_widgets.dart';
import 'package:bisne/src/models/cart/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/themes/themes_export.dart';
import '../controllers/cart_page_controller.dart';

class IconCartWidget extends StatelessWidget {
  const IconCartWidget({super.key});

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CartPage(),
        ),
      ),
      child: GetBuilder(
        init: CartController(),
        builder: (cartController) => Badge(
          offset: const Offset(-3, 0),
          isLabelVisible: cartController.itemsToBuy.isNotEmpty,
          largeSize: 22,
          alignment: Alignment.bottomLeft,
          backgroundColor: bisneColorPrimary,
          label: SizedBox(
            width: 15,
            child: Center(
              child: RegularAppText(
                text: cartController.itemsToBuy.length.toString(),
                color: Colors.white,
              ),
            ),
          ),
          child: const DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: iconAppColor,
                size: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
