import 'package:bisne/src/Pages/Orders/facture_page.dart';
import 'package:flutter/material.dart';

import '../../../core/Utils/Entities/facture.dart';
import '../../../core/Utils/interfaces.dart';
import '../../../core/Utils/texts.dart';
import '../../../core/widgets/circular_image.dart';
import '../../User/Widgets/profiles_pages_button.dart';

Widget shopOrderWidget(context, Facture facture) {
  return ElevatedButton(
    style: const ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(backgroundAppColor),
      elevation: MaterialStatePropertyAll(0),
    ),
    onPressed: () {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        circularImage(NetworkImage(facture.shop.imageUrl), 45),
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              regularAppText(facture.shop.shopName, 16),
              thinAppText(facture.date.toString(), 13),
              regularAppText("${facture.totalPrice} cup", 15),
              profilesPageButton(
                  "Ver Pedido",
                  () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FacturesPage(facture)))),
            ],
          ),
        )
      ],
    ),
  );
}
