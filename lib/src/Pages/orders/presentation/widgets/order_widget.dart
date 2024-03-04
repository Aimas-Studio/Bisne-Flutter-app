import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../domain/facture_entity.dart';
import '../screens/facture_page.dart';
import 'check_widget.dart';

class ShopOrderWidget extends StatelessWidget {
  final Facture facture;
  final bool? isCheckBox;

  const ShopOrderWidget({required this.facture, this.isCheckBox, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircularImage(
            size: 45,
            child:
                CustomFadeInImage(image: NetworkImage(facture.shop.imageUrl))),
        const SizedBox(width: 20),
        SizedBox(
          height: 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegularAppText(text: facture.shop.shopName, size: 16),
              ThinAppText(text: facture.date.toString(), size: 13),
              RegularAppText(text: "${facture.totalPrice} cup", size: 15),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: OutlineAppButton(
                      child: const LightAppText(text: "Ver Pedido"),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => FacturesPage(facture)))),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Align(
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
