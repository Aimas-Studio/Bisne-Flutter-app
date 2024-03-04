import 'package:flutter/material.dart';

import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/widgets/texts/texts_widgets.dart';
import '../../../user/export.dart';

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
              BoldAppText(text: totalPrice, size: 28),
            ],
          ),
          IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegularAppText(text: getUserInfo().username, size: 13),
                RegularAppText(text: date, size: 12),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
