import 'package:bisne/src/core/presentation/themes/colors.dart';
import 'package:bisne/src/core/presentation/themes/place_holders.dart';
import 'package:bisne/src/core/presentation/widgets/images/rectangle_circular_image.dart';
import 'package:flutter/material.dart';

class ImagePicker extends StatelessWidget {
  final ImageProvider? image;
  final VoidCallback? onTap;

  const ImagePicker({super.key, this.image, this.onTap});

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: onTap,
      child: RectangleCircularImage(
        child: image != null
            ? DecoratedBox(
                decoration:
                    BoxDecoration(image: DecorationImage(image: image!)),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.edit,
                    color: bisneColorPrimary,
                  ),
                ),
              )
            : addImagePlaceHolder,
      ),
    );
  }
}
