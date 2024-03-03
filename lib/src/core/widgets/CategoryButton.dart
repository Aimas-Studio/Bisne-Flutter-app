import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../presentation/themes/colors.dart';
import '../presentation/widgets/texts/texts_widgets.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.isPressed,
  });

  final Callback onPressed;
  final bool isPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        side: BorderSide(
            color: isPressed ? Colors.transparent : Colors.black26, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
        ),
        backgroundColor: isPressed ? bisneColorPrimary : Colors.transparent,
      ),
      child: RegularAppText(
          text: label,
          size: 14,
          color: isPressed ? Colors.white : iconAppColor),
    );
  }
}
