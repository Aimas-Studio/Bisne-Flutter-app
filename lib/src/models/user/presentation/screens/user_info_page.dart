import 'package:bisne/src/models/factures/presentation/screens/factures_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/entities/content_panel.dart';
import '../../../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../../../../core/presentation/icons/custom_icons.dart';
import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../../shop/presentation/screens/edit_or_create_shop_info_page.dart';
import '../../export.dart';
import '../widgets/white_option_button_list.dart';
import 'edit_user_page.dart';

final persistentData = PersistentData();

class UserInfoPage extends StatelessWidget {
  final User user;

  const UserInfoPage({super.key, required this.user});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CircularImage(size: 55, child: getUserImage()),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 0),
                        child: BoldAppText(text: user.username, size: 30),
                      ),
                      RegularAppText(text: user.email, size: 16),
                      const SizedBox(height: 11),
                      OutlineAppButton(
                        onPressed: () {
                          Get.to(() => const EditUserPage());
                        },
                        child: const LightAppText(text: 'EDITAR PERFIL'),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 18),
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
      () => Get.to(() => const FacturesPage())),
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
