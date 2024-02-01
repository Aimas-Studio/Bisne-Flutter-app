import 'package:flutter/material.dart';

import '../../../Utils/interfaces.dart';
import '../../User/Providers/user_providers.dart';

Widget totalOrderWidget(String date, String totalPrice) {
  return Row(
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
          Text(
            totalPrice,
            style: const TextStyle(
              color: fontAppColor,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ],
      ),
      Column(
        children: [
          Text(
            getUsername(),
            style: const TextStyle(
              color: fontAppColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            date,
            style: const TextStyle(
              color: fontAppColor,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      )
    ],
  );
}
