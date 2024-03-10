import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/entities/content_panel.dart';
import '../../../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../../../../core/presentation/icons/custom_icons.dart';
import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../../user/presentation/widgets/white_option_button_list.dart';
import '../../domain/entities/shop_entity.dart';
import '../../infrastructure/services/get_shop_info.dart';
import 'edit_or_create_shop_info_page.dart';

final persistentData = PersistentData();

class ShopInfoPage extends StatelessWidget {
  final Shop shop;

  const ShopInfoPage({super.key, required this.shop});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
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
                        child: BoldAppText(text: shop.name, size: 30),
                      ),
                      RegularAppText(text: shop.category, size: 16),
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
  ContentPanel(Icons.list, "Administrar Inventario", () {}),
  ContentPanel(CustomIcons.finished, "Pedidos Realizados", () {}),
  ContentPanel(Icons.add, "Publicar Producto", () {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => NewProductPageTest()));
  })
];

final List<ContentPanel> _contentPanel2 = [
  ContentPanel(Icons.star, "Invitar Amigos", () {}),
  ContentPanel(CustomIcons.employed, "Contactar Equipo", () {}),
  ContentPanel(CustomIcons.rate, "Calificar App", () {}),
  ContentPanel(Icons.share, "Compartir Tienda", () {}),
];
