import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:bisne/src/Pages/Base/base_page_controller.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final BasePageController _basePageController = Get.find<BasePageController>();

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconBottomBar(
                        icon: Icons.notifications_none,
                        selected: _basePageController.obj == 0,
                        onPressed: () {}),
                    IconBottomBar(
                        icon: Icons.search_outlined,
                        selected: _basePageController.obj == 1,
                        onPressed: () {
                          _basePageController.obj = 1;
                        }),
                    IconBottomBar(
                        icon: Icons.home_outlined,
                        selected: _basePageController.obj == 2,
                        onPressed: () {
                          _basePageController.obj = 2;
                        }),
                    IconBottomBar(
                        icon: Icons.favorite_border,
                        selected: _basePageController.obj == 3,
                        onPressed: () {}),
                    IconBottomBar(
                        icon: Icons.person_outline_outlined,
                        selected: _basePageController.obj == 4,
                        onPressed: () {
                          _basePageController.obj = 4;
                        })
                  ],
                )),
          )),
    );
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
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: selected ? selectColor : normalColor,
            borderRadius: BorderRadius.circular(50.0)),
        width: 45,
        height: 45,
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon,
              size: 30, color: const Color.fromARGB(255, 30, 30, 30)),
        ),
      ),
    );
  }
}
