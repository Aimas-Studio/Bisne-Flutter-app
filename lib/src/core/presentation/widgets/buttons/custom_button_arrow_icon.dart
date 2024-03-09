import 'package:flutter/material.dart';

import '../../themes/colors.dart';
import '../texts/texts_widgets.dart';

class CustomButtonArrowIcon extends StatelessWidget {
  final bool enabled;
  final Color color;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final String text;

  const CustomButtonArrowIcon({
    super.key,
    this.color = buttonColor,
    this.onPressed,
    this.width = double.infinity,
    this.height = 70,
    this.text = '',
    this.enabled = true,
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
          shape: const MaterialStatePropertyAll(StadiumBorder()),
          backgroundColor: MaterialStatePropertyAll(color),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child:
                      RegularAppText(text: text, color: Colors.white, size: 20),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: const Icon(Icons.arrow_forward_ios, color: fontAppColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
