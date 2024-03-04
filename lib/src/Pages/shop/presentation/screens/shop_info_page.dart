import 'package:flutter/material.dart';

import '../../../../core/entities/content_panel.dart';
import '../../../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../../../../core/presentation/icons/custom_icons.dart';
import '../../../../core/presentation/themes/colors.dart';
import '../../../user/presentation/widgets/profile_widget.dart';
import '../../../user/presentation/widgets/white_option_button_list.dart';
import '../../infrastructure/services/get_shop_info.dart';

final persistentData = PersistentData();

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
                secondaryInfo: shop.category,
                buttonLabel: "EDITAR TIENDA",
                image: getShopImage(),
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
}
