import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../domain/facture_entity.dart';
import '../screens/facture_details_page.dart';

class FactureWidget extends StatelessWidget {
  final Facture facture;

  const FactureWidget({required this.facture, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularImage(
          size: 50,
          child: CustomFadeInImage(image: NetworkImage(facture.shop.imageUrl)),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegularAppText(text: facture.shop.name, size: 16),
            ThinAppText(text: facture.date.toString(), size: 12),
            RegularAppText(text: "${facture.totalPrice} cup", size: 15),
            const SizedBox(height: 10),
            OutlineAppButton(
              onPressed: () => Get.to(
                () => FactureDetailPage(facture),
              ),
              child: const LightAppText(text: "Ver Pedido"),
            ),
          ],
        ),
      ],
    );
  }
}
