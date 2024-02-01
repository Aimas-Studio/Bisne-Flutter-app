import 'package:flutter/material.dart';

import '../Utils/interfaces.dart';

Widget returnButtonWidget(context) {
  return ElevatedButton(
      onPressed: () => {Navigator.pop(context)},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(backgroundAppColor),
        elevation: MaterialStatePropertyAll(0),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: fontAppColor,
          ),
          Text("Regresar"),
        ],
      ));
}
