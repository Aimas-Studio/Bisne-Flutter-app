import 'package:flutter/material.dart';

import '../../../../Pages/products/presentation/widgets/product_card_widget.dart';
import '../../../../Pages/shop/domain/entities/shop_entity.dart';
import 'shop_card_widget.dart';
import 'table_card_widget.dart';

TableCardWidget createShopTable(BuildContext context, List<Shop?> data) {
  return TableCardWidget(
    maxColumns: MediaQuery.sizeOf(context).width > 550 ? 3 : 2,
    data: data,
  );
}

// TableCardWidget<ProductCard> createProductTable(
//     BuildContext context, List<Map<String, dynamic>> data) {
//   return TableCardWidget(
//     maxColumns: MediaQuery.sizeOf(context).width > 550 ? 3 : 2,
//     data: data,
//     cardFactory: (product) => ProductCard(
//       name: product["name"]!,
//       image: product["image"]!,
//       price: product["price"]!,
//     ),
//   );
// }
