import 'package:bisne/src/Pages/Base/base_page_controller.dart';
import 'package:bisne/src/Pages/Favorite/favorite_page.dart';
import 'package:bisne/src/Pages/Home/home_page.dart';
import 'package:bisne/src/Pages/Notifications/notifications_page.dart';
import 'package:bisne/src/Pages/Search/search_page.dart';
import 'package:bisne/src/Pages/User/user_info_page.dart';
import 'package:bisne/src/Widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasePage extends StatelessWidget {
  final BasePageController _basePageController = Get.find<BasePageController>();
  List<Navigator> _navigators = [];
  BasePage({super.key}) {
    _navigators =
        List<Navigator>.generate(5, (index) => _buildNavigator(index));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BasePageController>(
      init: BasePageController(),
      builder: (_) {
        return Scaffold(
          body: Obx(() => IndexedStack(
                index: _basePageController.obj,
                children: _navigators,
              )),
          bottomNavigationBar: Obx(
            () => _basePageController.showBottomNavBar.value
                ? BottomNavBar()
                : Container(),
          ),
        );
      },
    );
  }

  Navigator _buildNavigator(int indexPage) {
    return Navigator(
      key: _basePageController.navigatorKeys[indexPage],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (_) {
          switch (indexPage) {
            case 0:
              return const NotificationPage();
            case 1:
              return const SearchPage();
            case 2:
              return const HomePage();
            case 3:
              return const FavoritePage();
            case 4:
              return UserInfoPage();
            default:
              return const HomePage();
          }
        });
      },
    );
  }
}
