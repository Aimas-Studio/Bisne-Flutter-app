import 'package:bisne/src/Utils/texts.dart';
import 'package:bisne/src/Widgets/circular_image.dart';
import 'package:flutter/material.dart';

import '../../User/Widgets/profiles_pages_button.dart';

Widget shopOrderWidget(
    ImageProvider image, String mainInfo, String date, num price) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      circularImage(image, 45),
      Container(
        margin: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            regularAppText(mainInfo, 16),
            thinAppText(date, 13),
            regularAppText("$price cup", 15),
            profilesPageButton("Ver Pedido", () => {}),
          ],
        ),
      )
    ],
  );
}
