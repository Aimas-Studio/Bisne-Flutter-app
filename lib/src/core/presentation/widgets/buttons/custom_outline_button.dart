import 'package:flutter/material.dart';

import '../../themes/colors.dart';

//TODO add styles when button is disabled
class OutlineAppButton extends StatelessWidget {
  final double borderWidth;
  final double height;
  final double? width;
  final VoidCallback? onPressed;
  final bool enabled;
  final Color borderColor;
  final Color color;
  final Widget? child;
  final EdgeInsets? padding;

  const OutlineAppButton({
    super.key,
    this.borderWidth = 1.5,
    this.onPressed,
    this.enabled = true,
    this.color = backgroundAppColor,
    this.child,
    this.width,
    this.height = 30,
    this.borderColor = fontAppColor,
    this.padding,
  });

  @override
  Widget build(context) {
    return SizedBox(
      height: height,
      child: OutlinedButton(
        style: ButtonStyle(
          padding: MaterialStatePropertyAll(
              padding ?? const EdgeInsets.symmetric(horizontal: 12)),
          side: MaterialStatePropertyAll(BorderSide(
              width: borderWidth, color: borderColor.withOpacity(0.5))),
          shape: const MaterialStatePropertyAll(StadiumBorder()),
          backgroundColor: MaterialStatePropertyAll(color),
        ),
        onPressed: enabled ? onPressed : () {},
        child: child,
      ),
    );
  }
}
