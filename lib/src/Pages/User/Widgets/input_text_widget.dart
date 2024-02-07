import 'package:bisne/src/Utils/decorations.dart';
import 'package:flutter/material.dart';

import '../../../Utils/interfaces.dart';

Widget whiteLabelInputTextWidget(context, String labelText, IconData iconData,
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
