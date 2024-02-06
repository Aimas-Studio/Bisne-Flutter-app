import 'package:bisne/src/Pages/Shop/shop_page_controller.dart';
import 'package:bisne/src/Widgets/secondary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Widgets/shop_page_widgets.dart';

class ShopPage extends StatelessWidget {
  ShopPage({super.key});
  final ShopPageController _shopPageController = Get.put(ShopPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondaryAppBar(context, true,
          iconData: Icons.shopping_cart_outlined,
          shopPageController: _shopPageController),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          perfilSession(context, _shopPageController, false),
          const SizedBox(
            height: 20,
          ),
          categorySession(context, _shopPageController)
        ],
      ),
      backgroundColor: const Color.fromRGBO(245, 246, 248, 1),
    );
  }
}
