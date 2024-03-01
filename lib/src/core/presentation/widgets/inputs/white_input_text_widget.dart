import 'package:flutter/material.dart';

import '../../themes/colors.dart';
import '../texts/texts_widgets.dart';

class WhiteInputTextWidget extends StatelessWidget {
  final String? hintText;
  final String? helperText;
  final String? labelText;
  final TextEditingController? controller;
  final bool enabled;
  final bool isComment;
  final IconData? prefixIcon;
  final Function(String)? onChange;
  final Color fillColor;
  final Color cursorColor;

  const WhiteInputTextWidget({
    super.key,
    this.hintText,
    this.controller,
    this.enabled = true,
    this.prefixIcon,
    this.onChange,
    this.labelText,
    this.isComment = false,
    this.fillColor = Colors.white,
    this.cursorColor = bisneColorPrimary,
    this.helperText,
  });

  @override
  Widget build(context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        enabled: enabled,
        icon: Icon(prefixIcon, color: fontAppColor),
        label: InputLightText(text: labelText ?? ''),
        hintText: hintText ?? '',
      ),
      cursorColor: cursorColor,
      onChanged: onChange,
    );
  }
}
