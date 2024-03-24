import 'package:bisne/src/core/presentation/themes/colors.dart';
import 'package:bisne/src/core/presentation/widgets/texts/texts_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainButton extends StatelessWidget {
  final Widget text;
  final VoidCallback onPressed;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? width;
  final double? height;

  const MainButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.horizontalPadding,
      this.verticalPadding,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: const MaterialStatePropertyAll(
            ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
          ),
          padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: horizontalPadding ?? 25)),
          backgroundColor: const MaterialStatePropertyAll(bisneColorPrimary)),
      child: text,
    );
  }
}
