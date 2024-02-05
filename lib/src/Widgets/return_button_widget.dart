import 'package:bisne/src/Utils/interfaces.dart';
import 'package:bisne/src/Utils/texts.dart';
import 'package:flutter/material.dart';

Widget returnButtonWidget(context) {
  return ElevatedButton(
      onPressed: () => {Navigator.pop(context)},
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
            size: 24,
            color: fontAppColor,
          ),
          regularAppText("Regresar", 24),
        ],
      ));
}
