import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/widgets/secondary_app_bar.dart';
import '../controllers/shop_page_controller.dart';

class ShopMoreInfoPage extends StatelessWidget {
  ShopMoreInfoPage({super.key});

  final ShopPageController _shopPageController = Get.find<ShopPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondaryAppBar(context, true),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          // info(_shopPageController, context, true),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(245, 246, 248, 1),
    );
  }
}
