import 'package:flutter/material.dart';

import '../Utils/interfaces.dart';

Widget circularImage(ImageProvider image, double size,
    {ImageProvider placeholder = placeHolderImageApp}) {
  return Container(
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 20,
        )
      ],
    ),
    child: ClipOval(
      child: SizedBox.fromSize(
        size: Size.fromRadius(size),
        child: FadeInImage(
          placeholder: placeholder,
          image: image,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
