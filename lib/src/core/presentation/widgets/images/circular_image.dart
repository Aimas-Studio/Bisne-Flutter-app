import 'package:bisne/src/core/presentation/themes/colors.dart';
import 'package:flutter/material.dart';

import '../../themes/place_holders.dart';

//TODO make this widget and the rectanglecircular widget the same

class CircularImage extends StatelessWidget {
  final Widget? child;
  final double size;
  final bool shadow;
  final ImageProvider placeHolder;

  const CircularImage({
    super.key,
    this.child,
    this.size = 50,
    this.placeHolder = placeHolderImageApp,
    this.shadow = true,
  });

  @override
  Widget build(context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: fontAppColor),
        shape: BoxShape.circle,
        boxShadow: shadow
            ? [
                const BoxShadow(
                  color: Colors.grey,
                  blurRadius: 20,
                ),
              ]
            : [],
      ),
      child: ClipOval(
        child: SizedBox.fromSize(
          size: Size.fromRadius(size),
          child: child,
        ),
      ),
    );
  }
}
