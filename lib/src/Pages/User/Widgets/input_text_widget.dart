import 'package:flutter/material.dart';

import '../../../core/Utils/custom_icons.dart';
import '../../../core/Utils/decorations.dart';
import '../../../core/Utils/interfaces.dart';
import '../../../core/Utils/texts.dart';
import '../../../core/Utils/validations.dart';

Widget whiteLabelInputTextWidget(
  context,
  String labelText, {
  String? hintText,
  IconData? iconData,
  TextEditingController? controller,
  bool isComment = false,
  Function(String s)? onChanged,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.75,
    decoration: whiteBoxDecoration,
    padding: EdgeInsets.symmetric(horizontal: isComment ? 0 : 10),
    child: TextField(
      onChanged: onChanged ?? (s) {},
      maxLines: null,
      cursorColor: fontAppColor,
      style: _inputStyle,
      controller: controller,
      decoration: InputDecoration(
        label: inputText(labelText),
        hintText: hintText ?? "",
        icon: Icon(iconData, color: fontAppColor),
        constraints: BoxConstraints(minHeight: isComment ? 200 : 0),
        border: InputBorder.none,
      ),
    ),
  );
}

Widget listWhiteLabelInput(
    context, List<(String, IconData, TextEditingController)> content) {
  List<Widget> textsInputs = [];
  for (var element in content) {
    textsInputs.add(whiteLabelInputTextWidget(context, element.$1,
        iconData: element.$2, controller: element.$3));
  }

  return Container(
    width: MediaQuery.of(context).size.width * 0.75,
    decoration: whiteBoxDecoration,
    child: Column(
      children: textsInputs,
    ),
  );
}

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
        label:
            inputText("CONTRASEÑA", color: error == null ? null : Colors.red),
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
