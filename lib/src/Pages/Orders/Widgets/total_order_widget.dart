import 'package:bisne/src/Utils/texts.dart';
import 'package:flutter/material.dart';

import '../../../Utils/interfaces.dart';
import '../../User/Providers/user_providers.dart';

Widget totalOrderWidget(context, String date, String totalPrice) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.15,
    decoration: const BoxDecoration(
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              "Total",
              style: TextStyle(
                fontWeight: FontWeight.w200,
                color: fontAppColor.withOpacity(0.5),
              ),
            ),
            boldAppText(totalPrice, 28),
          ],
        ),
        Column(
          children: [
            regularAppText(getUserInfo().username, 13),
            regularAppText(date, 12),
          ],
        )
      ],
    ),
  );
}
