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
        size: 150,
        child: image != null
            ? DecoratedBox(
                decoration: BoxDecoration(
                    image: DecorationImage(image: image!, fit: BoxFit.cover),
                    border: Border.all(width: 0.5, color: borderColor)),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.edit,
                      color: bisneColorPrimary,
                    ),
                  ),
                ),
              )
            : DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(width: 2.5, color: borderColor),
                    borderRadius: const BorderRadius.all(Radius.circular(21))),
                child: SizedBox.fromSize(
                  size: const Size(150, 150),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: addImagePlaceHolder,
                  ),
                )),
      ),
    );
  }
}
