import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/colors.dart';
import '../../utils/custom_icons.dart';
import '../../utils/decorations.dart';
import '../../utils/validations.dart';
import '../texts/texts_widgets.dart';

// Widget listWhiteLabelInput(
//     context, List<(String, IconData, TextEditingController)> content) {
//   List<Widget> textsInputs = [];
//   for (var element in content) {
//     textsInputs.add(whiteLabelInputTextWidget(context, element.$1,
//         iconData: element.$2, controller: element.$3));
//   }
//
//   return Container(
//     width: MediaQuery.of(context).size.width * 0.75,
//     decoration: whiteBoxDecoration,
//     child: Column(
//       children: textsInputs,
//     ),
//   );
// }

Widget passwordInputText(
  context, {
  required TextEditingController controller,
  required Function(String s) onChange,
}) {
  String? error = AppValidations.validatePassword(controller.value.text);

  return Container(
    width: MediaQuery.of(context).size.width * 0.75,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: whiteBoxDecoration,
    child: TextField(
      onChanged: onChange,
      style: _inputStyle,
      controller: controller,
      decoration: InputDecoration(
        icon: const Icon(CustomIcons.password, color: fontAppColor),
        border: InputBorder.none,
        label: const InputLightText(text: "CONTRASEÑA"),
        errorText: error,
      ),
    ),
  );
}

const TextStyle _inputStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontSize: 15,
  fontFamily: 'Neusa',
  color: fontAppColor,
);

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
