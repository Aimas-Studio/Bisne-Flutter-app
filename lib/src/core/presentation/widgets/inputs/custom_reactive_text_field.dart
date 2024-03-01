import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../themes/colors.dart';
import '../texts/texts_widgets.dart';

class CustomReactiveTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String formName;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final bool isComment;
  final bool enabled;
  final bool passwordFieldShowOrHide;
  final IconData? prefixIcon;
  final Function(FormControl formControl)? onChange;
  final Color fillColor;
  final Color cursorColor;

  const CustomReactiveTextField({
    super.key,
    required this.formName,
    this.hintText,
    this.labelText,
    this.passwordFieldShowOrHide = false,
    this.onChange,
    this.prefixIcon,
    this.enabled = true,
    this.fillColor = Colors.white,
    this.cursorColor = bisneColorPrimary,
    this.helperText,
    this.isComment = false,
    this.controller,
  });

  @override
  State<CustomReactiveTextField> createState() =>
      _CustomReactiveTextFieldState();
}

class _CustomReactiveTextFieldState extends State<CustomReactiveTextField> {
  late bool obscureText;

  @override
  void initState() {
    obscureText = widget.passwordFieldShowOrHide;
    super.initState();
  }

  @override
  Widget build(context) {
    return ReactiveTextField(
      onChanged: widget.onChange,
      formControlName: widget.formName,
      controller: widget.controller,
      cursorColor: widget.cursorColor,
      decoration: InputDecoration(
        enabled: widget.enabled,
        icon: Icon(widget.prefixIcon, color: fontAppColor),
        label: InputLightText(text: widget.labelText ?? ''),
        helperText: widget.helperText,
        hintText: widget.hintText,
        filled: true,
        fillColor: widget.fillColor,
        suffixIcon: widget.passwordFieldShowOrHide
            ? GestureDetector(
                dragStartBehavior: DragStartBehavior.start,
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: const Color.fromRGBO(103, 103, 103, 1),
                ),
              )
            : null,
        border: const UnderlineInputBorder(),
        constraints: BoxConstraints(minHeight: widget.isComment ? 200 : 0),
      ),
      obscureText: obscureText,
    );
  }
}
