import 'package:bisne/src/core/presentation/widgets/custom_app_bar.dart';
import 'package:bisne/src/core/presentation/widgets/texts/texts_widgets.dart';
import 'package:bisne/src/models/inventory/presentation/widgets/inventory_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../products/export.dart';
import '../controllers/inventory_page_controller.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const BoldAppText(text: 'Inventario', size: 30),
              const SizedBox(height: 30),
              GetBuilder(
                id: InventoryPageController.idController,
                init: InventoryPageController(),
                builder: (controller) => Column(
                  children: getInventoryItems(controller.products),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> getInventoryItems(List<Product> products) {
  final List<Widget> list = [];
  print('objects');

  for (var product in products) {
    list
      ..add(InventoryItem(product: product))
      ..add(const Divider(height: 25, endIndent: 30, indent: 40));
  }
  return list;
}
