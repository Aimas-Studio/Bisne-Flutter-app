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
              userServicesList(contentPanel1),
              const SizedBox(height: 20),
              userServicesList(contentPanel2),
            ],
          ),
        ),
      ),
    );
  }

  final Map<IconData, String> contentPanel1 = {
    Icons.list: "Administrar Inventario",
    CustomIcons.finished: "Pedidos Realizados",
    Icons.add: "Publicar Producto"
  };

  final Map<IconData, String> contentPanel2 = {
    Icons.star: "Invitar Amigos",
    CustomIcons.employed: "Contactar Equipo",
    CustomIcons.rate: "Calificar App",
    Icons.share: "Compartir Tienda",
  };
}
