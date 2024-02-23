import 'package:bisne/src/Pages/Orders/Widgets/CheckWidget.dart';
import 'package:bisne/src/Pages/Orders/facture_page.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/Entities/facture.dart';
import '../../../core/utils/texts.dart';
import '../../../core/widgets/circular_image.dart';
import '../../User/Widgets/profiles_pages_button.dart';

class ShopOrderWidget extends StatelessWidget {
  ShopOrderWidget(this.facture, {this.isCheckBox, super.key});
  Facture facture;
  bool? isCheckBox;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        circularImage(NetworkImage(facture.shop.imageUrl), 45),
        Container(
          height: 90,
          margin: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              regularAppText(facture.shop.shopName, 16),
              thinAppText(facture.date.toString(), 13),
              regularAppText("${facture.totalPrice} cup", 15),
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
