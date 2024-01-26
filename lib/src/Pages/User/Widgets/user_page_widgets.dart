//Flutter Imports
import 'package:flutter/material.dart';

import '../../../Utils/interfaces.dart';

Widget userServicesList(Map<IconData, String> content) {
  return Container(
    padding: const EdgeInsets.only(left: 15, top: 10),
    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    //add box shadow for elevation effect
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12))),
    child: Column(
      children: getServices(content),
    ),
  );
}

List<Widget> getServices(Map<IconData, String> content) {
  List<Widget> serviceList = [];
  content.forEach((icon, text) {
    serviceList
      ..add(Row(
        children: [
          Icon(icon, color: iconAppColor, size: 25),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                text,
                style: const TextStyle(
                  color: fontAppColor,
                ),
              ),
            ),
          ),
          IconButton(
              style: const ButtonStyle(),
              onPressed: () => {},
              icon: const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 12,
                color: iconAppColor,
              ))
        ],
      ))
      ..add(const Divider());
  });
  serviceList.removeLast();
  serviceList.add(const SizedBox(height: 8));
  return serviceList;
}
