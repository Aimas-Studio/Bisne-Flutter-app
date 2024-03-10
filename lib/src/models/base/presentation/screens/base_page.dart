import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../controllers/base_page_controller.dart';
import '../widgets/bottom_nav_bar.dart';

final appData = PersistentData();

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BasePageController>(
      id: BasePageController.idController,
      init: BasePageController(),
      builder: (basePageController) {
        return Scaffold(
          body: IndexedStack(
            index: basePageController.obj,
            children: basePageController.navigators,
          ),
          bottomNavigationBar:
              basePageController.showBottomNavBar.value ? BottomNavBar() : null,
        );
      },
    );
  }
}
