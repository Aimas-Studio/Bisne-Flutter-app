import 'package:bisne/src/Pages/Base/base_page_controller.dart';
import 'package:bisne/src/Pages/Home/home_page.dart';
import 'package:bisne/src/Pages/Search/search_page.dart';
import 'package:bisne/src/Pages/User/user_info_page.dart';
import 'package:bisne/src/Widgets/bottom_nav_bar.dart';
import 'package:bisne/src/Widgets/drawer_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasePage extends StatelessWidget {
  BasePage({super.key});
  final BasePageController _basePageController = Get.find<BasePageController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BasePageController>(
        init: BasePageController(),
        builder: (_) {
          return Scaffold(
            body: bodys(_.obj),
            bottomNavigationBar: BottomNavBar(),
          );
        });
  }
}

Widget bodys(int indexPage) {
  return IndexedStack(
    index: indexPage,
    children: [
      SearchPage(),
      SearchPage(),
      HomePage(),
      SearchPage(),
      UserInfoPage(),
    ],
  );
}
