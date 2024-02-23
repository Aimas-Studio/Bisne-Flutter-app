import 'package:flutter/material.dart';

import '../utils/interfaces.dart';

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
