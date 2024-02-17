import 'package:bisne/src/Utils/interfaces.dart';
import 'package:flutter/material.dart';

Widget rectangleCircularImage(ImageProvider imageProvider, double size,
    {ImageProvider placeholder = placeHolderImageApp}) {
  return SizedBox.fromSize(
    size: Size.square(size),
    child: Container(
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        shadows: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20,
          )
        ],
      ),
      child: FadeInImage(
        placeholder: placeholder,
        image: imageProvider,
        fit: BoxFit.cover,
      ),
    ),
  );
}
