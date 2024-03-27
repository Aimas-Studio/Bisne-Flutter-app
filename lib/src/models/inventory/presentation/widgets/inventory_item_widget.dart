import 'package:bisne/src/core/presentation/widgets/widgets_export.dart';
import 'package:bisne/src/models/products/domain/entities/product_entity.dart';
import 'package:bisne/src/models/products/presentation/screens/edit_product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryItem extends StatelessWidget {
  final VoidCallback? cancelFunction;
  final Product product;
  const InventoryItem({
    super.key,
    required this.product,
    this.cancelFunction,
  });

  @override
  Widget build(context) {
    return Row(
      children: [
        CircularImage(
            child: Image.network(product.imageUrl, fit: BoxFit.cover)),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegularAppText(text: product.name),
              LightAppText(text: product.label),
              const SizedBox(height: 10),
              RegularAppText(text: '${product.price} mn'),
              Row(
                children: [
                  OutlineAppButton(
                      child: const LightAppText(text: 'EDITAR'),
                      onPressed: () {
                        Get.to(EditProductPage(product: product));
                      }),
                  const SizedBox(width: 10),
                  OutlineAppButton(
                    onPressed: cancelFunction,
                    child: const LightAppText(text: 'ElIMINAR'),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
