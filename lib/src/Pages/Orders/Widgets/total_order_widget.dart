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
    child: Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
          IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                regularAppText(getUserInfo().username, 13),
                regularAppText(date, 12),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
