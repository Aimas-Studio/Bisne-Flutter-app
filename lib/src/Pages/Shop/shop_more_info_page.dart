import 'package:bisne/src/Pages/Shop/shop_page_controller.dart';
import 'package:bisne/src/Pages/Shop/shop_page_widgets.dart';
import 'package:bisne/src/Widgets/appBarSecondary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopMoreInfoPage extends StatelessWidget {
  ShopMoreInfoPage({super.key});
  final ShopPageController _shopPageController = Get.find<ShopPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSecondary(context, true),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          perfilSession(context, _shopPageController, true),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(245, 246, 248, 1),
    );
  }
}