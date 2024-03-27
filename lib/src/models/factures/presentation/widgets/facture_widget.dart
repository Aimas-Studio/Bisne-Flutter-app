import 'package:bisne/src/core/presentation/themes/place_holders.dart';
import 'package:bisne/src/core/presentation/widgets/images/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../domain/facture_entity.dart';
import '../screens/facture_details_page.dart';

class FactureWidget extends StatelessWidget {
  final Facture facture;
  final bool shop;

  const FactureWidget({
    required this.facture,
    super.key,
    this.shop = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularImage(
          size: 50,
          child: CustomFadeInImage(
            image: customNetworkImage(
              shop ? facture.user.imageUrl : facture.shop.imageUrl,
            ),
            placeholder: placeHolderImageApp,
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegularAppText(
                text: shop ? facture.user.username : facture.shop.name,
                size: 16),
            ThinAppText(text: facture.date.toString(), size: 12),
            RegularAppText(text: "${facture.totalPrice} cup", size: 15),
            const SizedBox(height: 10),
            OutlineAppButton(
              onPressed: () => Get.to(
                () => FactureDetailPage(facture, shop: shop),
              ),
              child: const LightAppText(text: "Ver Pedido"),
            ),
          ],
        ),
      ],
    );
  }
}
