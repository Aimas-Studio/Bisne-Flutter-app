import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/themes_export.dart';
import '../widgets_export.dart';

class CategoriesRow extends StatelessWidget {
  final dynamic controller;
  final List<String> labels;
  final String idController;

  const CategoriesRow(
      {super.key,
      required this.controller,
      required this.labels,
      required this.idController});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buildButtons(context, controller),
    );
  }

  List<Widget> buildButtons(BuildContext context, dynamic controller) {
    List<Widget> buttons = [];

    for (int i = 0; i < labels.length; i++) {
      buttons.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: 30,
            child: Obx(
              () => CategoryButton(
                  isPressed: controller.selectedIndex.value == i,
                  onPressed: () {
                    controller.selectedIndex.value = i;
                    controller.update([idController]);
                  },
                  label: labels[i],
                  maincolor: iconAppColor),
            ),
          ),
        ),
      );
    }

    return buttons;
  }
}
