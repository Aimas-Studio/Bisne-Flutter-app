import 'package:bisne/src/core/presentation/themes/place_holders.dart';
import 'package:flutter/material.dart';

class CustomFadeInImage extends StatelessWidget {
  final ImageProvider image;
  final ImageProvider placeholder;

  const CustomFadeInImage({
    super.key,
    required this.image,
    this.placeholder = placeHolderImageApp,
  });

  @override
  Widget build(context) {
    return FadeInImage(
      placeholder: placeholder,
      image: image,
      fit: BoxFit.cover,
    );
  }
}
