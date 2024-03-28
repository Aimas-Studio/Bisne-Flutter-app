import 'package:bisne/src/models/factures/presentation/screens/factures_page.dart';
import 'package:bisne/src/models/home/presentations/controllers/home_page_controller.dart';
import 'package:bisne/src/models/shop/presentation/screens/shop_info_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/entities/content_panel.dart';
import '../../../../core/presentation/icons/custom_icons.dart';
import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../../shop/presentation/screens/edit_or_create_shop_info_page.dart';
import '../../export.dart';
import '../controllers/user_info_controller.dart';
import '../widgets/white_option_button_list.dart';
import 'edit_user_page.dart';

class UserInfoPage extends StatelessWidget {
  final User user;
  final bool isAdmin;
  const UserInfoPage({super.key, required this.user, required this.isAdmin});

  @override
  Widget build(context) {
    return GetBuilder<UserInfoController>(
      init: UserInfoController(),
      id: UserInfoController.id,
      builder: (controller) {
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
                      const SizedBox(width: 20),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: CircularImage(size: 55, child: getUserImage()),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 0),
                            child: BoldAppText(
                                text: getUserInfo().username, size: 30),
                          ),
                          RegularAppText(text: getUserInfo().email, size: 16),
                          const SizedBox(height: 11),
                          OutlineAppButton(
                            onPressed: () {
                              Get.to(() => const EditUserPage());
                            },
                            child: const LightAppText(text: 'EDITAR PERFIL'),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: controller.logout,
                            icon: const Icon(
                              Icons.logout,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                  const SizedBox(height: 18),
                  WhiteOptionButtonList(content: [
                    ContentPanel(CustomIcons.finished, "Pedidos Realizados",
                        () => Get.to(() => const FacturesPage())),
                    PerData.shopExists
                        ? ContentPanel(
                            Icons.maps_home_work_outlined,
                            "Administrar Tienda",
                            () => Get.to(() => const ShopInfoPage()))
                        : ContentPanel(
                            Icons.add,
                            "Publicar Negocio",
                            () => Get.to(() => const EditOrCreateShopInfoPage(
                                createShop: true)))
                  ]),
                  const SizedBox(height: 20),
                  WhiteOptionButtonList(content: _contentPanel2),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

final List<ContentPanel> _contentPanel2 = [
  //TODO contactar equipo mensaje a presi
  ContentPanel(CustomIcons.employed, "Contactar Equipo", () {}),
  //TODO
  ContentPanel(CustomIcons.rate, "Calificar App", () {}),
  ContentPanel(Icons.share, "Compartir App", () {}),
];
