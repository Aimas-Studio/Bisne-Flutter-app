import 'package:bisne/src/models/favorite/controller/favorite_page_controller.dart';
import 'package:bisne/src/models/home/presentations/controllers/home_page_controller.dart';
import 'package:bisne/src/models/notifications/presentation/controller/notification_controller.dart';
import 'package:bisne/src/models/notifications/presentation/screens/notifications_page.dart';
import 'package:bisne/src/models/search/presentation/controllers/search_page_controller.dart';
import 'package:bisne/src/models/user/presentation/controllers/user_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/themes/colors.dart';
import '../../../notifications/export.dart';
import '../controllers/base_page_controller.dart';
import '../screens/base_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.basePageController});

  final BasePageController basePageController;

  @override
  Widget build(BuildContext context) {
    final PageIds = [
      NotificationController.id,
      SearchPageController.id,
      HomePageController.idController,
      FavoritePageController.id,
      UserInfoController.id
    ];
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 186, 185, 185),
                blurRadius: 10,
                spreadRadius: 1)
          ]),
      child: SizedBox(
          height: 75,
          width: context.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NotificationButton(
                      icon: Icons.notifications_none,
                      selected: basePageController.obj == 0,
                      onPressed: () {
                        onTabTapped(0);
                        Get.find<NotificationController>().update([PageIds[0]]);
                      },
                    ),
                    IconBottomBar(
                      icon: Icons.search_outlined,
                      selected: basePageController.obj == 1,
                      onPressed: () {
                        onTabTapped(1);
                        Get.find<SearchPageController>().update([PageIds[0]]);
                      },
                    ),
                    IconBottomBar(
                      icon: Icons.home_outlined,
                      selected: basePageController.obj == 2,
                      onPressed: () {
                        onTabTapped(2);
                        Get.find<HomePageController>().update([PageIds[0]]);
                      },
                    ),
                    IconBottomBar(
                        icon: Icons.favorite_border,
                        selected: basePageController.obj == 3,
                        onPressed: () {
                          onTabTapped(3);
                          Get.find<FavoritePageController>()
                              .update([PageIds[0]]);
                        }),
                    IconBottomBar(
                      icon: Icons.person_outline_outlined,
                      selected: basePageController.obj == 4,
                      onPressed: () {
                        onTabTapped(4);
                        if (appData.loggedIn)
                          Get.find<UserInfoController>().update([PageIds[0]]);
                      },
                    )
                  ],
                )),
          )),
    );
  }

  void onTabTapped(int index) {
    if (index == basePageController.obj) {
      // Si la sección seleccionada es la misma que la sección actual,
      // vuelve a la página de inicio de la sección.
      basePageController.navigatorKeys[index]?.currentState
          ?.popUntil((route) => route.isFirst);
    } else {
      // Si la sección seleccionada es diferente, cambia a la nueva sección.
      basePageController.obj = index;
    }
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final normalColor = Colors.white;
  final selectColor = const Color.fromARGB(25, 119, 119, 119);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(50),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.width > 550
                    ? 25
                    : 0), // Ajusta este valor según tus necesidades
            child: Container(
              decoration: BoxDecoration(
                  color: selected ? selectColor : normalColor,
                  borderRadius: BorderRadius.circular(50.0)),
              width: 55,
              height: 55,
              child: Icon(icon,
                  size: 35, color: const Color.fromARGB(255, 30, 30, 30)),
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  const NotificationButton(
      {Key? key,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final normalColor = Colors.white;
  final selectColor = const Color.fromARGB(25, 119, 119, 119);

  @override
  Widget build(context) {
    return Expanded(
      child: Center(
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(50),
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.width > 550 ? 25 : 0),
            child: Container(
              decoration: BoxDecoration(
                  color: selected ? selectColor : normalColor,
                  borderRadius: BorderRadius.circular(50.0)),
              width: 55,
              height: 55,
              child: Badge(
                offset: Offset(context.width > 550 ? 3 : 0, 2),
                largeSize: 20,
                backgroundColor: bisneColorPrimary,
                alignment: AlignmentDirectional.topEnd,
                isLabelVisible: getNotificationCount() != 0,
                label: Container(
                  width: 13,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: bisneColorPrimary,
                  ),
                  child: Center(
                    child: Text(
                      getNotificationCount() > 99
                          ? '99+'
                          : getNotificationCount().toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getNotificationCount() > 9 ? 8 : 11,
                      ),
                    ),
                  ),
                ),
                child: Center(
                  child: Icon(icon,
                      size: 35, color: const Color.fromARGB(255, 30, 30, 30)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
