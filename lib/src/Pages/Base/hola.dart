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

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BasePageController>(
      init: BasePageController(),
      builder: (_) {
        return Scaffold(
          body: _bodys(_.obj),
          bottomNavigationBar: BottomNavBar(),
        );
      },
    );
  }

  Widget _bodys(int indexPage) {
    return IndexedStack(
      index: indexPage,
      children: [
        Navigator(
          key: _basePageController.navigatorKeys[0],
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              builder: (_) => NotificationPage(),
            );
          },
        ),
        Navigator(
          key: _basePageController.navigatorKeys[1],
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              builder: (_) => const SearchPage(),
            );
          },
        ),
        Navigator(
          key: _basePageController.navigatorKeys[2],
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              builder: (_) => const HomePage(),
            );
          },
        ),
        Navigator(
          key: _basePageController.navigatorKeys[3],
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              builder: (_) => const FavoritePage(),
            );
          },
        ),
        Navigator(
          key: _basePageController.navigatorKeys[4],
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              builder: (_) => const UserInfoPage(),
            );
          },
        ),
      ],
    );
  }
}
