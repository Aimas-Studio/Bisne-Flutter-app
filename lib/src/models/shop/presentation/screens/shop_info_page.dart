import 'package:bisne/src/models/factures/export.dart';
import 'package:bisne/src/models/inventory/presentation/screens/inventory_page.dart';
import 'package:bisne/src/models/products/presentation/screens/new_product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/entities/content_panel.dart';
import '../../../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../../../../core/presentation/icons/custom_icons.dart';
import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../../user/presentation/widgets/white_option_button_list.dart';
import '../../infrastructure/services/get_shop_info.dart';
import 'edit_or_create_shop_info_page.dart';

class ShopInfoPage extends StatelessWidget {
  const ShopInfoPage({super.key});

  @override
  Widget build(context) {
    final data = PersistentData();
    print('implementar data.category para la pagina de administrar tienda');
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: CircularImage(size: 55, child: getShopImage()),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 0),
                          child:
                              BoldAppText(text: getShopInfo().name, size: 30),
                        ),
                        RegularAppText(text: getShopInfo().category, size: 16),
                        const SizedBox(height: 11),
                        OutlineAppButton(
                          onPressed: () {
                            Get.to(() => const EditOrCreateShopInfoPage());
                          },
                          child: const LightAppText(text: 'EDITAR TIENDA'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              WhiteOptionButtonList(content: _contentPanel1),
              const SizedBox(height: 20),
              WhiteOptionButtonList(content: _contentPanel2),
            ],
          ),
        ),
      ),
    );
  }
}

final List<ContentPanel> _contentPanel1 = [
  ContentPanel(Icons.list, "Administrar Inventario", () {
    Get.to(() => const InventoryPage());
  }),
  ContentPanel(CustomIcons.finished, "Pedidos Realizados", () {
    Get.to(() => const FacturesPage(shop: true));
  }),
  ContentPanel(Icons.add, "Publicar Producto",
      () => Get.to(() => const NewProductPage()))
];

final List<ContentPanel> _contentPanel2 = [
  ContentPanel(Icons.star, "Invitar Amigos", () {}),
  ContentPanel(CustomIcons.employed, "Contactar Equipo", () {}),
  ContentPanel(CustomIcons.rate, "Calificar App", () {}),
  ContentPanel(Icons.share, "Compartir Tienda", () {}),
];
