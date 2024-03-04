import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/entities/content_panel.dart';
import '../../../../core/presentation/icons/custom_icons.dart';
import '../../../../core/presentation/themes/colors.dart';
import '../../../Orders/presentation/screens/orders_page.dart';
import '../../../shop/presentation/screens/edit_or_create_shop_info_page.dart';
import '../../domain/entities/user.dart';
import '../widgets/profile_widget.dart';
import '../widgets/white_option_button_list.dart';
import 'edit_user_page.dart';

class UserInfoPage extends StatelessWidget {
  final User user;

  const UserInfoPage({super.key, required this.user});

  @override
  Widget build(context) {
    //Wrap in a SingleScrollView for more responsive design
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              // ProfileWidget(
              //     mainInfo: user.username,
              //     secondaryInfo: user.email,
              //     buttonLabel: "EDITAR PERFIL",
              //     image: AssetImage(user.imageUrl),
              //     buttonAction: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => EditUserPage(user: user)));
              //     }),
              const SizedBox(
                height: 18,
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
  ContentPanel(CustomIcons.finished, "Pedidos Realizados",
      () => Get.to(() => const OrderPage())),
  ContentPanel(Icons.add, "Publicar Negocio",
      () => Get.to(() => const EditOrCreateShopInfoPage(createShop: true)))
];

final List<ContentPanel> _contentPanel2 = [
  //TODO contactar equipo mensaje a presi
  ContentPanel(CustomIcons.employed, "Contactar Equipo", () {}),
  //TODO
  ContentPanel(CustomIcons.rate, "Calificar App", () {}),
  ContentPanel(Icons.share, "Compartir App", () {}),
];
