import 'package:bisne/src/core/presentation/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../texts/texts_widgets.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.isPressed,
    this.maincolor = bisneColorPrimary,
  });

  final Callback onPressed;
  final bool isPressed;
  final String label;
  final Color maincolor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        side: const BorderSide(color: Colors.transparent),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: isPressed ? maincolor : iconAppColor2,
      ),
      child: RegularAppText(
          text: label,
          size: 14,
          color: isPressed ? Colors.white : iconAppColor),
    );
  }
}
