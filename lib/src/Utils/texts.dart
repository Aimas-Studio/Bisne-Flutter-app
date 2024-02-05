import 'package:flutter/material.dart';

import 'interfaces.dart';

Text boldAppText(String text, double size, {Color? color}) {
  return Text(
    text,
    style: TextStyle(
      color: color ?? fontAppColor,
      fontSize: size,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
    ),
    softWrap: true,
  );
}

Text regularAppText(String text, double size, {Color? color}) {
  return Text(text,
      style: TextStyle(
          color: color ?? fontAppColor,
          fontFamily: 'Poppins',
          fontSize: size,
          fontWeight: FontWeight.normal));
}

Text thinAppText(String text, double size, {Color? color}) {
  return Text(
    text,
    style: TextStyle(
      color: color ?? fontAppColor,
      fontFamily: 'Poppins',
      fontSize: size,
      fontWeight: FontWeight.w300,
    ),
  );
}
