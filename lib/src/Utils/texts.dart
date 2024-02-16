import 'package:flutter/material.dart';

import 'interfaces.dart';

Text boldAppText(String text, double size, {Color? color, int? maxLines}) {
  return Text(
    text,
    style: TextStyle(
      color: color ?? fontAppColor,
      fontSize: size,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
    ),
    softWrap: true,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
  );
}

Text regularAppText(String text, double size, {Color? color, int? maxLines}) {
  return Text(
    text,
    style: TextStyle(
      color: color ?? fontAppColor,
      fontFamily: 'Poppins',
      fontSize: size,
      fontWeight: FontWeight.w400,
    ),
    softWrap: true,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
  );
}

Text thinAppText(String text, double size, {Color? color, int? maxLines}) {
  return Text(
    text,
    style: TextStyle(
      color: color ?? fontAppColor,
      fontFamily: 'Poppins',
      fontSize: size,
      fontWeight: FontWeight.w200,
    ),
    softWrap: true,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
  );
}

Text lightAppText(String text, double size, {Color? color, int? maxLines}) {
  return Text(
    text,
    style: TextStyle(
      color: color ?? fontAppColor,
      fontFamily: 'Poppins',
      fontSize: size,
      fontWeight: FontWeight.w300,
    ),
    softWrap: true,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
  );
}

Text inputText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      fontFamily: 'Neusa',
      fontSize: 11,
      color: fontAppColor.withOpacity(0.5),
    ),
  );
}
