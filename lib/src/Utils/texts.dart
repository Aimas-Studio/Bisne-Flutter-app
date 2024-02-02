import 'package:flutter/material.dart';

import 'interfaces.dart';

Text boldAppText(String text, double size) {
  return Text(
    text,
    style: TextStyle(
      color: fontAppColor,
      fontWeight: FontWeight.bold,
      fontSize: size,
      fontFamily: 'Poppins',
    ),
  );
}

Text regularAppText(String text, double size) {
  return Text(
    text,
    style: TextStyle(
        color: fontAppColor,
        fontFamily: 'Poppins',
        fontSize: size,
        fontWeight: FontWeight.normal),
  );
}

Text thinAppText(String text, double size) {
  return Text(
    text,
    style: TextStyle(
      color: fontAppColor,
      fontWeight: FontWeight.w300,
      fontFamily: 'Poppins',
      fontSize: size,
    ),
  );
}
