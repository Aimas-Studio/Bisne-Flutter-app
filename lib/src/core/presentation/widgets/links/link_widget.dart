import 'package:bisne/src/core/presentation/widgets/texts/texts_widgets.dart';
import 'package:flutter/material.dart';

class CustomLinkWidget extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback? onPressed;
  final double size;

  const CustomLinkWidget({
    required this.text,
    super.key,
    this.color = Colors.blueAccent,
    this.onPressed,
    this.size = 15,
  });

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: onPressed,
      child: LightAppText(text: text, color: color, size: size),
    );
  }
}
