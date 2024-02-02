import 'package:bisne/src/Utils/Entities/content_panel.dart';
import 'package:flutter/material.dart';

import '../../Utils/custom_icons.dart';
import '../../Utils/interfaces.dart';
import '../User/Widgets/profile_widget.dart';
import '../User/Widgets/user_page_widgets.dart';
import 'Providers/shop_provider.dart';

class ShopInfoPage extends StatelessWidget {
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
                getShopName(),
                getShopType(),
                "EDITAR TIENDA",
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
    ContentPanel(Icons.add, "Publicar Producto", (context) {})
  ];

  final List<ContentPanel> contentPanel2 = [
    ContentPanel(Icons.star, "Invitar Amigos", (context) {}),
    ContentPanel(CustomIcons.employed, "Contactar Equipo", (context) {}),
    ContentPanel(CustomIcons.rate, "Calificar App", (context) {}),
    ContentPanel(Icons.share, "Compartir Tienda", (context) {}),
  ];
}
