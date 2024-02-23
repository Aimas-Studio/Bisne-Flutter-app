import 'package:bisne/src/Pages/Base/base_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import 'texts/texts_widgets.dart';

Widget returnButtonWidget(context) {
  return ElevatedButton(
      onPressed: () => {
            Get.find<BasePageController>().showBottomNavBar.value = true,
            Navigator.pop(context),
          },
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(backgroundAppColor),
        elevation: MaterialStatePropertyAll(0),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: fontAppColor,
          ),
          RegularAppText(text: "Regresar", size: 18),
        ],
      ));
}
