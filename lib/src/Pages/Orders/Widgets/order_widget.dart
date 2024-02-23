import 'package:bisne/src/Pages/Orders/Widgets/CheckWidget.dart';
import 'package:bisne/src/Pages/Orders/facture_page.dart';
import 'package:flutter/material.dart';

import '../../../core/entities/facture.dart';
import '../../../core/widgets/images/circular_image.dart';
import '../../../core/widgets/texts/texts_widgets.dart';
import '../../User/Widgets/profiles_pages_button.dart';

class ShopOrderWidget extends StatelessWidget {
  final Facture facture;
  final bool? isCheckBox;
  const ShopOrderWidget(this.facture, {this.isCheckBox, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircularImage(image: NetworkImage(facture.shop.imageUrl), size: 45),
        Container(
          height: 90,
          margin: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegularAppText(text: facture.shop.shopName, size: 16),
              ThinAppText(text: facture.date.toString(), size: 13),
              RegularAppText(text: "${facture.totalPrice} cup", size: 15),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: profilesPageButton(
                      "Ver Pedido",
                      () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FacturesPage(facture)))),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.bottomRight,
            child: isCheckBox != null
                ? CheckWidget(isChecked: isCheckBox ?? isCheckBox!)
                : Container(),
          ),
        ),
        const SizedBox(
          width: 30,
        )
      ],
    );
  }
}
