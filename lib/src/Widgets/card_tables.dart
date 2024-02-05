import 'package:bisne/src/Pages/Products/product_card_widget.dart';
import 'package:bisne/src/Widgets/shop_card_widget.dart';
import 'package:bisne/src/Widgets/table_card_widget.dart';
import 'package:flutter/material.dart';

TableCardWidget<ShopCard> createShopTable(
    BuildContext context, List<Map<String, dynamic>> data) {
  return TableCardWidget(
    maxColumns: MediaQuery.sizeOf(context).width > 400 ? 3 : 2,
    data: data,
    cardFactory: (shop) => ShopCard(
      name: shop["name"]!,
      categories: shop["categories"]!,
      image: shop["image"]!,
      rate: shop["rate"]!,
    ),
  );
}

TableCardWidget<ProductCard> createProductTable(
    BuildContext context, List<Map<String, dynamic>> data) {
  return TableCardWidget(
    maxColumns: MediaQuery.sizeOf(context).width > 400 ? 3 : 2,
    data: data,
    cardFactory: (product) => ProductCard(
      name: product["name"]!,
      image: product["image"]!,
      price: product["price"]!,
    ),
  );
}
