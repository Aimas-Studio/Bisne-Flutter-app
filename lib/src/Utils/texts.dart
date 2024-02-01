import 'package:flutter/material.dart';

import 'interfaces.dart';

Text boldAppText(String text, double size) {
  return Text(
    text,
    style: TextStyle(
      color: fontAppColor,
      fontWeight: FontWeight.bold,
      fontSize: size,
    ),
  );
}

Text regularAppText(String text, double size) {
  return Text(
    text,
    style: TextStyle(
      color: fontAppColor,
      fontWeight: FontWeight.normal,
      fontSize: size,
    ),
  );
}

Text thinAppText(String text, double size) {
  return Text(
    text,
    style: TextStyle(
      color: fontAppColor,
      fontWeight: FontWeight.w300,
      fontSize: size,
    ),
  );
}
