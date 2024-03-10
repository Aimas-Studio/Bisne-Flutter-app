import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../domain/facture_entity.dart';
import '../screens/facture_details_page.dart';
import 'check_widget.dart';

class FactureWidget extends StatelessWidget {
  final Facture facture;
  final bool? isCheckBox;

  const FactureWidget({required this.facture, this.isCheckBox, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircularImage(
          size: 45,
          child: CustomFadeInImage(image: NetworkImage(facture.shop.imageUrl)),
        ),
        const SizedBox(width: 20),
        SizedBox(
          height: 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegularAppText(text: facture.shop.name, size: 16),
              ThinAppText(text: facture.date.toString(), size: 13),
              RegularAppText(text: "${facture.totalPrice} cup", size: 15),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: OutlineAppButton(
                    child: const LightAppText(text: "Ver Pedido"),
                    onPressed: () => Get.to(() => FactureDetailPage(facture)),
                  ),
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
