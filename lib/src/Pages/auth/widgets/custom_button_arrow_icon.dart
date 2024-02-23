import 'package:bisne/src/core/utils/interfaces.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/texts.dart';

class CustomButtonArrowIcon extends StatelessWidget {
  final bool enabled;
  final Color color;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final Widget? child;

  const CustomButtonArrowIcon({
    super.key,
    this.color = buttonColor,
    this.onPressed,
    this.width = double.infinity,
    this.height = 70,
    this.child,
    this.enabled = false,
  });

  @override
  Widget build(context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : () {},
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          backgroundColor: MaterialStatePropertyAll(color),
        ),
        child: child,
      ),
    );
  }
}

final defaultButtonChild = Padding(
  padding: const EdgeInsets.symmetric(horizontal: 14),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      const Expanded(
        child: Align(
          alignment: Alignment.center,
          child:
          RegularAppText(text: "INGRESAR", color: Colors.white, size: 20),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(5),
        decoration:
        const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: const Icon(Icons.arrow_forward_ios, color: fontAppColor),
      ),
    ],
  ),
);