import 'package:bisne/src/Pages/Base/base_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/interfaces.dart';

Widget returnButtonWidget(context) {
  return SizedBox(
    width: 40,
    height: 40,
    child: IconButton(
        onPressed: () => {
              Get.find<BasePageController>().showBottomNavBar.value = true,
              Navigator.pop(context),
            },
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          elevation: MaterialStatePropertyAll(0),
        ),
        icon: const Padding(
          padding: EdgeInsets.only(left: 5),
          child: Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: iconAppColor,
          ),
        )),
  );
}
