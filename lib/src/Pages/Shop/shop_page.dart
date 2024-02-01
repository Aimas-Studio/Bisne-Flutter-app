import 'package:bisne/src/Pages/Shop/shop_page_controller.dart';
import 'package:bisne/src/Pages/Shop/shop_page_widgets.dart';
import 'package:bisne/src/Widgets/appNotificationBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopPage extends StatelessWidget {
  ShopPage({super.key});
  final ShopPageController _shopPageController = Get.put(ShopPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        toolbarHeight: 70,
        foregroundColor: const Color.fromRGBO(114, 124, 142, 1),
        actions: [
          Container(
            alignment: AlignmentDirectional.centerEnd,
            child: appNotificationBar(context, true),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          perfilSession(context, _shopPageController),
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
