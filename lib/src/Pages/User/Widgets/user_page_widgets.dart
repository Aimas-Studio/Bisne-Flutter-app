//Flutter Imports
import 'package:bisne/src/Utils/texts.dart';
import 'package:flutter/material.dart';

import '../../../Utils/Entities/content_panel.dart';
import '../../../Utils/interfaces.dart';

Widget userServicesList(List<ContentPanel> content, context) {
  return Container(
    padding: const EdgeInsets.only(left: 15, top: 10),
    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    //add box shadow for elevation effect
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12))),
    child: Column(
      children: getServices(content, context),
    ),
  );
}

List<Widget> getServices(List<ContentPanel> content, context) {
  List<Widget> serviceList = [];
  for (var element in content) {
    serviceList
      ..add(
        ElevatedButton(
          style: const ButtonStyle(
            elevation: MaterialStatePropertyAll(0),
            backgroundColor: MaterialStatePropertyAll(backgroundAppColor),
          ),
          onPressed: () => element.function(context),
          child: Row(
            children: [
              Icon(element.iconData, color: iconAppColor, size: 25),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: regularAppText(element.title, 13),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 12,
                color: iconAppColor,
              ),
            ],
          ),
        ),
      )
      ..add(const Divider());
  }
  serviceList.removeLast();
  serviceList.add(const SizedBox(height: 8));
  return serviceList;
}
