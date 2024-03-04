import 'package:bisne/src/Pages/base/presentation/controllers/base_page_controller.dart';
import 'package:bisne/src/Pages/favorite/presentation/screens/favorite_page.dart';
import 'package:bisne/src/Pages/notifications/presentation/screens/notifications_page.dart';
import 'package:bisne/src/Pages/search/presentation/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../../core/presentation/widgets/bottom_nav_bar.dart';
import '../Home/home_page.dart';
import '../auth/presentation/screens/login_page.dart';
import '../user/export.dart';
import '../user/presentation/screens/user_info_page.dart';

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
              // return const NotificationPage();

              return const HomePage();
            case 3:
              // return const NotificationPage();

              return const FavoritePage();
            case 4:
              // return const NotificationPage();

              return UserInfoPage(user: getUserInfo());
            default:
              return const HomePage();
          }
        });
      },
    );
  }
}
