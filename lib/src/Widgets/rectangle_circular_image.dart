import 'package:bisne/src/Utils/interfaces.dart';
import 'package:flutter/material.dart';

Widget rectangleCircularImage(ImageProvider imageProvider, double size,
    {ImageProvider placeholder = placeHolderImageApp}) {
  return ClipRRect(
    borderRadius: const BorderRadius.all(
      Radius.circular(23),
    ),
    child: FadeInImage(
      placeholder: placeholder,
      image: imageProvider,
      fit: BoxFit.cover,
    ),
  );
}
