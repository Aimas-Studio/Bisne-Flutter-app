import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../../../auth/presentation/screens/login_page.dart';
import '../../../favorite/presentation/screens/favorite_page.dart';
import '../../../home/home_page.dart';
import '../../../notifications/presentation/screens/notifications_page.dart';
import '../../../search/presentation/screens/search_page.dart';
import '../../../user/export.dart';

final persistentData = PersistentData();

class BasePageController extends GetxController {
  static String idController = 'basePageController';
  final showBottomNavBar = true.obs;
  final _obj = 2.obs;

  late List<Navigator> navigators;

  BasePageController() {
    navigators = List<Navigator>.generate(5, (index) => _buildNavigator(index));
  }

  set obj(value) {
    _obj.value = value;
    update([idController]);
  }

  get obj => _obj.value;

  final Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
  };

  Navigator _buildNavigator(int indexPage) {
    return Navigator(
      key: navigatorKeys[indexPage],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (_) {
          switch (indexPage) {
            case 0:
              return persistentData.loggedIn
                  ? const NotificationPage()
                  : LoginPage();
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
