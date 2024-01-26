import 'package:flutter/material.dart';

import '../../../Utils/interfaces.dart';
import '../../User/Widgets/profile_widget.dart';
import '../../User/Widgets/profiles_pages_button.dart';

Widget shopOrderWidget(
    ImageProvider image, String mainInfo, String date, num price) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      ProfileWidget.profilePhoto(image, 50),
      Container(
        margin: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mainInfo,
              style: const TextStyle(
                //TODO Refactor this
                color: fontAppColor,
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              date,
              style: const TextStyle(
                color: fontAppColor,
                fontSize: 13,
                fontWeight: FontWeight.w200,
              ),
            ),
            Text(
              "$price cup",
              style: const TextStyle(
                color: fontAppColor,
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
            ),
            profilesPageButton("Ver Pedido", () => {}),
          ],
        ),
      )
    ],
  );
}

Widget productOrderWidget() {
  return Row();
}
