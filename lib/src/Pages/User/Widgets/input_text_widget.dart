import 'package:bisne/src/Utils/decorations.dart';
import 'package:bisne/src/Utils/texts.dart';
import 'package:flutter/material.dart';

import '../../../Utils/interfaces.dart';

Widget whiteLabelInputTextWidget(
  context,
  String labelText, {
  TextEditingController? controller,
  IconData? iconData,
  bool? isComment,
  Function(String s)? onChanged,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.75,
    decoration: whiteBoxDecoration,
    padding: EdgeInsets.symmetric(
      horizontal: isComment != null ? 0 : 10,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: isComment != null ? 0 : 10, top: 20),
          child: Icon(
            iconData,
            color: iconAppColor,
          ),
        ),
        Expanded(
          child: TextField(
            onChanged: onChanged ?? (s) {},
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
              constraints: BoxConstraints(
                minHeight: isComment != null ? 200 : 0,
              ),
              border: InputBorder.none,
              label: inputText(labelText),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget listWhiteLabelInput(
    context, List<(String, IconData, TextEditingController)> content) {
  List<Widget> textsInputs = [];
  for (var element in content) {
    textsInputs.add(whiteLabelInputTextWidget(context, element.$1,
        iconData: element.$2, controller: element.$3));
  }

  return Container(
    width: MediaQuery.of(context).size.width * 0.75,
    decoration: whiteBoxDecoration,
    child: Column(
      children: textsInputs,
    ),
  );
}
