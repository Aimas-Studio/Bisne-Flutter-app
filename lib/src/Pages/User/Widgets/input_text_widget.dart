import 'package:bisne/src/Utils/decorations.dart';
import 'package:bisne/src/Utils/texts.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10, top: 20),
          child: Icon(
            iconData,
            color: iconAppColor,
          ),
        ),
        Expanded(
          child: TextField(
            maxLines: null,
            cursorColor: fontAppColor,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 15,
              fontFamily: 'Neusa',
              color: fontAppColor,
            ),
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              label: inputText(labelText),
            ),
          ),
        ),
      ],
    ),
  );
}
