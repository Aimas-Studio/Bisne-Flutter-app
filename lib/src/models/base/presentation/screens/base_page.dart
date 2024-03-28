import 'package:bisne/src/models/home/presentations/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../../../auth/presentation/screens/login_page.dart';
import '../../../favorite/presentation/screens/favorite_page.dart';
import '../../../home/presentations/screens/home_page.dart';
import '../../../notifications/presentation/screens/notifications_page.dart';
import '../../../search/presentation/screens/search_page.dart';
import '../../../user/export.dart';
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
        List<Navigator> navigators = List<Navigator>.generate(
            5, (index) => _buildNavigator(index, basePageController));
        return Scaffold(
          body: IndexedStack(
            index: basePageController.obj,
            children: navigators,
          ),
          bottomNavigationBar: basePageController.showBottomNavBar.value
              ? BottomNavBar(basePageController: basePageController)
              : null,
        );
      },
    );
  }

  Navigator _buildNavigator(
      int indexPage, BasePageController basePageController) {
    return Navigator(
      key: basePageController.navigatorKeys[indexPage],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (_) {
          switch (indexPage) {
            case 0:
              // return const NotificationPage();
              return appData.loggedIn
                  ? const NotificationPage()
                  : const LoginPage();
            case 1:
              // return const NotificationPage();
              return const SearchPage();
            case 2:
              // return const NotificationPage();
              return const HomePage();
            case 3:
              // return const NotificationPage();
              return appData.loggedIn
                  ? const FavoritePage()
                  : const LoginPage();

            case 4:
              // return const NotificationPage();
              return appData.loggedIn
                  ? UserInfoPage(
                      user: getUserInfo(),
                      isAdmin: PerData.shopExists,
                    )
                  : const LoginPage();
            default:
              return const HomePage();
          }
        });
      },
    );
  }
}
