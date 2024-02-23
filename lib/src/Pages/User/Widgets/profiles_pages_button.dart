import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';
import '../../../core/widgets/texts/texts_widgets.dart';

Widget profilesPageButton(String text, VoidCallback function) {
  return SizedBox(
    height: 30,
    child: ElevatedButton(
      style: ButtonStyle(
        side: MaterialStatePropertyAll(
          BorderSide(
            width: 1.5,
            color: fontAppColor.withOpacity(0.3),
          ),
        ),
        elevation: const MaterialStatePropertyAll(0),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        backgroundColor:
            const MaterialStatePropertyAll<Color>(backgroundAppColor),
      ),
      onPressed: function,
      child: LightAppText(text: text, size: 13),
    ),
  );
}

class ProfilesPageButton extends StatelessWidget {
  final double borderWidth;
  final double height;
  final double? width;
  final VoidCallback? onPressed;
  final bool enabled;
  final Color borderColor;
  final Color color;
  final Widget? child;

  const ProfilesPageButton({
    super.key,
    this.borderWidth = 1.5,
    this.onPressed,
    this.enabled = true,
    this.color = backgroundAppColor,
    this.child,
    this.width,
    this.height = 30,
    this.borderColor = fontAppColor,
  });

  @override
  Widget build(context) {
    return SizedBox(
      height: height,
      child: OutlinedButton(
        style: ButtonStyle(
          side: MaterialStatePropertyAll(
              BorderSide(width: borderWidth, color: color)),
          shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
          backgroundColor: MaterialStatePropertyAll(color),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
