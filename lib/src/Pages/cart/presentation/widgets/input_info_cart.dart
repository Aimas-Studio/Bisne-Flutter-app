import 'package:flutter/material.dart';

import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/themes/decorations.dart';

Widget inputTextCartWidget(context, String labelText, IconData iconData,
    {TextEditingController? controller}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.75,
    decoration: whiteBoxDecoration,
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
    ),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: Icon(
            iconData,
            color: iconAppColor,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextField(
            cursorColor: fontAppColor,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
              color: fontAppColor,
            ),
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              label: Text(
                labelText,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: fontAppColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
