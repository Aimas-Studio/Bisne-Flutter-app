import 'package:flutter/material.dart';

import '../../../Utils/interfaces.dart';

Widget inputTextAppWidget(String labelText,
    {TextEditingController? controller}) {
  return Expanded(
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
  );
}
