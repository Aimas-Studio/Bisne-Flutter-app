import 'package:flutter/material.dart';

class RectangleCircularImage extends StatelessWidget {
  final double size;
  final double borderRadius;
  final Widget? child;

  const RectangleCircularImage({
    this.size = 50,
    this.child,
    super.key,
    this.borderRadius = 23,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
