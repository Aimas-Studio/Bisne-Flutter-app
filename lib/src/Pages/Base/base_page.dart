import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../../core/presentation/widgets/bottom_nav_bar.dart';
import '../Favorite/favorite_page.dart';
import '../Home/home_page.dart';
import '../Notifications/notifications_page.dart';
import '../Search/search_page.dart';
import '../auth/presentation/screens/login_page.dart';
import '../user/export.dart';
import '../user/presentation/screens/user_info_page.dart';
import 'base_page_controller.dart';

class BasePage extends StatelessWidget {
  final appData = PersistentData();
  final BasePageController _basePageController = Get.find<BasePageController>();
  List<Navigator> _navigators = [];

  BasePage({super.key}) {
    _navigators =
        List<Navigator>.generate(5, (index) => _buildNavigator(index));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BasePageController>(
      builder: (_) {
        return Obx(
          () => Scaffold(
            body: IndexedStack(
              index: _basePageController.obj,
              children: _navigators,
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
