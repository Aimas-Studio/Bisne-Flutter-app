import 'package:flutter/material.dart';

import '../../core/entities/content_panel.dart';
import '../../core/presentation/icons/custom_icons.dart';
import '../../core/presentation/themes/colors.dart';
import '../user/presentation/widgets/profile_widget.dart';
import '../user/presentation/widgets/white_option_button_list.dart';
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
                mainInfo: shop.shopName,
                secondaryInfo: shop.categories.join(" "),
                buttonLabel: "EDITAR TIENDA",
                image: AssetImage(shop.imageUrl),
                buttonAction: () {},
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

  final List<ContentPanel> _contentPanel1 = [
    ContentPanel(Icons.list, "Administrar Inventario", (context) {}),
    ContentPanel(CustomIcons.finished, "Pedidos Realizados", (context) {}),
    ContentPanel(Icons.add, "Publicar Producto", (context) {
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => NewProductPageTest()));
    })
  ];

  final List<ContentPanel> _contentPanel2 = [
    ContentPanel(Icons.star, "Invitar Amigos", (context) {}),
    ContentPanel(CustomIcons.employed, "Contactar Equipo", (context) {}),
    ContentPanel(CustomIcons.rate, "Calificar App", (context) {}),
    ContentPanel(Icons.share, "Compartir Tienda", (context) {}),
  ];
}
