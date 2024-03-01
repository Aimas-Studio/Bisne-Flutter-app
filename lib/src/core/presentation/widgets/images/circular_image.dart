import 'package:flutter/material.dart';

import '../../themes/colors.dart';

class CircularImage extends StatelessWidget {
  final ImageProvider? image;
  final double size;
  final ImageProvider placeHolder;
  const CircularImage(
      {super.key,
      this.image,
      this.size = 50,
      this.placeHolder = placeHolderImageApp});

  @override
  Widget build(context) {
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
            placeholder: placeHolder,
            image: image ?? placeHolder, //TODO set a default image error
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
