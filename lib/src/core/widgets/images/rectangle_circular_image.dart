import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class RectangleCircularImage extends StatelessWidget {
  final ImageProvider? image;
  final ImageProvider placeholder;
  final double size;
  final double borderRadius;

  const RectangleCircularImage({
    this.image,
    this.size = 50,
    this.placeholder = placeHolderImageApp,
    super.key,
    this.borderRadius = 23,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
      ),
      child: FadeInImage(
        placeholder: placeholder,
        image: image ?? placeholder,
        fit: BoxFit.cover,
      ),
    );
  }
}
