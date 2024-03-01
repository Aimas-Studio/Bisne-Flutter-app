import 'package:bisne/src/Pages/Base/base_page_controller.dart';
import 'package:bisne/src/Pages/Favorite/favorite_page.dart';
import 'package:bisne/src/Pages/Home/home_page.dart';
import 'package:bisne/src/Pages/Notifications/notifications_page.dart';
import 'package:bisne/src/Pages/Search/search_page.dart';
import 'package:bisne/src/Pages/User/user_info_page.dart';
import 'package:bisne/src/Pages/auth/login_page.dart';
import 'package:bisne/src/core/persistent%20data/shared_persistent_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/bottom_nav_bar.dart';
import '../User/Providers/user_providers.dart';

class BasePage extends StatelessWidget {
  final appData = PersistentData();
  final BasePageController _basePageController = Get.find<BasePageController>();

  BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Navigator> navigators =
        List<Navigator>.generate(5, (index) => _buildNavigator(index));
    return GetBuilder<BasePageController>(
      builder: (_) {
        return Obx(
          () => Scaffold(
            body: IndexedStack(
              index: _basePageController.obj,
              children: navigators,
            ),
            bottomNavigationBar: _basePageController.showBottomNavBar.value
                ? BottomNavBar()
                : null,
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
              return appData.loggedIn ? const NotificationPage() : LoginPage();
            case 1:
              return const SearchPage();
            case 2:
              return const HomePage();
            case 3:
              return const FavoritePage();
            case 4:
              return UserInfoPage(user: getUserInfo());

            default:
              return const HomePage();
          }
        });
      },
    );
  }
}
