import 'package:bisne/src/Utils/interfaces.dart';
import 'package:flutter/material.dart';

Widget(ImageProvider imageProvider, double size,
    {ImageProvider placeholder = placeHolderImageApp}) {
  return Container(
    decoration: const ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      shadows: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 20,
        )
      ],
    ),
    child: SizedBox.fromSize(
      size: Size.square(size),
      child: FadeInImage(
        placeholder: placeholder,
        image: imageProvider,
        fit: BoxFit.cover,
      ),
    ),
  );
}
