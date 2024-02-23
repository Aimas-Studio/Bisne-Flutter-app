import 'package:bisne/src/Pages/Products/new_product_page_test.dart';
import 'package:bisne/src/Pages/Shop/edit_shop_info_page.dart';
import 'package:flutter/material.dart';

import '../../core/Utils/Entities/content_panel.dart';
import '../../core/Utils/custom_icons.dart';
import '../../core/Utils/interfaces.dart';
import '../User/Widgets/profile_widget.dart';
import '../User/Widgets/user_page_widgets.dart';
import 'Providers/shop_provider.dart';

class ShopInfoPage extends StatelessWidget {
  final shop = getShopInfo();

  ShopInfoPage({super.key});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProfileWidget(
                shop.shopName,
                shop.categories.join(" "),
                "EDITAR TIENDA",
                const EditShopInfoPage(),
                AssetImage(shop.imageUrl),
              ),
              userServicesList(contentPanel1, context),
              const SizedBox(height: 20),
              userServicesList(contentPanel2, context),
            ],
          ),
        ),
      ),
    );
  }

  final List<ContentPanel> contentPanel1 = [
    ContentPanel(Icons.list, "Administrar Inventario", (context) {}),
    ContentPanel(CustomIcons.finished, "Pedidos Realizados", (context) {}),
    ContentPanel(Icons.add, "Publicar Producto", (context) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => NewProductPageTest()));
    })
  ];

  final List<ContentPanel> contentPanel2 = [
    ContentPanel(Icons.star, "Invitar Amigos", (context) {}),
    ContentPanel(CustomIcons.employed, "Contactar Equipo", (context) {}),
    ContentPanel(CustomIcons.rate, "Calificar App", (context) {}),
    ContentPanel(Icons.share, "Compartir Tienda", (context) {}),
  ];
}
