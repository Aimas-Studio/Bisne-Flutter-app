import 'package:flutter/material.dart';

const BoxDecoration whiteBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(12)),
  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 30)],
);

class DecoratedWhiteBox extends StatelessWidget {
  final double paddingHorizontal;
  final double paddingVertical;
  final Widget? child;

  const DecoratedWhiteBox({
    super.key,
    this.paddingHorizontal = 10,
    this.paddingVertical = 0,
    this.child,
  });

  @override
  Widget build(context) {
    return DecoratedBox(
      decoration: whiteBoxDecoration,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal, vertical: paddingVertical),
        child: child,
      ),
    );
  }
}
