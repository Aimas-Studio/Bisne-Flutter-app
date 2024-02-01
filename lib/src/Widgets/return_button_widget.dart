import 'package:flutter/material.dart';
import 'package:widget_factory/Utils/interfaces.dart';
import 'package:widget_factory/Utils/texts.dart';

Widget returnButtonWidget() {
  return ElevatedButton(
      onPressed: () => {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(backgroundAppColor),
        elevation: MaterialStatePropertyAll(0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: fontAppColor,
          ),
          regularAppText("Regresar", 14),
        ],
      ));
}
