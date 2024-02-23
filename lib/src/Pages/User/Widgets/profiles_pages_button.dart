import 'package:flutter/material.dart';

import '../../../core/Utils/interfaces.dart';
import '../../../core/Utils/texts.dart';

Widget profilesPageButton(String text, VoidCallback function) {
  return SizedBox(
    height: 30,
    child: ElevatedButton(
      style: ButtonStyle(
        side: MaterialStatePropertyAll(
          BorderSide(
            width: 1.5,
            color: fontAppColor.withOpacity(0.3),
          ),
        ),
        elevation: const MaterialStatePropertyAll(0),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        backgroundColor:
            const MaterialStatePropertyAll<Color>(backgroundAppColor),
      ),
      onPressed: function,
      child: lightAppText(text, 13),
    ),
  );
}
