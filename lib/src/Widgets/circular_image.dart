import 'package:bisne/src/Utils/interfaces.dart';
import 'package:flutter/material.dart';

Widget circularImage(ImageProvider image, double size,
    {ImageProvider placeholder = placeHolderImageApp}) {
  return ClipOval(
    child: SizedBox.fromSize(
      size: Size.fromRadius(size),
      child: FadeInImage(
        placeholder: placeholder,
        image: image,
        fit: BoxFit.fill,
      ),
    ),
  );
}
