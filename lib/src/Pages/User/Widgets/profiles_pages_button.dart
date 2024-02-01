import 'package:flutter/material.dart';

import '../../../Utils/interfaces.dart';

Widget profilesPageButton(String text, VoidCallback function) {
  return ElevatedButton(
      style: ButtonStyle(
        side: MaterialStatePropertyAll(
          BorderSide(
            width: 1,
            color: fontAppColor.withOpacity(0.3),
          ),
        ),
        elevation: const MaterialStatePropertyAll(0),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        backgroundColor:
            const MaterialStatePropertyAll<Color>(backgroundAppColor),
      ),
      onPressed: function,
      child: Text(
        text,
        softWrap: false,
        style: const TextStyle(
            fontSize: 13,
            color: Color.fromRGBO(114, 124, 142, 1),
            fontWeight: FontWeight.w300),
      ));
}
